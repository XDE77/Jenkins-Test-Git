pipeline {
  agent any
  environment {
    AWS_REGION = 'us-east-1'
  }
  stages {
    stage('Verify AWS credential binding') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'BunJank',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh '''
            set -euo pipefail
            # Do not echo secrets. Verify identity only.
            aws sts get-caller-identity --region ${AWS_REGION}
          '''
        }
      }
    }
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'BunJank'
        ]]) {
          sh '''
            set -euo pipefail
            terraform plan -out=tfplan
          '''
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        input message: "Approve Terraform Apply?", ok: "Deploy"
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'BunJank'
        ]]) {
          sh '''
            set -euo pipefail
            terraform apply -auto-approve tfplan
          '''
        }
      }
    }
  }
  post {
    success { echo 'Terraform deployment completed successfully!' }
    failure { echo 'Terraform deployment failed!' }
  }
}
}
