pipeline {
    agent any
    stages {
        stage("Lint JAVA"){
            steps {
                sh "tidy -q -e *.java"
            }
        }

        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}