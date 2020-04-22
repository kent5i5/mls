pipeline {
    environment {
        registry = "yinkin/udacity"
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage("Lint JAVA"){
            steps {
                sh "java -version"
                sh '/home/ubuntu/lint4j-0.9.1/bin/lint4j -sourcepath ~/jobs/mls_docker/*.java'
            }
        }

        stage('build') {
            steps {
                sh 'mvn --version'
               
            }
        }

        stage('Build image') {
            steps {
                // sh 'git clone https://github.com/kent5i5/mls.git'
                // sh 'cd mls'
                // sh '''docker build -tag mls:latest .
                // '''
                sh 'docker image ls'
                // script {
                //     docker.build registry + ":$BUILD_NUMBER"
                // }
            }
        }

        stage('Push image') {
            steps {
                sh 'docker login'
                sh 'docker push yinkin/mls:latest'
            }
        }

        stage('set current kubectl context') {
            steps{
                sh 'eksctl version'
            }
        }

        // stage('Deploy container') {
        //     steps{

        //     }
        // }
    }
}