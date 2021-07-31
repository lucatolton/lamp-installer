#############################################################################
#                                                                           #
# LAMP Installation Script                                                  #
#                                                                           #
# Copyright (C) 2021, Luca Tolton, <hi@lucatolton.me>                       #
#                                                                           #
#   This program is free software: you can redistribute it and/or modify    #
#   it under the terms of the GNU General Public License as published by    #
#   the Free Software Foundation, either version 3 of the License, or       #
#   (at your option) any later version.                                     #
#                                                                           #
#   This program is distributed in the hope that it will be useful,         #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#   GNU General Public License for more details.                            #
#                                                                           #
#   You should have received a copy of the GNU General Public License       #
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.  #
#                                                                           #
# https://github.com/lucatolton - https://lucatolton.me                     #
#                                                                           #
#############################################################################

echo "* Updating package list"
sudo apt update

echo "* Installing Apache 2"
sudo apt install apache2

echo "* Would you like to configure UFW (firewall) for Apache?"
read -p "* Enter your option (secure/insecure/both): " option
if [[ $option == "secure" ]]; then
  echo ""
  echo "* Configuring firewall for SECURE setup"
  sudo ufw allow in "Apache Secure"
elif [[ $option == "insecure" ]]; then
  echo ""
  echo "* Configuring firewall for INSECURE setup"
  sudo ufw allow in "Apache"
elif [[ $option == "both" ]]; then
  echo ""
  echo "* Configuring firewall for SECURE and INSECURE setups"
  sudo ufw allow in "Apache Full"
else
  echo "* Skipping firewall configuration"
fi
