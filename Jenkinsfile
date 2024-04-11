pipeline {
    agent any
    
    environment {
        // Define any environment variables needed
        DOCKER_IMAGE = 'myappimage:latest'
    }
    
    stages {
        stage('Build') {
            steps {
                // Checkout your source code from your version control system
                git branch: 'main', url: 'https://github.com/nagvadraj/IntellipaatCapstoneProject1.git'
                
                // Build Docker image
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }
        
        stage('Push') {
            steps {
                // Push Docker image to a registry
                script {
                    docker.withRegistry('https://hub.docker.com/', 'cred2') {
                        docker.image(env.DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}
