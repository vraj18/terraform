# 🌍 Terraform Lab – Infrastructure as Code (IaC)

## 📌 Overview

This repository contains a complete implementation of **Infrastructure as Code (IaC)** using Terraform. The lab demonstrates how infrastructure can be created, modified, and managed using configuration files instead of manual setup.

The assignments are structured progressively, starting from basic Terraform usage to advanced concepts like modules, automation, and dynamic infrastructure creation.

---

## 🎯 Objectives

By completing this lab, the following concepts are understood:

* Terraform workflow (`init`, `plan`, `apply`, `destroy`)
* Writing Terraform configuration files
* Using variables and outputs
* Managing Docker containers using Terraform
* Creating reusable Terraform modules
* Automating validation using CI/CD (GitHub Actions)
* Dynamically generating infrastructure using loops (`for_each`)

---

## 🧰 Tools Used

* Terraform CLI
* Docker (Docker Desktop / Engine)
* Git & GitHub

---

## 📁 Repository Structure

```
terraform-lab/
│
├── day1/      # Introduction to Terraform
├── day2/      # Variables and environment configs
├── day3/      # Docker container provisioning
├── day4/      # Modules and dynamic infrastructure
├── day5/      # CI/CD explanation
│
├── .github/
│   └── workflows/
│       └── terraform-check.yml   # CI workflow
│
├── .gitignore
└── README.md
```

---

# 🟢 Assignment 1: Introduction to Terraform

## 🔹 Description

A simple Terraform configuration was created to generate a local file.

## 🔹 Key Concepts

* Provider (`local`)
* Resource (`local_file`)
* Variables
* Outputs

## 🔹 Result

A file `hello.txt` is created with a custom message.

---

# 🟡 Assignment 2: Variables and Multiple Configurations

## 🔹 Description

Terraform configuration was parameterized using variables and `.tfvars` files.

## 🔹 Key Concepts

* Input variables
* Variable files (`dev.tfvars`, `prod.tfvars`)
* Environment-based configuration

## 🔹 Result

Different files are created:

* `dev.txt`
* `prod.txt`

---

# 🔵 Assignment 3: Managing Containers with Terraform

## 🔹 Description

Terraform was used to pull an nginx image and run a Docker container.

## 🔹 Key Concepts

* Docker provider
* Image and container resources
* Port mapping

## 🔹 Result

Nginx container runs on:

```
http://localhost:8080
```

---

# 🟣 Assignment 4: Terraform Modules

## 🔹 Description

Container creation logic was modularized and reused.

## 🔹 Key Concepts

* Modules (reusable components)
* Input variables in modules
* Clean and scalable structure

## 🔹 Result

Two containers created:

* http://localhost:8081
* http://localhost:8082

---

# 🔴 Assignment 5: Automation and Validation (CI/CD)

## 🔹 Description

A GitHub Actions workflow was created to automate Terraform checks.

## 🔹 Workflow Steps

* `terraform init`
* `terraform fmt`
* `terraform validate`
* `terraform plan`

## 🔹 Location

```
.github/workflows/terraform-check.yml
```

## 🔹 Benefit

Ensures code quality and prevents errors before deployment.

---

# 🚀 Bonus: Dynamic Infrastructure Creation

## 🔹 Description

Multiple containers were created dynamically using Terraform loops.

## 🔹 Key Concepts

* `for_each`
* Dynamic resource creation
* Scalable infrastructure

## 🔹 Input Example

```
container_config = [
  { name = "web1", port = 8081 },
  { name = "web2", port = 8082 },
  { name = "web3", port = 8083 }
]
```

## 🔹 Result

Containers available at:

* http://localhost:8081
* http://localhost:8082
* http://localhost:8083

---

# ⚙️ How to Run

## 1️⃣ Initialize Terraform

```
terraform init
```

## 2️⃣ Preview Changes

```
terraform plan
```

## 3️⃣ Apply Configuration

```
terraform apply
```

## 4️⃣ Destroy Infrastructure

```
terraform destroy
```

---


# ⚠️ Common Issues & Fixes

| Issue               | Solution                               |
| ------------------- | -------------------------------------- |
| Port already in use | Change port or run `terraform destroy` |
| Docker not running  | Start Docker                           |
| Provider error      | Delete `.terraform` and re-run `init`  |

---

# 🧠 Key Learnings

* Infrastructure can be automated using code
* Terraform ensures consistency and reproducibility
* Modules help build scalable systems
* CI/CD improves reliability and quality
* Dynamic infrastructure reduces manual effort

---

# 📌 Conclusion

This lab demonstrates how Terraform can be used to manage infrastructure efficiently, from simple resources to complex, scalable systems. It highlights the importance of automation, modular design, and best practices in modern DevOps workflows.

---

# 👨‍💻 Author

**Name:** Vraj Borad
**Course:** Software Lab – Infrastructure as Code
**Submission:** GitHub Repository

---
