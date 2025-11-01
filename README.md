![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)

# Personal Library Demo - Kubernetes

This project demonstrates a **Database + Backend stack** for a personal library:

- **PostgreSQL** (Database)  
- **Node.js Backend** (REST API)  

> ⚠️ Note: This demo requires a functional Kubernetes cluster and Docker for building images.

---

## 🛠️ Tech Stack

- **Database:** PostgreSQL  
- **Backend:** Node.js + Express + Sequelize  
- **Containerization:** Docker  
- **Orchestration:** Kubernetes (Deployments & Services)  

---

## 🗄️ Database Model

- **Authors** – authors  
- **Genres** – genres  
- **Books** – books  
- **Book_Author** – book ↔ author relationship (many-to-many)  
- **Book_Genre** – book ↔ genre relationship (many-to-many)  

---

## 📖 Main API Endpoints  

### 🔹 Authors  
- `GET /api/authors` → List all authors  
- `GET /api/authors/:id` → Get an author by `author_id`  
- `POST /api/authors` → Create an author  
- `PUT /api/authors/:id` → Update an author  
- `DELETE /api/authors/:id` → Delete an author  

### 🔹 Books  
- `GET /api/books` → List all books  
- `GET /api/books/:isbn` → Get a book by ISBN  
- `POST /api/books` → Create a book  
- `PUT /api/books/:isbn` → Update a book  
- `DELETE /api/books/:isbn` → Delete a book  

### 🔹 Genres  
- `GET /api/genres` → List all genres  
- `GET /api/genres/:id` → Get a genre by `genre_id`  
- `POST /api/genres` → Create a genre  
- `PUT /api/genres/:id` → Update a genre  
- `DELETE /api/genres/:id` → Delete a genre  

### 🔹 Many-to-Many Relations  
- `GET /books/:isbn/authors` → List authors of a book  
- `GET /books/:isbn/genres` → List genres of a book  
- `POST /books/:isbn/authors` → Associate an author with a book  
- `POST /books/:isbn/genres` → Associate a genre with a book  

---

# 🚀 How to Run the Demo

## ⚙️ Prerequisites

- A functional Kubernetes cluster  
- Docker installed for building images  
- kubectl installed

> ⚠️ Note: These instructions assume you are running the demo on Minikube.  
> For other Kubernetes setups, you may not need to run `minikube start --driver=docker` or `eval $(minikube docker-env)`.

## 🖥️ On Linux / macOS

Simply run:
```bash
sh deploy.sh
```
· This will build the images, apply deployments and services, and wait for the database to be ready.

## 🖥️ On Windows (CMD / PowerShell) using Minikube

### 1️⃣ Start Minikube
```bash
minikube start --driver=docker
```

### 2️⃣ Configure Docker to use Minikube
```bash
minikube -p minikube docker-env --shell cmd
```
⚡ Copy the SET variables shown and paste them in your CMD terminal.

### 3️⃣ Build and Deploy the Database
```bash
cd db
docker build -t library-db:latest .
kubectl apply -f ../k8s/db-deployment.yaml
kubectl apply -f ../k8s/db-service.yaml
```

### 4️⃣ Build and Deploy the Node.js Backend
```bash
cd ../backend-node
docker build -t library-node:latest .
kubectl apply -f ../k8s/backend-node-deployment.yaml
kubectl apply -f ../k8s/backend-node-service.yaml
```

## ⏳ Wait for Pods to be Ready
```bash
kubectl get pods -w
```
· Wait until both postgres and backend-node show READY 1/1.

## 🌐 Access the Backend
```bash
kubectl port-forward svc/backend-node 3000:3000
```
· Open your browser:
```bash
http://localhost:3000/api/books
```

---

## 🧹 Cleanup
```bash
kubectl delete deployment backend-node
kubectl delete deployment postgres
kubectl delete svc backend-node
kubectl delete svc library-db
docker rmi library-node:latest library-db:latest
minikube stop
```

👨‍💻 Developed by Carlos Maccarrone

For more details and the original repositories:
- [Personal Library DB](https://github.com/carlosmaccarrone/personal-library-db) 
- [Personal Library Node.js Backend](https://github.com/carlosmaccarrone/personal-library-nodejs-backend)