#  Semafor Inteligent

Acest proiect implementează un semafor inteligent utilizând limbajul de descriere hardware Verilog. Este destinat testării pe platforme FPGA, cum ar fi DE10-Lite, dar poate fi simulat și software.

##  Descriere

Proiectul are ca scop simularea funcționării unui semafor clasic cu 3 culori (roșu, galben, verde). Tranzițiile între stări sunt controlate de un temporizator intern. Proiectul poate fi extins pentru a include semafoare pietonale, butoane de cerere sau detectarea traficului.

## Fișiere

- `semafor.v` – modulul principal Verilog care controlează logica semaforului.
- `semafor_tb.v` – testbench folosit pentru a simula funcționarea semaforului.
- `Modul SEMAFOR1.pdf` – documentația completă a proiectului.


### Cu ModelSim (Intel):
1. Compilează ambele fișiere.
2. Rulează simularea.
3. Vizualizează semnalele în waveform.

##  Funcționalități

- Tranziții corecte între culorile semaforului.
- Temporizări configurabile.
- Logica clar separată pentru control și afișare.





