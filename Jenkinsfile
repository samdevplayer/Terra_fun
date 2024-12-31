pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the source code from the Git repository
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform and set up the working directory
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    // Validate the Terraform configuration files
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and show the Terraform execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan to create/update resources
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            // Archive the Terraform state file for later reference
            archiveArtifacts artifacts: '**/*.tfstate', allowEmptyArchive: true
        }

        success {
            // Notify success if the pipeline runs successfully
            echo "Terraform applied successfully!"
        }

        failure {
            // Notify failure if something goes wrong
            echo "Terraform apply failed. Check the logs for details."
        }

        cleanup {
            // Clean up the workspace after the job
            cleanWs()
        }
    }
}
