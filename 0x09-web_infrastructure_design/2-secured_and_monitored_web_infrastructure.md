# Secured and Monitored Web Infrastructure Design

This README outlines a secured and monitored web infrastructure hosting `www.foobar.com` with encrypted traffic and monitoring capabilities.

---

## **Infrastructure Overview**

### **Components**

- **3 Servers:** Distribute workloads across components.
- **3 Firewalls:** Protect servers from unauthorized access.
- **SSL Certificate:** Enables HTTPS for secure communication.
- **Monitoring Clients:** Collect performance and usage data.

---

## **Key Concepts**

- **Firewalls:** Control incoming and outgoing traffic to secure servers.
- **HTTPS:** Encrypts traffic to protect user data.
- **Monitoring:** Tracks performance and detects issues using a data collector.
- **QPS Monitoring:** Measures queries per second on the web server.

---

## **Issues**

1. **SSL Termination:** At the load balancer, traffic between internal components remains unencrypted.
2. **Single MySQL Write Node:** Limits write capacity and introduces a single point of failure.
3. **Uniform Servers:** Combining all components on one server reduces specialization and scalability.

