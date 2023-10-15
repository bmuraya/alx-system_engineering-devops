# Project: # 0x0F. Load balancer
``DevOps`` ``SysAdmin``


A load balancer is a network device or software application that efficiently distributes incoming network traffic or application requests across multiple servers. The primary purpose of a load balancer is to ensure that no single server is overwhelmed with too much traffic, while others are underutilized, thus improving the reliability, availability, and scalability of an application or website. Here are some key characteristics and benefits of load balancers:

Distribution of Traffic: Load balancers evenly distribute incoming network requests or client connections across multiple servers, preventing any single server from becoming a bottleneck.

High Availability: Load balancers can detect when a server becomes unavailable due to failures or maintenance and redirect traffic to the remaining healthy servers. This helps ensure uninterrupted service even if some servers are temporarily offline.

Scalability: As traffic to a service or application increases, additional servers can be added to the server pool, and the load balancer automatically adapts to include these new servers in the distribution of traffic.

Improved Performance: By balancing the load across multiple servers, a load balancer can enhance the overall performance of an application or website, reducing response times and preventing server overloads.

Health Monitoring: Load balancers continuously check the health and status of servers in the pool, directing traffic only to healthy servers. Unhealthy servers can be automatically taken out of rotation.

SSL Offloading: Some load balancers can offload SSL/TLS encryption and decryption, reducing the computational load on the backend servers.

Session Persistence: Load balancers can be configured to maintain session persistence, ensuring that a client's requests are consistently directed to the same server to preserve session state (useful for applications that rely on server-side sessions).

Security: Load balancers can provide basic security by hiding the internal server structure and helping to mitigate distributed denial of service (DDoS) attacks.

Geographic Load Balancing: Some advanced load balancers support geographic or global load balancing, allowing traffic to be distributed to servers in different data centers or regions based on the client's location.

Load balancers come in various forms, including hardware appliances, virtual appliances, and software solutions. Popular load balancing technologies include Nginx, HAProxy, F5 Networks' BIG-IP, and cloud-based load balancers from providers like AWS, Azure, and Google Cloud. The choice of load balancer type and technology depends on the specific needs and infrastructure of the application or service being load balanced

## Concepts
* [Load balancer](#loadBalancer)
* [Web stack debugging](#webStackDebug)
* [Introduction to HAProxy](#introToHAProxy)

#### Load balancer
<a href='loadbalancer'></a>
Load balancer helps distribute web traffic over various server to reduce the amount of load on an individual system.

#### Read or watch:

* [Introduction to load-balancing and HAproxy](https://intranet.alxswe.com/rltoken/B7f3oz8i3Xvvom_YQZzLnQ)
* [HTTP header](https://intranet.alxswe.com/rltoken/sZ9v3Vq2tgLwN_PWVQketw)
* [Debian/Ubuntu HAProxy packages](https://haproxy.debian.net/)

## Tasks

| Task | File |
| ---- | ---- |
| 0. 0-custom_http_response_header | [0-custom_http_response_header](#) |
| 1. 1-install_load_balancer| [1-install_load_balancer](#) |
| 1. 2-puppet_custom_http_response_header.pp| [2-puppet_custom_http_response_header.pp](#) |
