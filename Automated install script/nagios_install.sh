echo ""
echo ""
echo"#################################################"
echo"#                                               #"
echo"#	       Install script for Nagios             #"
echo"#   Starting Install of Nagios network 	     #"
echo"#                                               #"
echo"#################################################"
echo ""
echo ""

apt-get install nagios3 -y
apt-get install perl-doc -y

echo ""
echo ""
echo"#################################################
echo"#                                               #
echo"#	      Creating custom confuguration        	 #
echo"#                                               #
echo"#################################################
echo ""
echo ""

echo "		Creating configurations folders"
echo ""
echo ""

echo "		1. Servers"
		mkdir /etc/nagios3/servers
		echo ""
echo "		2. Switches"
		mkdir /etc/nagios3/switches
		echo ""
echo "		3. Routers"
		mkdir /etc/nagios3/routers
		echo ""
echo "		4. Printers"
		mkdir /etc/nagios3/printers
		echo ""
echo "		5. Internet Connectivity"
		mkdir /etc/nagios3/internet
		echo ""

echo "		Creation of configurations folders - Done!"
echo ""
echo ""

echo "		###############################"
echo "		#                             #"
echo "		# Configuration  *.cfg files  #"
echo "		#                             #"
echo "		###############################"
cat config/servers.cfg > /etc/nagios3/servers/servers.cfg    

cat config/switches.cfg > /etc/nagios3/switches/switches.cfg	

cat config/printers.cfg > /etc/nagios3/printers/printers.cfg	

cat config/routers.cfg > /etc/nagios3/routers/routers.cfg		

cat config/internet_connectivity.cfg > /etc/nagios3/internet/internet_connectivity.cfg

cat config/hostgroups.cfg > /etc/nagios3/conf.d/hostgroups_nagios2.cfg

cat config/nagios.cfg > /etc/nagios3/nagios.cfg

cat config/contacts.cfg > /etc/nagios3/conf.d/contacts_nagios2.cfg

cat config/services_W_Commands.cfg > /etc/nagios3/conf.d/services_W_Commands.cfg

cat config/extrainto.cfg > /etc/nagios3/conf.d/extinfo_nagios2.cfg

cat config/commands.cfg > /etc/nagios3/commands.cfg


echo ""
echo "Configuration - DONE!"
echo ""
echo "Testing configurations"

nagios -v nagios.cfg

dpkg-statoverride --update --add nagios www-data 2710 /var/lib/nagios3/rw
dpkg-statoverride --update --add nagios nagios 751 /var/lib/nagios3

chmod u+s /usr/lib/nagios/plugins/check_dhcp
service nagios3 restart

