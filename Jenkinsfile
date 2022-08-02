pipeline {
    agent any

    tools { 
        maven 'my-maven' 
        jdk 'my-jdk' 
    }
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    stages{

        stage ('Build maven') {
            steps {
                sh 'echo $HOVATEN'
                echo "Hello ${params.MYNAME}"
                echo 'Building nginx image..'
                sh 'mvn --version'
                sh 'pwd'
                sh 'ls -la'
                sh 'mvn clean package -Dmaven.test.failure.ignore=true'
                stash includes : 'target/*.jar', name: 'app'
            }
        }

        stage('Package to docker image') {

            steps {
                unstash 'app' 
                sh 'ls -la'
                sh 'ls -la target'
                sh 'docker build -t hoangledinh65/rest-springboot:1.0 .'
            }
        }
        stage('Pushing image') {
            steps {
                sh 'echo $HOVATEN'
                echo 'Start pushing.. with credential'
                sh 'echo $DOCKERHUB_CREDENTIALS'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push hoangledinh65/rest-springboot:1.0'
                
            }
        }

    }
}