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
            when{
                expression{
                    BRANCH_NAME == 'dev'  // BRANCH_NAME this is env fro jenkins
                    //to view all env by jenkins http://172.20.35.36:8080/env-vars.html/
                }
            }
            steps {
                echo "this is the deploy stage for dev only"
            }
        }
    }
    post{ //this will run after all stages are done
        always{ //always meant that it will always be executed whether it fail or succeed
          steps{
            echo "POST always expression"
          }
        success{
            steps{
                echo "POST succeeded"
            }
        }
        failure{
            steps{
                echo "POST failure"
            }
        }
        }

    }
}
