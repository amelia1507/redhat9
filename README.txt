for online installation please RUN:

1. chmod +x install_dependencies.sh
2. To check if dependencies are already installed, run:
	./install_dependencies.sh -t dependencies.txt
3. To install dependencies, run:
	./install_dependencies.sh -i dependencies.txt
4. systemctl restart cybereason-sensor
5. systemctl status cybereason-sensor

pastikan point 5 running

tolong di tanyakan ke tim EDR sudah masuk ke dashboard atau tidak 
jika belum lanjutkan no 6

6. nano /opt/cybereason/sensor/etc/sensor.conf
7. delete pylum yg ada pada -->     server.channelName=PylumIDXXXXXXXXXXX    ubah menjadi server.is_vm=false
save perubahan yang ada pada sensor.conf 
8. systemctl restart cybereason-sensor
9. systemctl status cybereason-sensor -- pastikan running

konfirmasi lagi dengan tim EDR untuk check apakah server sudah masuk ke cybereason dashboard.

jika dari tim EDR menginformasikan bahwa EDR masih belum muncul di dashboard, tolong dilanjut point 10. 

10. ambil semua file yang ada pada /opt/cybereason/sensor/Logs/  
dan berikan file tersebut ke kami keseluruhan file yang ada pada Logs. 

