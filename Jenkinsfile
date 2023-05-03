pipeline {
  agent any
   stages {
     stage('Git checkout') {
       steps {
        checkout scm
       }
    }
    stage('Build') {
        steps {
                     sh '''
                         chmod ugo+x ./scripts/build.sh
                         ./scripts/build.sh
                     '''
                 }                
        }
    stage('Test') {
        steps {
             sh '''
                 chmod ugo+x ./scripts/test.sh
                 ./scripts/test.sh
                 '''
        }        
    }

    stage('Docker Build') {
         steps {
            script{
                docker.build("${registry}:${env.BUILD_ID}")
            }
         }
     }
    }

stage('Publish') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub-id') {
            docker.image("${registry}:${env.BUILD_ID}").push('latest')
          }
        }

      }
    }


 environment {
   registry = 'dmytro108/cicdhw'
 }
}