pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/avinash-tayade/devops-assignment.git'
            }
        }

        stage('Terraform Security Scan') {
            steps {
                sh 'docker run --rm -v $PWD:/workspace aquasec/trivy config /workspace/terraform'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform plan'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Security Scan (Trivy)') {
            steps {
                sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image devops-app'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker stop devops-container || true'
                sh 'docker rm devops-container || true'
                sh 'docker run -d --name devops-container -p 5000:5000 devops-app'
            }
        }

    }
}