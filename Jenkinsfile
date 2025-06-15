pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        bat 'docker build -t myjava1 .'
        bat 'docker tag myjava1 %DOCKER_BFLASK_IMAGE%'
      }
    }
    stage('Test') {
      steps {
        bat 'docker run myjava1'
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin docker.io"
          bbat 'docker push %DOCKER_BFLASK_IMAGE%'
        }
      }
    }
  }
  post {
    always {
      bat 'docker logout'
    }
  }
}


// pipeline {
//   agent any

//   environment {
//     DOCKER_BFLASK_IMAGE = 'gayanpj/myjava1:latest'     // Your Docker image tag
//     DOCKER_REGISTRY_CREDS = 'dckr_pat_DsiP4ALrgK3_tj60eO8ULmiD9zE' // Your credentials ID
//   }

//   stages {
//     stage('Build') {
//       steps {
//         bat 'docker build -t myjava1 .'
//         bat 'docker tag myjava1 %DOCKER_BFLASK_IMAGE%'
//       }
//     }

//     stage('Test') {
//       steps {
//         bat 'docker run --rm myjava1'
//       }
//     }

//     stage('Deploy') {
//       steps {
//         withCredentials([
//           usernamePassword(
//             credentialsId: "${DOCKER_REGISTRY_CREDS}",
//             usernameVariable: 'DOCKER_USERNAME',
//             passwordVariable: 'DOCKER_PASSWORD'
//           )
//         ]) {
//           bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin docker.io'
//           bat 'docker push %DOCKER_BFLASK_IMAGE%'
//         }
//       }
//     }
//   }

//   post {
//     always {
//       bat 'docker logout'
//     }
//   }
// }
