pipeline {
    options {
       buildDiscarder(logRotator(numToKeepStr: '5' , artifactNumToKeepStr: '5'))

    }
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('terraform-aws-sneha')
        AWS_SECRET_ACCESS_KEY = credentials('terraform-aws-sneha')
    }
    stages {
        stage('Terraform Version'){
            steps{
            echo 'Terraform initlization in progress'
            sh 'terraform --version'
        }
        }
    
        stage('Terraform format'){
            steps{
            echo 'Terraform initlization in progress'
            sh 'terraform fmt'
        }
        }
        
        stage('Terraform Init'){
            steps{
            echo 'Terraform initlization in progress'
            sh 'terraform init'
        }
        }
        stage('Terraform Plan'){
            steps{
            echo 'Terraform initlization in progress'
            sh 'terraform plan -var-file=terraform.tfvars -out=tfplan.txt'
        }
        }
         stage('Approval'){
        when {
            not {
                equals expected: true, actual: params.autoapprove
            }
        }
        steps {
            script{
                def plan = readFile 'tfplan.txt'
                input message: "do you want apply the plan"
                parameters: [text(name: 'Plan', description: 'please review the plan', defaultValue: plan)]
            }
        }
        }
          stage('Terraform Apply'){
          steps{
            echo 'Terraform apply'
            sh 'terraform apply --auto-approve'
        }
        }
    }
}