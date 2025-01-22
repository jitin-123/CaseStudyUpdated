pipeline {
    agent any

    environment {
        ANSIBLE_DIR           = 'ansible'
        INVENTORY_PATH        = './aws_ec2.yaml'
        TERRAFORM_DIR         = 'terraform'
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key')
        AWS_DEFAULT_REGION    = 'us-east-1'      //change to your region
        PRIVATE_KEY           = credentials('node_private_key') //key-value pair stored in Jenkins credentials 
    }

    stages {
        stage('Terraform') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    echo "Running Terraform commands..."
                    sh 'terraform init'
                    sh 'terraform validate'                       
                    sh 'terraform apply -auto-approve -var "aws_access_key=${AWS_ACCESS_KEY_ID}" -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" || exit 1'
                }
            }
        }

        stage('Ansible') {
            steps {
                dir("${ANSIBLE_DIR}") {
                    echo "Running Ansible Playbooks..."
                    sh 'ansible-inventory -i "${INVENTORY_PATH}" --graph'
                    echo "Installing Apache Server on EC2 Instance"
                    sh """
                     ansible-playbook -i "${INVENTORY_PATH}" playbook.yml \
                     --user ec2-user \
                     --private-key "${PRIVATE_KEY}" \
                     --limit target
                     """
                }
            }
        }
    }

  post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
        
    }
}
