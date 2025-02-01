#!/usr/bin/env bash
# set -e

# Pasta de destino para os arquivos gerados pela execução desse script
OUTPUT_DIR=$1

# Pasta que contem as emulações de uma fase já descompactados
# A caminho do diretório não pode conter "/" no final
DIR_EMULATIONS=$2

# Directory that contain the Python and Shell scripts
SHELL_SCRIPT="/wp3-experiment/Scripts/Shell_Script"
PYTHON_SCRIPT="/wp3-experiment/Scripts/Python_Script"

# Path to the file that contains the ip address of all the devices in the experiment
IOT_SERVER_IP_ADDR="/wp3-experiment/Scripts/Python_Script/ips.json"

# Activate the python virtual envinronment 
source "$PYTHON_SCRIPT/venv/bin/activate"

# Salve the path of the current directory
WORK_DIR=$(pwd)

#Cria uma pasta tmp para os arquivos tranpostos da perda de pacote TCP
TMP="/tmp/wp3_analysis/"
mkdir -p "$TMP/packet_loss/tcp/experiment_analysis_window"

# Change the active diretory 
# for ls commmnad capture only the folder names
cd "$DIR_EMULATIONS" || exit
tar_files=$(ls -- *.tar.gz)

# Return the active diretory for the one that call this script
cd "$WORK_DIR" || exit

echo "***************************************"
echo "Log:  Start For Loop for each emulation"
echo "***************************************"

