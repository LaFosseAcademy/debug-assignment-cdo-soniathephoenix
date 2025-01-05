# DevOps Debug Assignment - instructions

In this assignment, you'll be editing an existing software project. There are several problems in the code, and it's your job to find and fix them all.

## Duration

- You'll have three hours to complete this debug assignment

## Rules

- Do not ask your classmates (verbally or through any other communication method) for help
- Do not copy/paste any code from someone else or from any online resource
- Do not edit any files in the `instructions` folder
- Do not use ChatGPT or any other AI code tools

## Process

- This repository has been automatically created for you
- **Clone** it onto your machine (**do not** fork it)
- Work on the `main` branch, and make all your commits there
- Run `git push` to sync your local changes with the remote repository
- A pull request (PR) has been automatically created on the remote repository for you (**do not** delete this)
- When you have made your final commits (and pushed), request a review on the PR from your assigned reviewer

## Project context

The Tour De France has long taken European Cycling enthusiastes by storm! For our European fans, accessing our application is a breeze; there's low latency and the API is highly available. 

However in the US the site hasn't been performing as well. The Tour organisers have asked for you to deploy the same two microservices which form this API in North Virginia to bring the best Tour De France data to the US market!

You'll be tasked with fixing and building configuration relating to Docker, Terraform and Ansible to successfully deploy an application consisting of two microservices:
- **Tour De France DB:** This microservice contains as PostgresDB regarding the teams and cyclists competing in the 2024 Tour De France.
- **Tour De France MVC:** This microservice is a Express.js Backend which exposes several endpoints to retrieve information about the competing teams. 

## Instructions

- **Containerise** the two microservices using **Docker**
- **Provision** an EC2 Instance using **Terraform** to create the infrastructure for the application deployment
- **Configure** the EC2 Instance using **Ansible** to enable **Docker** and to execute a `docker-compose.yml` file. 
- Create a `README` file with the instructions detailing how to:
  - Execute the **Terraform** scripts
  - Run the **Ansible** playbooks onto the provisioned resources
  - Access the deployed application
- Create a `business-value.md` file and using between 200-400 words explain the business value added by using the technologies covered in this assessment and Cloud Resources generally. It should also comment on ideas like:
  - Scalability
  - Performance Optimisation
  - Cost Savings
  - Automation 



## Scope of the assessment

- You're expected to use your own Docker Images to complete this assessment
- You're expected to provision resources using your own AWS Credentials
  - The resource should use a **free-tier AMI**
  - The resource should use a **free-tier Instance Type**
- Both **Ansible Playbooks** should be executed in order to run the application
- It's your choice how you ensure the **Docker Images** are accessible on the provisioned instance
  - However it must be documented in your `README` how the marker can replicate your process

### Code Base

- You're not being assessed on the code base which creates the **database** and the **mvc**
- You'll be expected to use that code base to build your **Docker Images** but the code base itself should not be changed
- Keep the `.env` and don't place inside a `.gitignore` to ensure the deployment process can be recreated accurately

### Provisioning Resources

- You should have access to one **EC2 Instance** in **North Virginia**
- The deployed application should be reachable on the instances **Public IPv4 Address** on port 3000
- You're not being tested on setting up a **remote backend**, don't establish one for this assessment 
- **Remove** the following files before **commiting & pushing**: 
  - `.terraform`
  - `.terraform.lock.hcl`
  - `terraform.tfstate`
  - `terraform.tfstate.backup`

### Containerisation

- Both microservices should be established as their own **Docker Image** using your own Docker account, i.e. `<your-docker-username>/tour-de-france-db:0.0.1.RELEASE`
- The two microservices should be deployed using a `docker-comose.yml` file which should be present in your assessment repository when you push your final code

### Ansible

- You should not use **Boto3** to dynamically access provisioned resources
  - Instead use the `./ansible_hosts` file to define your EC2 Server

### What does complete look like?

A completed assessemnt should allow you to access the **Public IPv4 Address** and access the different end points to retrieve information about the contestants in the 2024 Tour de France. 

Example endpoints which should be reachable:
- `<ec2-instance-ipv4-ip-address>:3000/tour-de-france/cyclists`
- `<ec2-instance-ipv4-ip-address>:3000/tour-de-france/teams`

### Tips

You'll need to find a way for your **EC2 Instance** to have access to your `docker-compose.yml` file and also the two **Docker images**; whether you build these directly on the **EC2 Instance** or ensure they're remotely accessible is your decision but you'll need to include directions for your deployment strategy in the **README.md**

It's possible to edit files using tools like **nano** and it's possible to copy files to remote devices using tools like **scp** / **WinSCP**

---

[Back](../README.md)

---
