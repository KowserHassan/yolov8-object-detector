# 🕵️‍♂️  I Spy with My AI — YOLOv8 Object Detection App

Welcome to **"I Spy with My AI"** — a powerful web application that lets you upload an image and detect objects using the YOLOv8 model. This project showcases how modern AI apps can be **containerised**, **orchestrated**, and **deployed securely at scale**.

![alt text](image-1.png)

---

## 🚀 How it works?

- 📸 Upload any image
- 🧠 Detect objects using YOLOv8
- 🔁 Served via a containerised Flask app
- ☁️ Deployed using ECS Fargate + ALB + Route 53 + ACM
- ⚙️ Infrastructure managed with **Terraform**
- ✅ Automated with GitHub Actions

---

## 🏗️ Architecture Overview

![alt text](image.png)

---

## 🛠️ Technologies Used

| Layer             | Tools & Services                                      |
|------------------|--------------------------------------------------------|
| Model Inference  | YOLOv8 (Ultralytics)                                   |
| Backend          | Python + Flask                                         |
| Frontend         | HTML, CSS (minimal)                                    |
| Containerisation | Docker                                                 |
| IaC              | Terraform                                              |
| Orchestration    | AWS ECS (Fargate)                                      |
| Networking       | ALB, VPC, Route 53, ACM, NAT Gateway                   |
| CI/CD            | GitHub Actions                                         |

---

## ⚙️ How to Run Locally

```bash
git clone https://github.com/your-username/yolov8-object-detector.git  

cd yolov8-object-detector

docker build -t yolov8-app .

docker run -p 8080:8080 yolov8-app

Then visit: http://localhost:8080