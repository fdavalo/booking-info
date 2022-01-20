done=1

while [[ $done -ne 0 ]]; do
        mysql -u root < /opt/app-root/src/mysqldb-check.sql
        done=$?
        if [[ $done -eq 1 ]]; then
                mysql -u root < /opt/app-root/src/mysqldb-init.sql
                done=$?
        fi
        sleep 1
done
