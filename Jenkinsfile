pipeline {
    agent any

// ******************* Settings ************************************
    environment {
        registry = 'dmytro108/cicdhw'
    }

   stages {
// ******************** GIT Checkout *******************************
        stage('Git checkout') {
            steps {
                checkout scm
            }
        }

 // **************** Build *****************************************   
        stage('Build') {
            steps {
                         sh '''
                             chmod ugo+x ./scripts/build.sh
                             ./scripts/build.sh
                         '''
            }                
        }
 
 // ******************** Test ************************************   
        stage('Test') {
            steps {
                 sh '''
                     chmod ugo+x ./scripts/test.sh
                    ./scripts/test.sh
                    '''
            }        
        }

// ************************ Docker Build *************************
        stage('Docker Build') {
            steps {
                script{
                    docker.build("${registry}:${env.BUILD_ID}")
                }
            }
        }

// ******************* Docker Hub Publish *****************************
        stage('Publish') {
            steps {
                script {
                        docker.withRegistry('', 'dockerhub-id') {
                            docker.image("${registry}:${env.BUILD_ID}").push('latest')
                        }         
                }

            }
        } 
    }
}