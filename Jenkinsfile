pipeline {
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
            agent {
                dockerfile true 
            }
            steps {
                // withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']])
                sh '''docker build --tag=168180329753.dkr.ecr.us-west-2.amazonaws.com/mls .
                '''
            }
        }

        stage('Push image') {
            steps {
                sh 'docker push 168180329753.dkr.ecr.us-west-2.amazonaws.com/mls:latest'
            }
        }

        // stage('set current kubectl context') {
        //     steps{

        //     }
        // }

        // stage('Deploy container') {
        //     steps{

        //     }
        // }
    }
}