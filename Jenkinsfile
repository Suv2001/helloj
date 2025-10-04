@Library('hello') _

pipeline {
    agent { label "vm-ubuntu" }

    stages {
        stage('Greeting'){
            steps {
                hello()   // ✅ works because vars/hello.groovy has call()
            }
        }
        
        stage('Code') {
            steps {
                dir("${env.WORKSPACE}") {
                    deleteDir()   // Clean workspace
                }
                clone('https://github.com/Suv2001/helloj.git', 'main')
                echo "Code Cloning Completed..."
            }
        }

       stage('Build') {
    steps {
        dir('helloj') {
            sh 'docker build -t note-app:latest .'
        }
    }
}


        stage('Test') {
            steps {
                echo "Testing the Code"
            }
        }

        stage("Push To Docker Hub") {
            steps {
                echo "Pushing to Docker Hub"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to the Production Server"
                sh "docker run -d -p 3000:3000 flask-app:latest"
            }
        }
    }
}
