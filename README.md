# PIA-LPC

## Table of Contents
1. [Informacion General](#general-info)
2. [Script Powershell](#Script1)
3. [Script Bash](#Script2)

## Informacion General
<a name="general-info"></a>
### Producto Integrador de Aprendizaje
**Unidad de Aprendizaje:** Programacion para Ciberseguridad

Producto final de la materia de Laboratorio de programacion para ciberseguridad.
En este repositorio se almacenan algunas de las practicas asi como una breve explicacion de estas.

## Scripts
<a name=Script1></a>

Como primer ejemplo tomaremos el archivo de powershell llamado Tarea2_1926940.ps1 el cual, si lo ejecutamos
nos dara varias opciones.
El script consiste en un escaneo de redes, si decidimos ejecutar la primera opcion el script nos desplegara
un escaneo de la subred de nuestra red. Si ejecutamos la segunda opcion la terminal nos pedira una direccion ip
la cual sera utilizada para un escaneo y nos desplegara en pantalla una lista de puertos los cuales tiene abierto
(la lista de puertos ya viene incluida dentro del script, usando una lista de puertos que mas comunmente se encuentran
abiertos). Y por ultimo tenemos la opcion de salir el cual nos sacara de la ejecucion y no hara nada.

<a name=Script2></a>

En este script, de manera similar al visto con powershell tendra un funcion similar, el nombre del script es skynet.sh
El script tambien cuenta con varias opciones en la primer opcion tal y como se menciono en el script de powershell tambien
escaneara nuestra red y nos mostrara los equipos conectados a nuestra red y nos dara nuestra subred.
En la segunda opcion tendremos que ejecutarlo de la siguiente manera: 

'''
./skynet.sh "10.0.0.101"
'''
