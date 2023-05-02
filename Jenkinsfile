pipeline {
  agent any
  docker {
      image 'mybuild'
      dns '8.8.8.8'
      dns '8.8.4.4'
    }
   stages {
     stage('Git checkout') {
       steps {
        checkout scm
       }
    }
    stage('Build') {
        steps {
            script {
                // docker build -t mybuild
                   //def customImage = docker.build("${registry}:${env.BUILD_ID}").inside {c ->
                     sh '''
                         docker build -t mybuild
                         chmod ugo+x ./scripts/build.sh
                         ./scripts/build.sh
                     '''
                 //}                
                
        }
    }
    // stage('Test') {
    //     steps {
    //          sh '''
    //              chmod ugo+x ./scripts/test.sh
    //              ./scripts/test.sh
    //             '''            
    //     }
    // }
    // stage('Docker Build') {
    //     steps {
    //        sh "docker build -t testbuild"
    //     }
    // }
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
 environment {
   registry = 'dmytro108/cicdhw'
 }
}