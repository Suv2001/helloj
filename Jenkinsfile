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
                clone('https://github.com/Suv2001/helloj.git', 'main')  // ✅ works
                echo "Code Cloning Completed"
            }
        }

        stage('Build') {
            steps {
               buildImage('note-app', 'latest')
            } 
        }

        stage('Test') {
            steps {
                echo "Testing the Code"
            }
        }

        stage("Push To Docker Hub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCred', 
                                                  usernameVariable: 'DOCKER_USER', 
                                                  passwordVariable: 'DOCKER_PASS')]) {
                    echo "Pushing to Docker Hub..."
                    sh """
                        echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin
                        echo "Login Successful"
                        docker image tag flask-app:latest ${DOCKER_USER}/flask-app:latest
                        docker push ${DOCKER_USER}/flask-app:latest
                        echo "Image pushed to Docker Hub"
                    """
                }
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
