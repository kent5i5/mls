pipeline {
    agent { dockerfile true}
    stages {
        stage("Lint JAVA"){
            steps {
                sh "java -version"
            }
        }

        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}