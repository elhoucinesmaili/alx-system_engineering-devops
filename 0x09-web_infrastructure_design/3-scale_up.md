# Scale-Up Infrastructure Design

This README outlines a scaled-up web infrastructure for `www.foobar.com` with component separation and redundancy.

---

## **Infrastructure Overview**

### **Components**

- **4 Servers:** Dedicated for web, application, and database roles.
- **2 Load Balancers (HAProxy):** Configured as a cluster for redundancy.
- **Split Components:** Web server, application server, and database on separate servers.

---

## **Key Concepts**

- **Component Separation:** Improves scalability and fault isolation.
- **Load Balancer Cluster:** Provides high availability.

