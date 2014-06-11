Hackbox
=======

Zum Loslegen solltest Du Vagrant und Virtualbox bereits installiert haben.
Dann einfach

    vagrant up

und warten :-)

Der Zugriff erfolgt dann mittels

    vagrant ssh [hackbox54 | hackbox55]
    ## dann optional:
    sudo su -

Die IP Adressen lauten: 172.21.77.100 (PHP 5.4) und 172.21.77.101 (PHP 5.5).

PHP Info
--------

- 5.4: http://172.21.77.100/phpinfo.php  
- 5.5: http://172.21.77.101/phpinfo.php  

PHPMyAdmin
----------

- 5.4: http://172.21.77.100/phpmyadmin
- 5.5: http://172.21.77.101/phpmyadmin

MySQL
-----

In beiden VMs ist MySQL 5.5 vorinstalliert. Das MySQL root Passwort lautet 'changeme'.  
Es gibt auch eine leere Datenbank "hackbox" - Nutzername hier "phpug" und Passwort ebenfalls "changeme".


