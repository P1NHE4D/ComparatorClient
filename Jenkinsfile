pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }
        stage('Static code analysis') {
            steps {
                sh 'flutter analyze'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter build apk --release
                  '''
            }
        }
    }
}