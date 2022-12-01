pipeline {
    agent any
        environment {
        registry = 'anji1592/pipeline'
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    stages {
        stage('clone') {
           steps {
               echo "${BUILD_NUMBER}"
               sh 'rm -f *.war && bash build.sh && mv ROOT.war ROOT${BUILD_NUMBER}.war'
               sh 'ls -al'
           }
        }  
        stage('push artifacts to s3') {
           steps {
              s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'anji4845', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD_IA', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'devops-test', userMetadata: []
           }
        }
        stage('Docker Image Building') {
           steps {
              script {
                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
           }
        }
        stage('Push the docker image') {
           steps {
              script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                  } 
              }
           }
        }        
    }
}