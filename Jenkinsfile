pipeline {
    agent any
    stages {
        stage('clone') {
           steps {
               echo "${BUILD_NUMBER}"
               sh 'bash build.sh'
               sh 'ls -al'
           }
        }    
    }
}