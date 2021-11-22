#LPC Tarea 2
#
#Elaborado por: Jairo Ivan Hernandez Hernandez
#Matriucla: 1926940
#Fecha: 16/10/2021

Write-Host Menu
Write-Host "1) Escaneo de subred"
Write-Host "2) Escaneo de equipo o direccion"
Write-Host "3) Salir"

$opcion = Read-Host
switch($opcion)
{
    1{
    #Se obtiene el gateway
    $subred = (Get-NetRoute -DestinationPrefix 0.0.0.0/0).NextHop
    Write-Host "Tu gateway es: $subred"

    #Se determina el rango de la subred
    $rango = $subred.Substring(0,$subred.IndexOf('.') + 1 + $subred.Substring($subred.IndexOf('.') + 1).IndexOf('.') + 3)
    
    #Se determina si el rango ($rango) termina con un punto
    #Ya que en ocasiones no lo tiene y en ese caso tener que forzarlo
    $punto = $rango.EndsWith('.')
    if ($punto -like "False")
    {
        $rango = $rango + '.' 
    }
    #Se crea un array llamado $rango_ip con un rango de 1 a 254
    $rango_ip = @(1..127)
    Write-Output ""
    Write-Host "Subred actual:"
    Write-Host "Escaneando:" -NoNewline; Write-Host $rango -NoNewline; Write-Host "0/24" -ForegroundColor DarkRed
    Write-Output ""
    foreach ( $r in $rango_ip )
    {
        $actual = $rango + $r #Aqui es donde se genera la direccion ip
        $responde = Test-Connection $actual -Quiet -Count 1
        if($responde -eq "True")
        {
            Write-Output ""
            Write-Host "Host responde a: " -NoNewline; Write-Host $actual -ForegroundColor Green
        }}
    Write-Host "Hecho \(￣︶￣*\)"
    }
    #
    #
    2{
    # De nuevo se obtiene el gateway
    $subred = (Get-NetRoute -DestinationPrefix 0.0.0.0/0).NextHop
    Write-Host "== Determinando el gateway..."
    Write-Host "Tu gateway es $subred"
    
    #Determinar el rango de la subred
    $rango = $subred.Substring(0,$subred.IndexOf('.') + 1 + $subred.Substring($subred.IndexOf('.') + 1).IndexOf('.') + 3)
    Write-Host "Determinando tu rango de subred"
    Write-Host $rango
    
    #Se determina si el rango ($rango) termina con un punto
    #Ya que en ocasiones no lo tiene y en ese caso tener que forzarlo
    $punto = $rango.EndsWith('.')
    if ($punto -like "False")
    {
        $rango = $rango + '.' 
    }
    # Se determina una lista de puertos
    $portscan = @(20,21,22,23,25,50,51,53,80.110.119.135,136,137,138,139,143,161,162,389,443,445,636,1025,1443,3389,5986,5986,8080,10000)
    $waittime = 100

    #Solicitamos la direccion ip a escanear:
    Write-Host "Direccio ip a escanear: " -NoNewline
    $direccion = Read-Host
    
    #Bucle for para evaluar cada puerto en $portscan
    foreach ( $p in $portscan )
    {
    $TCPObject = New-Object System.Net.Sockets.TcpClient
        try{ $resultado = $TCPObject.ConnectAsync($direccion,$p).Wait($waittime)}catch{}
        if ( $resultado -eq "True")
        {
            Write-Host "Puerto abierto: " -NoNewline; Write-Host $p -ForegroundColor Green
        }
    }
    }
    3{exit;break}

    default{break}
    }