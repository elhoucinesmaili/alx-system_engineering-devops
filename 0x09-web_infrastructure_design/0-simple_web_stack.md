# Simple Web Stack Design

This README outlines a simple web infrastructure for hosting a website accessible via `www.foobar.com`.

---

## **Overview**

1. User accesses `www.foobar.com`.
2. DNS resolves `www.foobar.com` to IP `8.8.8.8`.
3. Web server (Nginx) handles the request.
4. Application server processes dynamic content using application files (code base).
5. Database (MySQL) stores and retrieves data.
6. Response is sent back to the user.

---

## **Components**

- **1 Server:** Hosts all components.
- **Domain Name:** `www.foobar.com` points to IP `8.8.8.8`.
- **Web Server (Nginx):** Manages incoming requests and serves content.
- **Application Server:** Executes application logic.
- **Application Files:** Codebase for website functionality.
- **Database (MySQL):** Stores application data.

---

## **Issues**

1. **SPOF:** Entire system fails if the server goes down.
2. **Maintenance Downtime:** Restarts cause temporary unavailability.
3. **Limited Scalability:** Cannot handle high traffic loads.

---

## **Diagram**

```plaintext
User --> DNS --> Nginx --> App Server --> Database
```