for tar_file in $tar_files
do
    # Descompact the tar.gz file
    tar -C "$DIR_EMULATIONS" -zxf "$DIR_EMULATIONS/$tar_file" --one-top-level

    # filename="19122023_0416_emulation34.tar.gz"
    # base_filename=$(basename "$filename" .tar.gz)
    # echo "$base_filename"  # Output: 19122023_0416_emulation34
    emulation_name=$(basename "$tar_file" .tar.gz)
    emulation_name="$emulation_name/"

    # Create a folder with information about the emulation  
    # Example: $OUTPUT_DIR/28082023_1541_emulation7
    mkdir -p "$OUTPUT_DIR/$emulation_name"

    # Summary of iot delay for each network
    mkdir -p "$OUTPUT_DIR/$emulation_name/Delay/UDP"

    # Path to an emulation
    emulation_path="$DIR_EMULATIONS""$emulation_name/wp3-experiment/Volumes/Output"

    # GET the time of the experiment start
    file_emulation_start_time="$emulation_path/tempo_inicializacao.txt"

    # Check if the file exists
    if [ -f "$file_emulation_start_time" ]; then
        # Read the first line of the file
        read -r first_line < "$file_emulation_start_time"

        # Get the time of the experiment begin from the first line
        TIME=( $(grep -oE -m 1 "[0-9]+" <<< "$first_line") )
    else
        echo "File not found: $file_emulation_start_time"
    fi

    #Script para calcular o delay entre a comunicação entre os servidores
    python3 $PYTHON_SCRIPT/tcp_delay_script.py \
        -i "$emulation_path/Server" \
        -o "$OUTPUT_DIR/$emulation_name" -t $TIME
    
    for ((i=1; i<=5; i++))
    do  
        ( 
        ################################################################################################################################################
        ############################################  Converte pcap para csv    ########################################################################    
        ################################################################################################################################################
        
        # Quebra cada arquivo pcap em arquivos menores
        cd "$emulation_path/Server/Server_0$i"
        files=$(ls | grep "\.pcap")
        
        cd $WORK_DIR
        for file in $files
        do
            # Descrição de cada parametro
            # break_pcap_files_into_smaller_parts.sh \
            #     Pasta q contém os arquivos pcaps \
            #     Nome do Arquivo q será quebrado em arquivos menores 
            #     Pasta onde será salvo os arquivos menores

            $SHELL_SCRIPT/break_pcap_files_into_smaller_parts.sh \
                "$emulation_path/Server/Server_0$i" \
                "$file" \
                "$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/breaked_parts"
        done

        # Converte os arquivos menores em csv
        
        # Descrição de cada parametro
        # convert_server_pcap_csv.sh \
        #     Pasta q contém os arquivos pcaps \
        #     Pasta onde será salvo os arquivos csv

        $SHELL_SCRIPT/convert_server_pcap_csv.sh \
            "$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/breaked_parts" \
            "$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/csv_files"

        ################################################################################################################################################
        ############################################        Delay TCP        ###########################################################################    
        ################################################################################################################################################
        
        # Recupera o nome da /home/samuelbrisio/WP3_Serveremulacão descartando o '/' no final da string
        emulation_id="${emulation_name%/}"

        # Sintese do delay nas messagens entre os Servidores
        mkdir -p "$TMP/delay/tcp/server/experiment_analysis_window/net_0$i/"

        python3 $PYTHON_SCRIPT/summary_udp_delay.py \
            -i "$OUTPUT_DIR/$emulation_name/SMDs/smd_0$i.csv" \
            -o "$TMP/delay/tcp/server/experiment_analysis_window/net_0$i/$emulation_id.csv" \
            --window 60 1200 \
            --mode server \
            --id $emulation_id

        echo "End TCP Delay"
        ############################################ End Delay TCP ########################################################################### 








        ################################################################################################################################################
        #############################################  UDP Delay for the entire emulation ##############################################################
        ################################################################################################################################################

        mkdir -p "$TMP/delay/udp/iots_csv/net_0$i"
        
        $SHELL_SCRIPT/convert_Iot-pcap_to_csv.sh \
            "$TMP/delay/udp/iots_csv/net_0$i" \
            "$emulation_path/Network_0$i"

        # Output folder for each network in the emulation
        network_output="$OUTPUT_DIR""$emulation_name""Network_0$i"
        mkdir -p $network_output

        server_csv="$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/csv_files"

        # Collet Delay for IoT Device
        python3 $PYTHON_SCRIPT/get_packet_send_time.py \
            -i "$TMP/delay/udp/iots_csv/net_0$i" \
            -s $server_csv \
            -c "$IOT_SERVER_IP_ADDR" \
            -o $network_output \
            -t $TIME \
            -n $i \
            -e "tshark"

        # Junta os varios arquivos csv em um unico arquivo
        python3 $PYTHON_SCRIPT/concatenate.py \
            -c $network_output \
            -o "$OUTPUT_DIR""$emulation_name""Network_0$i.csv"
        
        # rm -r "tmp/delay/udp/iots_csv/net_0$i"
        echo "End UDP Delay for the entire emulation"
        ############################################# End UDP Delay for the entire emulation #########################################################




        ################################################################################################################################################
        ############################################# UDP Delay for each analysis window ###############################################################
        ################################################################################################################################################
        # Get iot delay files
        cd $network_output
        files=$(ls)

        # Return to the current dir
        cd $WORK_DIR

        # delay_tmp="tmp/delay_net_0$i/"
        # mkdir -p $delay_tmp
        mkdir -p "$TMP/delay/udp/network/tmp/experiment_analysis_window/net_0$i"
 
        for file in $files
        do
            # # Recupera o nome da emulacão descartando o '.csv' no final da string
            iot_device="${file%.csv}"

            # Python Scritp that return a file with min, max, avareage, stderror
            # This python Script will need filter the data base to select only the analysis window 
            #This file will be save in a temporary folder
            python3 $PYTHON_SCRIPT/summary_udp_delay.py \
                -i "$network_output/$file" \
                -o "$TMP/delay/udp/network/tmp/experiment_analysis_window/net_0$i/$file"  \
                --window 60 1200 \
                --mode "iot" \
                --id $iot_device

        done
        
        mkdir -p "$OUTPUT_DIR/$emulation_name/Delay/Network/experiment_analysis_window/"
 
        # Call concatenate.py to merge all this files
        python3 $PYTHON_SCRIPT/concatenate.py \
            -c "$TMP/delay/udp/network/tmp/experiment_analysis_window/net_0$i" \
            -o "$OUTPUT_DIR/$emulation_name/Delay/Network/experiment_analysis_window/network_0$i.csv"
        
        # Recupera o nome da emulacão descartando o '/' no final da string
        emulation_id="${emulation_name%/}"
        
        # Call a new script that will collect the metric for each network
        # Where I will save this files? Create a new temporary folder
        # This will generate 105 files -> 3 networks * 35 emulations
        mkdir -p "$TMP/delay/udp/network/experiment_analysis_window/net_0$i"

        python3 $PYTHON_SCRIPT/summary_udp_delay.py \
            -i "$OUTPUT_DIR/$emulation_name/Delay/Network/experiment_analysis_window/network_0$i.csv" \
            -o "$TMP/delay/udp/network/experiment_analysis_window/net_0$i/$emulation_id.csv" \
            --mode net \
            --id $emulation_id


        echo "End UDP Delay for each analysis window"
        ############################################# End UDP Delay for each analysis window #########################################################







        ################################################################################################################################################
        ############################################# UDP Packet Loss for each analysis window #########################################################
        ################################################################################################################################################

        mkdir -p "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window/net_0$i"
        # mkdir -p "$OUTPUT_DIR/$emulation_name/packet_loss/first_attack_analysis_window/net_0$i"
        # mkdir -p "$OUTPUT_DIR/$emulation_name/packet_loss/second_attack_analysis_window/net_0$i"
           
        server_csv="$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/csv_files"
        
        python3 $PYTHON_SCRIPT/packet_loss.py \
            -s $server_csv \
            -i "$emulation_path/Network_0$i" \
            -o "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window/net_0$i" \
            -t $TIME \
            -n $i \
            -c "$IOT_SERVER_IP_ADDR" \
            -e tshark \
            --window 60 1200


        ##### UDP Packet_loss Summary ######
       
       
        # Recupera o nome da emulacão descartando o '/' no final da string
        emulation_id="${emulation_name%/}"

        mkdir -p "$TMP/packet_loss/udp/experiment_analysis_window/net_0$i/"

        cd "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window/net_0$i"
        packet_loss_file=$(ls | grep "packet_loss")
        
        # Return the active diretory for the one that call this script
        cd $WORK_DIR

        python3 $PYTHON_SCRIPT/summary_udp_packet_loss.py \
            -i "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window/net_0$i/$packet_loss_file" \
            -o "$TMP/packet_loss/udp/experiment_analysis_window/net_0$i/$emulation_id.csv" \
            -n $i \
            --id $emulation_id

        echo "UDP Packet Loss for each analysis window"
        ############################################# UDP Packet Loss for each analysis window #########################################################

        ################################################################################################################################################
        #############################################            Throughput           #########################################################
        ################################################################################################################################################
        server_csv="$OUTPUT_DIR/$emulation_name/Server_raw_data/Server_$i/csv_files"
        mkdir -p "$OUTPUT_DIR/$emulation_name/throughput/net_0$i"

        # Diretório temporario para fazer a sintese do throughput
        mkdir -p "$TMP/throughput/net_0$i/$emulation_name/"
        
        python3 $PYTHON_SCRIPT/throughput_analysis.py \
			-i $server_csv \
			-o "$OUTPUT_DIR/$emulation_name/throughput/net_0$i" \
			-t $TIME \
			-c $IOT_SERVER_IP_ADDR \
			-e "tshark" \
			-a UDP ICMP

        # Copia os dados do throughput para o Diretório temporário
        cp  "$OUTPUT_DIR/$emulation_name/throughput/net_0$i/"* "$TMP/throughput/net_0$i/$emulation_name/"

        ) &
    done
    wait


    # Recupera o nome da emulacão descartando o '/' no final da string
    emulation_id="${emulation_name%/}"

    python3 $PYTHON_SCRIPT/tcp_packet_loss.py \
        -i "$emulation_path/Server" \
        -o "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window" \
        -t $TIME \
        -z 3 \
        --window 60 1200


    mkdir -p $TMP/packet_loss/tcp/experiment_analysis_window
    

    # Transpoe os dados de perda de menssagem entre os Servidores
    python3 $PYTHON_SCRIPT/transpose_tcp_loss.py \
        -i "$OUTPUT_DIR/$emulation_name/packet_loss/experiment_analysis_window/tcp_loss_output.csv" \
        -o "$TMP/packet_loss/tcp/experiment_analysis_window/$emulation_id.csv" \
        --emulation $emulation_id

    
    # Apaga os arquivos descompactados
    # Motivo Economizar espaço
    emulation_dir="$DIR_EMULATIONS/$emulation_name"
    rm -r "${emulation_dir:?}"

