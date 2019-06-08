pipeline {
    agent {
        docker {
            image 'node:10.16.0-alpine'
        }
    }
    environment {
        CHROME_BIN = '/usr/bin/chromium-browser'
    }
    stages {
        stage('Fetch dependencies') {
            steps {
                sh 'npm install -g @angular/cli@8.0.2'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'ng test --browsers ChromeHeadless --watch=false'
            }
        }
        stage('Build') {
            steps {
                sh 'ng build --prod --aot --build-optimizer --extract-css --output-hashing=all'
            }
        }
    }
}
