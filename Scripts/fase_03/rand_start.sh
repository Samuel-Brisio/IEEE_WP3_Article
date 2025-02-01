#!/usr/bin/env bash

set -e

# Passar o numero da iterção por argumento para escolher a ordem dos arquivos de deployment
# "./seq_start.sh < 1,2,3 ... n >"
x=$(( $1 % 120 +1 ))

# Inicializa os dispositivos
kubectl apply -f /wp3-experiment/Deploy/servers.yaml
# Inicializa a Bonesi
kubectl apply -f /wp3-experiment/Deploy/ddos_network.yaml
# Inicializa o Snort
kubectl apply -f /wp3-experiment/Deploy/nids.yaml

case $x in
1) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
2) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
3) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
4) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
5) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
6) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
7) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
8) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
9) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
10) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
11) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
12) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
13) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
14) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
15) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
16) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
17) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
18) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
19) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
20) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
21) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
22) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
23) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
24) kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
25) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
26) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
27) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
28) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
29) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
30) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
31) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
32) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
33) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
34) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
35) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
36) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
37) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
38) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
39) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
40) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
41) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
42) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
43) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
44) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
45) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
46) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
47) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
48) kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
49) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
50) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
51) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
52) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
53) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
54) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
55) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
56) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
57) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
58) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
59) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
60) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
61) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
62) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
63) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
64) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
65) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
66) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
67) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
68) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
69) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
70) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
71) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
72) kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
73) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
74) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
75) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
76) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
77) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
78) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
79) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
80) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
81) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
82) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
83) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
84) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
85) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
86) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
87) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml ;;
88) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
89) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
90) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
91) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
92) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
93) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
94) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
95) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
96) kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
97) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
98) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
99) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
100) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
101) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
102) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
103) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
104) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
105) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
106) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
107) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
108) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
109) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
110) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
111) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml ;;
112) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
113) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
114) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
115) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
116) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
117) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml ;;
118) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
119) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml ;;
120) kubectl apply -f /wp3-experiment/Deploy/network_5.yaml && kubectl apply -f /wp3-experiment/Deploy/network_4.yaml && kubectl apply -f /wp3-experiment/Deploy/network_3.yaml && kubectl apply -f /wp3-experiment/Deploy/network_2.yaml && kubectl apply -f /wp3-experiment/Deploy/network_1.yaml ;;
esac

# Dorme por 20:20 minutos
sleep 1220

# Coleta algumas informaçoes sobre o estado dos pods
kubectl get pod > /wp3-experiment/Volumes/Output/kube_status.txt

# Deleta todos os pods
kubectl delete pods --all
