pipeline {
  agent any
    environment {
          PASSWORD = credentials('sudopassw')
          USER = 'jenkins'
      }
   stages {
     stage('Git checkout') {
       steps {
        checkout scm
       }
    }
    stage('Build') {
        steps {
                // withCredentials([usernamePassword(credentialsId: 'sudopassw', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]){
                sh '''
                echo user: ${USER}
                echo user: $USER
                echo passw: ${PASSWORD}
                echo ${PASSWORD} | sudo -S dnf install npm -y
                chmod ugo+x ./scripts/build.sh
                ./scripts/build.sh
                
                '''
                // }
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