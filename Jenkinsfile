pipeline {
    agent any
    environment{
        git_cred = credentials('github-cred') // will extract the cred from jenkins using Credentials Binding plugin
    }
    tools{
        maven 'Maven' //this will install maven so u can run mvn cmd even if itsnot installed on the machine
    }
    stages {
        stage("build") {
            steps {
                bat "mvn clean package -Dmaven.test.skip"
            }
        }
        stage("copy jar file to downlaods") {
            steps {
                bat "copy C:\ProgramData\Jenkins\.jenkins\workspace\workin-springboot_main\target\*.jar C:\test101"
                echo "the github cred is ${git_cred}"
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
