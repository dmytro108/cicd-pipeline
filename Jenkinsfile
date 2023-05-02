pipeline {
  agent any
   environment {
         PASSWORD = credentials('sudopassw')
         USER = ''
     }
   stages {
     stage('Git checkout') {
       steps {
        checkout scm
       }
    }
    stage('Build') {
        steps {
                withCredentials([usernamePassword(credentialsId: 'sudopassw', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]){
                sh '''
                echo $PASSWORD | sudo dnf install npm -y -S
                chmod ugo+x ./scripts/build.sh
                ./scripts/build.sh
                
                '''
                }
        }
    }

//     stage('Publish') {
//       steps {
//         script {
//           docker.withRegistry('', 'dockerhub-id')
//           { docker.image("${registry}:${env.BUILD_ID}").push('latest')
//         }
//       }
//     }
//   }


 }
// environment {
//   registry = 'dmytro108/cicdepam'
// }
}