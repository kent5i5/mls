pipeline {
    // environment {
    //     registry = "yinkin/udacity"
    //     registryCredential = 'dockerhub'
    // }
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
                // sh 'ls'
                // sh 'docker image ls'
                // sh 'git clone https://github.com/kent5i5/mls.git'
                // sh 'cd mls'
                
                // sh '''docker build -tag mls:latest .
                // '''
                
                
                // script {
                //     docker.build registry + ":$BUILD_NUMBER"
                // }

                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
                    // sh '''
                    // docker image ls'''
                    sh '''
                    docker build -t yinkin/mls:$BUILD_ID .'''
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
                sh 'kubectl config set-cluster arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster'
                
            }
        }

        stage('Deploy container') {
            steps{
                    sh 'ls -l'
                    //sh 'kubectl config use-context arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster' 
                    sh 'kubectl apply -f blue-green-service.json'
                    sh 'kubectl apply -f ./blue/blue-controller.json'
            }
        }
    }
}