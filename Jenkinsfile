pipeline {
    agent any

    stages {

        stage("Checkout source") {
            steps {
                git url: 'https://github.com/cbustoso/aws-terraform.git', branch: 'main'
                sh 'ls'
            }
        }

        stage('Execução do projeto Terraform') {
            environment {
                AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
                AWS_DEFAULT_REGION = credentials('AWS_DEFAULT_REGION')
            }
            steps {
                script {
                        sh 'terraform init"' 
                        sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}