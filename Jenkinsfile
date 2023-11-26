pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def dockerImage = docker.build('turrence/archistar-project')
                    dockerImage.push()
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('turrence/archistar-project').run('-p 8080:8080 --name achistar-project')
                }
            }
        }
    }
}
