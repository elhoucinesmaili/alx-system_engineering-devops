# Distributed Web Infrastructure Design

This README outlines a distributed web infrastructure hosting the website `www.foobar.com`, using three servers and additional components for improved scalability and redundancy.

---

## **Infrastructure Overview**

### **User Request Flow**
1. A user accesses `www.foobar.com`.
2. DNS resolves `www.foobar.com` to the load balancer's IP.
3. The load balancer (HAProxy) distributes incoming requests to one of the web servers using a specified algorithm.
4. The web server (Nginx) handles the request and forwards it to the application server if needed.
5. The application server processes the request and interacts with the database (MySQL).
6. The response is sent back to the user.

---

## **Components**

- **3 Servers:** Distribute workloads across components for better performance and redundancy.
- **Load Balancer (HAProxy):** Distributes traffic across web servers to balance the load.
- **Web Server (Nginx):** Handles HTTP/HTTPS requests and serves content.
- **Application Server:** Processes dynamic content using the code base.
- **Database (MySQL):** Configured as a Primary-Replica cluster for scalability and redundancy.
- **Application Files:** Shared codebase for application functionality.

---

## **Key Concepts**

### **1. Additional Components**
- **Load Balancer:** Prevents overloading a single server by distributing traffic.
- **Database Cluster:** Ensures data availability and reduces query load on a single database instance.

### **2. Load Balancer Configuration**
- **Algorithm:** Round-robin (evenly distributes traffic) or least connections (sends traffic to the least busy server).
- **Setup:** Active-Active (all servers handle traffic) vs. Active-Passive (one server is a backup).

### **3. Database Cluster**
- **Primary Node:** Handles all write operations.
- **Replica Node:** Copies data from the primary and handles read operations, improving performance and fault tolerance.

---

## **Issues**

1. **SPOF:** If the load balancer fails, the entire system becomes unavailable.
2. **Security:** No firewall or HTTPS exposes vulnerabilities.
3. **No Monitoring:** Lack of monitoring tools prevents proactive issue detection.

## **Summary**
This distributed infrastructure enhances reliability, scalability, and performance compared to a single server setup. However, addressing SPOF, security, and monitoring issues is necessary to ensure optimal functionality.
