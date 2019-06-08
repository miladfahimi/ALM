pipeline {
    agent {
        docker {
            image 'node:10.16.0-alpine'
        }
    }
    environment {
        CHROME_BIN = '/usr/bin/chromium-browser'
        DOCKER = credentials('dockerhub')
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
                sh 'apk add --no-cache chromium udev ttf-freefont'
                sh 'ng test --watch=false --progress=false --browsers=ChromeHeadlessCI'
            }
        }
        stage('Build') {
            steps {
                sh 'ng build --prod --aot --build-optimizer --extract-css --output-hashing=all'
            }
        }
        stage('Build docker image'){
            steps {
                sh '/usr/bin/docker build -t $DOCKER_USR:alm .'
            }
        }
        stage('Push docker image'){
            steps {
                sh '/usr/bin/docker login -u $DOCKER_USR -p $DOCKER_PSW'
                sh '/usr/bin/docker push $DOCKER_USR:alm'
            }
        }
    }
}
