## tecnica del taglio delle nebbie 

needs hundredrabbits' `orca-c` and  my tools `pixelscript` and `substrata`

commands:

``` 
substrata -p samples/ -o 4242

pixelscript sigil/

SEED=$(od -vAn -N2 -tu2 < /dev/urandom)
orca --strict-timing --bpm 240 --seed $SEED --osc-port 4444 pattern.240.orca

```
