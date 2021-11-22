# PIA-LPC

## Table of Contents
1. [Informacion General](#general-info)
2. [Script Powershell](#Script1)
3. [Script Bash](#Script2)
4. [Web Scrapping](#Script3)
5. [Reloj](#Script4)

<a name="general-info"></a>
## Informacion General
### Producto Integrador de Aprendizaje
**Unidad de Aprendizaje:** Programacion para Ciberseguridad

Producto final de la materia de Laboratorio de programacion para ciberseguridad.
En este repositorio se almacenan algunas de las practicas asi como una breve explicacion de estas.

## Script de Powershell
<a name=Script1></a>

Como primer ejemplo tomaremos el archivo de powershell llamado Tarea2_1926940.ps1 el cual, si lo ejecutamos
nos dara varias opciones.
El script consiste en un escaneo de redes, si decidimos ejecutar la primera opcion el script nos desplegara
un escaneo de la subred de nuestra red. Si ejecutamos la segunda opcion la terminal nos pedira una direccion ip
la cual sera utilizada para un escaneo y nos desplegara en pantalla una lista de puertos los cuales tiene abierto
(la lista de puertos ya viene incluida dentro del script, usando una lista de puertos que mas comunmente se encuentran
abiertos). Y por ultimo tenemos la opcion de salir el cual nos sacara de la ejecucion y no hara nada.

## Script de Bash
<a name=Script2></a>

En este script, de manera similar al visto con powershell tendra un funcion similar, el nombre del script es skynet.sh
El script tambien cuenta con varias opciones en la primer opcion tal y como se menciono en el script de powershell tambien
escaneara nuestra red y nos mostrara los equipos conectados a nuestra red y nos dara nuestra subred.
En la segunda opcion tendremos que ejecutarlo de la siguiente manera: 
```
./skynet.sh 11.0.0.24
```
Se ejecuta desde la terminal de bash con el nombre del script seguido del puerto que se quiere escanear (el puerto que se muestra
es uno de prueba), de esta manera nos desplegara una lista de los puertos que estan abiertos o cerrados de la direccion ip
que se proporciono. Ademas en la lista de opciones si se quiere saber que puertos estan abierto o cerrados se debera seleccionar
la opcion 2

Si se selecciona la tercera opcion se nos desplegara en pantalla informacion como el nombre de equipo en donde se ejecuto el script
el nombre del usuario y el sistema operativo utilizado 

## Web Scrapping
<a name="Script3"></a>

En este codigo al ejecutarlo lo que hara es recopilar informacion de una pagina llamada 'fake jobs', utilizando beutifulsoup, se podra
extraer informacion como nombre de trabajadores, area de trabajo, entre otra informacion, ademas esta informacion la guardara en un
archivo tipo csv.

## Reloj
<a name="Script4"></a>

Dentro de este repositorio encontraremos una carpeta llamada 'Reloj', dentro tendra los archivos de un ejecutanle de python asi como
el script a partir del cual se creo el ejecutable. El ejecutable estara dentro de la carpetea llamada dist con el nombre de 
'reloj.exe', que al ejecutarlo nos desplegara la apliacion de un reloj y eso es todo lo que hara
