pipeline {
  agent any
  stages {
    // stage('Git checkout') {
    //   steps {
    //    git https://github.com/dmytro108/cicd-pipeline.git


    //   }
    // }
    stage('Build') {
        steps {
            script scripts/build.sh
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