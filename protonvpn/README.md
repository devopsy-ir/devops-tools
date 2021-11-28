# devops-tools
# Proton VPN
Steps to complete **protonvpn failed init**:
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0. Initialize proton vpn:<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$ sudo protonvpn init<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If initialization failed, follow these steps!  
1. Retrieve a username from **vpn cedentials** of protonvpn website  and then replace **<username>**, in the config file (file **pvpn-cli.cfg**), by your protonvpn username.
2. Copy the config file **pvpn-cli.cfg** into: ~/.pvpn-cli/. 
3. Replace **<username>** and **<password>** with your username and password of protonvpn **vpn cedentials**.
4. Copy the config file **pvpnpass** into: ~/.pvpn-cli/.
<br/><br/>
  <p>Enjoy using Proton VPN by connecting:
  <p>$ sudo protonvpn c</p>
Also you can disconnect it by:
  <p>$ sudo protonvpn d</p>
  </p>
