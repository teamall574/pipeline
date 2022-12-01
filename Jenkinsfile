pipeline {
    agent any
    stages {
        stage('clone') {
           steps {
               echo "${BUILD_NUMBER}"
               sh 'rm -f *.war && bash build.sh && mv ROOT.war ROOT{BUILD_NUMBER}.war'
               sh 'ls -al'
           }
        }    
    }
}