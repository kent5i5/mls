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
                // sh 'docker image ls'  
                sh 'ls'
                sh 'cd ..'
                //sh 'git clone https://github.com/kent5i5/mls.git'
                sh 'cd mls'
                sh '''docker build -tag mls:latest .
                '''
                
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        // stage('Push image') {
        //     steps {
        //         sh 'docker push yinkin/mls:latest'
        //     }
        // }

        stage('set current kubectl context') {
            steps{
                sh 'eksctl version'
                // sh 'kubectl config set-cluster arn:aws:eks:us-west-2:168180329753:cluster/prod'
                // sh 'kubectl config use-context arn:aws:eks:us-west-2:168180329753:cluster/prod'
            }
        }

        // stage('Deploy container') {
        //     steps{

        //     }
        // }
    }
}