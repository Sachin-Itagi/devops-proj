pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yaml'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Sachin-Itagi/devops-proj.git'
            }
        }

        stage('Build the Project using maven') {
            steps {
                script {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t sachinitagi/todo-application:latest ."
                }
            }
        }

        stage('Push Docker image to Dockerhub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USER} --password-stdin"
                        sh "docker push sachinitagi/todo-application:latest"
                    }
                }
            }
        }
        stage('Clean the workspace') {
            steps {
                script {
                    sh "pwd && ls"
                }
            }
        }
    }
}
