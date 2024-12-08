pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo "this is the build stage"
            }
        }
        stage("deploy") {
            steps {
                echo "this is the deploy stage"
            }
        }
        stage("deploy dev") {
            when {
                expression {
                    BRANCH_NAME == 'dev' // BRANCH_NAME is an environment variable in Jenkins
                }
            }
            steps {
                echo "this is the deploy stage for dev only"
            }
        }
    }
    post { // This will run after all stages are completed
        always { // Executes regardless of success or failure
            echo "POST always expression"
        }
        success { // Executes only if the pipeline succeeds
            echo "POST succeeded"
        }
        failure { // Executes only if the pipeline fails
            echo "POST failure"
        }
    }
}
