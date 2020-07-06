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

                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
                    sh '''
                    docker image ls'''
                    // sh '''
                    // docker build -t yinkin/mls:$BUILD_ID .'''
                    sh '''
                    docker build -t yinkin/mls:latest .'''
                }
            }
        }

        stage('Push image') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push yinkin/mls:latest'
                }
            }
        }

        stage('set current kubectl context') {
            steps{
                sh 'eksctl version'
                sh 'kubectl config set-context arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster --cluster=arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster'
                sh 'kubectl config get-contexts'
                sh 'kubectl config use-context arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster --cluster=arn:aws:eks:us-west-2:168180329753:cluster/capstonecluster' 
            }
        }

        stage('Deploy blue container') {
            steps{
                //withAWS(region:'us-west-2', credentials:'aws-static') {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){

                    sh 'ls -l'
                    sh 'kubectl create-f ./blue-green-service.json'
                    sh 'kubectl get all' 

                    sh 'kubectl apply -f ./blue/blue-controller.json'
                }
                //}
            }
        }

        stage('Switch green container') {
            steps{
                withAWS(region:'us-west-2', credentials:'aws-static') {

                    sh 'kubectl apply -f ./green-controller.json'
                }
            }
        }
    }
}