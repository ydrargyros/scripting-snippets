java -XX:+PrintFlagsFinal -version | grep -Ei "maxheapsize|maxram"	#Baeldung

jps #Instead of ps -ef
jstat -gc <PID> | tail -n 1 | awk '{split($0,a," "); sum=a[3]+a[4]+a[6]+a[8]; print sum}' #Get stats aggregated stats
jcmd 1 GC.heap_info