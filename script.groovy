def  build() {
    bat "mvn clean package -Dmaven.test.skip"
}

def copyfile() {
    bat "copy C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\workin-springboot_main\\target\\*.jar C:\\test101"
}

return this //so it can be imported to jenkinsfile