# devops-tools
# Proton VPN
Steps to complete **protonvpn failed init**:
<br/>
0. Initialize proton vpn:<br/>
  $ sudo protonvpn init<br/>
If initialization failed, follow these steps!  
1. Retrieve a username from **vpn cedentials** of protonvpn website  and then replace **<username>**, in the config file (file **pvpn-cli.cfg**), by your protonvpn username.
2. Copy the config file **pvpn-cli.cfg** into: ~/.pvpn-cli/. 
3. Replace **<username>** and **<password>** with your username and password of protonvpn **vpn cedentials**.
4. Copy the config file **pvpnpass** into: ~/.pvpn-cli/.
<br/>Enjoy using Proton VPN by **c**onnecting:
  $ sudo protonvpn c
<br/>Also you can **d**isconnect it by:
  $ sudo protonvpn d
