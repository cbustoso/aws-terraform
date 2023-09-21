pipeline {
    agent any 
    environment {
       AWS_DEFAULT_REGION = 'us-east-1' 
    }
    options {
      disableConcurrentBuilds()
      parallelsAlwaysFailFast()
      timestamps()
      withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding', 
            credentialsId: '59206b9c-cfa0-4b02-b8f3-38dfe615c214', 
            accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) 
    }
    parameters { 
          choice(name: 'ACCION', choices: ['', 'plan-apply', 'destroy'], description: 'Seleccione acción a ejecutar')
    }
    stages{ 
        stage('Clean Workspaces -----------') { 
            steps {
              cleanWs()
              sh 'env'
            } //steps
        }    
        stage('Carga de codigo terraform -----------') {     
            steps {
                checkout([$class: 'GitSCM', 
                branches: [[name: '*/main']], 
                doGenerateSubmoduleConfigurations: false, 
                extensions: [[$class: 'CleanCheckout']], 
                submoduleCfg: [], 
                userRemoteConfigs: [
                        [url: 'https://github.com/cbustoso/aws-terraform.git', te: '']
                        ]])
                sh 'pwd' 
                sh 'ls -l'
            } //steps
        }  //stage
        stage('Terraform init----') {
         steps {
            sh 'terraform --version'
            sh 'terraform init'
            } //steps
        }  //stage
                stage('Terraform plan----') {
            steps {
               sh 'terraform plan'
            } //steps
        }  //stage
        stage('Confirmación de accion') {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: params.ACCION + '?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
            }//steps
        }//stage
        stage('Terraform apply or destroy ----------------') {
            steps {
               sh 'echo "comienza desplieguen"'
            script{  
                if (params.ACCION == "destroy"){
                         sh 'terraform destroy -auto-approve'
                } else {                 
                         sh ' terraform apply -auto-approve'  
                }  // if
            }
            } //steps
        }  //stage
   }  // stages
}//pipeline