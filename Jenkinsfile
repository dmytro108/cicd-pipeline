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
            script { scripts/build.sh }
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