done

#################### TCP Packet Loss #########################

mkdir -p "$OUTPUT_DIR/Summary/Packet_loss/tcp/"

# Junta os arquivo transposto da perda de pacotes TCP
python3 $PYTHON_SCRIPT/concatenate.py \
    -c $TMP/packet_loss/tcp/experiment_analysis_window/ \
    -o "$OUTPUT_DIR/Summary/Packet_loss/tcp/tcp_loss_experiment_analysis_window.csv"


#################### Summary UDP Packet Loss #########################

mkdir -p "$OUTPUT_DIR/Summary/Packet_loss/udp/"

for ((i=1; i<=5; i++))
do
# Junta os arquivo de perda de pacotes UDP
python3 $PYTHON_SCRIPT/concatenate.py \
    -c "$TMP/packet_loss/udp/experiment_analysis_window/net_0$i" \
    -o "$OUTPUT_DIR/Summary/Packet_loss/udp/udp_packet_loss_experiment_analysis_window_net_0$i.csv"

done

#################### Summary Throughput #########################

mkdir -p "$OUTPUT_DIR/Summary/throughput/net_01"
mkdir -p "$OUTPUT_DIR/Summary/throughput/net_02"
mkdir -p "$OUTPUT_DIR/Summary/throughput/net_03"
mkdir -p "$OUTPUT_DIR/Summary/throughput/net_04"
mkdir -p "$OUTPUT_DIR/Summary/throughput/net_05"

# Calcula as médias dos throughputs
python3 $PYTHON_SCRIPT/summary_throughput.py \
    -i "$TMP/throughput/" \
    -o "$OUTPUT_DIR/Summary/throughput/"

#################### Summary UDP Delay #########################

mkdir -p "$OUTPUT_DIR/Summary/Delay/udp/"

for ((i=1; i<=5; i++))
do

    # Call concatenate.py to merge all udp delays from each network
    python3 $PYTHON_SCRIPT/concatenate.py \
        -c "$TMP/delay/udp/network/experiment_analysis_window/net_0$i" \
        -o "$OUTPUT_DIR/Summary/Delay/udp/udp_delay_experiment_analysis_window_net_0$i.csv"

done

#################### Summary TCP Delay #########################

mkdir -p "$OUTPUT_DIR/Summary/Delay/tcp/"

for ((i=1; i<=5; i++))
do

    # Call concatenate.py to merge all tcp delays from each server
    python3 $PYTHON_SCRIPT/concatenate.py \
        -c "$TMP/delay/tcp/server/experiment_analysis_window/net_0$i" \
        -o "$OUTPUT_DIR/Summary/Delay/tcp/server_delay_experiment_analysis_window_net_0$i.csv"
    

done

# Delete upd delays temporary folder
# Call rm
rm -r $TMP 
