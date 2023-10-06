#0x0C. Web server
``DevOps`` ``SysAdmin``

## Concepts
#### How the web works
Computers connected to the internet are called clients and servers.
* Clients are the typical web user's internet-connected devices
* Servers are computer that store webpages, sites, or apps
When a client device wants to access a webpage, a copy of the webpage is downloaded from the server onto the client machine to be displayed in the user's web browser.

**Other tools that makes connection possible**
* Internet connection: Allows you to send and receive data on the web.
* TCP/IP: Transmission Control Protocol and Internet Protocol are communication protocols that define how data should travel across the internet.
* DNS: Domain Name System is responsible for translating a user adaptable domain name (ex. www.airtaxi.com) to computer adaptable IP address (ex. 23.101.242.3), so it can send HTTP messages to the right place
* HTTP: Hypertext Transer Protocol is an application protocol that create connection between the clients and the servers.
* Component files: A website is made up of many different files which are of two main types:<br/>
&emsp Code files: tools that build up the websites. <br/>
&emsp Assets: This is a collective name for all the other stuff that makes up a website (ex. images, music, video, .doc, PDFs ..)

**So,**
1. The browser through the DNS server, find the real address of the server that the website lives on.
2. The browser sends an HTTP request to the server, asking for a copy of the website to the client. This message is sent across internet using TCP/IP
3. If the server approves the client's request, the server sends a response (a "200 OK" message) to the client and communication is established.
4. The browser assembles the small chunks into a complete web page and displays it.

#### What are Packets
packets are format in which the data is sent from server to client. Basically, data are sent across the web in thousands of small packets. This because it is easier to replace dropped or corrupted chunks. 
Additionally, the packets can be routed along different path, making the exchange faster and allowing many different users to download the website at the same time. If each website was sent as a single big chunk,
only one user could download it at a time, which would make the web very inefficient.

#### Nginx
Nginx is a free and open-source software (web server) that can be used as a load balancer and HTTP cache.<br/>
**Setting Up Nginx Server Blocks**
1. Setting Up the New Document Root Directories
```
mkdir -p /var/www/example.com/html
mkdir -p /var/www/test.com/html
```
``/var/www/`` is the directory structure. The actual web content will be placed in ``html`` directory within the ``site-specific`` directories. This gives us some additional flexibility to create other directories associated with our sites as siblings to ``html`` directory if neccessary.<br/>
Note: Nginx is configured to serve documents out of a directory at ``/var/www/html``, which will only work well for a single site. The -p flags tells mkdir to create any neccessary parent directories.

2. Creating Sample Pages for Each Site so that we will have something to display.

3. Creating Server Block Files for Each Domain
By default Nginx contains one server block called ``default`` which we can use as a template for our own configurations.
```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/example.com
```
Open the new file: ``sudo nano /etc/nginx/sites-available/example.com``
Point it to the site's document root that was created
```
server {
		listen 80;
		listen [::]:80;

		root /var/www/``example.com``/html;
		index index.html index.htm index.nginx-debian.html;

		server_name ``example.com www.``example.com``;
		...
}
```
In similar fashion we can create the Second Server Block File (ie. for test.com)

4. Enabling the Server Blocks and Restart Nginx
```
sudo ln -s /etc/nginx/sites-available/``example.com`` /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/``test.com`` /etc/nginx/sites-enabled/
```
these files are now linked into the enabled directory. We now have 3 server blocks enabled (ie. example.com, test.com, default (will respond to any requests on port 80 that do not match the other two)) which are configured to respond based on their ``listen`` directive and the ``server_name``

In order to avoid a possible hash bucket memory problem that can arise from adding additional server names, we will uncomment a single line within our /etc/nginx/nginx.conf
```
sudo nano /etc/nginx/nginx.conf
```
```
http {
	...
	server_names_hash_bucket_size 64;
	...
}
```
To make sure no syntax errors in any Nginx files
```
sudo nginx -t
```
If no problems were found, restart Nginx to enable changes
```
sudo systemctl restart nginx
```
Nginx should now be serving both of the domain names.

5. Modifying Local Hosts File for Testing
If you have not been using domain names that you own and instead have been using placeholder values, you can modify local computer's configuration to let you temporarily test Nginx server block configuration.
```
local $ sudo nano /etc/hosts
```

```
127.0.0.1 localhost
...

``203.0.113.5 example.com www.example.com``
``203.0.113.5 test.com www.test.com``
```

6. Testing the Results
on the web browser, enter: ``http://example.com`` or ``http://test.com``

To verify or learn more, check [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)

#### What is a Child Process?<br/>
	> A child process is a procress created by another process (called the parent process). The benefit
	of a child process is that it can start/stop at will without affecting the parent process.<br/>
	The child process is, however, is typically dependent on the parent process. If the parent process
	dies, the child process becomes an orphan process.
	Apache creates child processes whenever the number of requests (web page accesses from users)
	exceeds the maximum allowed number of requests. When the maximum number of child process requested
	is exceeded, another child process spawns.

	To view all running processes with their child processes in a "tree" format, use the following command:
	```
	$ ps axf
	```

#### Domains, subdomains and paths
domain is the identity of representation (in the form of letters) of an IP address.

A subdomain belongs to the root domain. The subdomain name comes before the root domain name and is separated from it by a dot. You buy a domain name once, and usually, you can create an unlimited number of subdomains in your domain registrar's account. However, the amount of subdomains that you can add to your account depends on your plan:
* Core - 1 subdomain
* Create - 2 subdomains
* Automate - 4 subdomains
* Agency - 5 subdomains

A path/subfolder (ex. home.mycompany.com/about)

#### HTTP
Read up story on HTTP Methods and description at [Tutorialspoint](https://www.tutorialspoint.com/http/http_methods.htm)

**HTTP Redirection**
Redirection is the process of forwarding one URL to a different URL.<br/>
Types of redirects
* 301, "Moved Permanently" - The best method for implementing redirects on a website.
* 302, "Found" or "Moved Temporarily"
* Meta Refresh <br/>
A meta refresh might look like this:
```
<http-equiv="refresh" content="0; url=https://example.com/">
```

How to implement a redirect<br/>
A common way of implementing redirects is through an .htaccess file which runs on Apache servers. Below contain a list of common .htaccess directives for redirection.
1. To redirect an entire domain to a new site:
```
Redirect 301 / http://www.example.com/
```
2. To redirect a single page
```
Redirect 301 /oldpage/ http://www.example.com/newpage/
```
3. Using Apache mod_rewrite: here's the code to redirect from a non-www to a www subdomain.
```
RewriteEngine on
RewriteBase /
rewritecond %{http_host} ^domain.com [nc]
rewriterule ^(.*)$ http://www.domain.com/$1 [r=301,nc]
```
PHP redirect: an example of implementing a 301 redirect using PHP
```
<?php
header("Location: https://www.example.com/", true, 301);
exit();
```
JavaScript redirects: While not recommended, the following is an example of how you could implement a redirect in JavaScript:
```
<script type="text/javascript">	
	function redirect1() {
		window.location = "http://www.example.com/new-url/"
		}
	setTimeout('redirect1()', 5000);
</script>
```

## Tasks
Task (link to file) and file description in a table format
