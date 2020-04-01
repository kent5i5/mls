pipeline {
    agent any
    stages {
        stage("Lint JAVA"){
            steps {
                sh "java -version"
            }
        }

        stage('build') {
            steps {
                sh 'mvn --version'
                sh '/home/ubuntu/lint4j-0.9.1/bin/lint4j -version'
            }
        }
    }
}