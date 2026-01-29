pipeline {
    agent any
    tools {
        // Install the Maven  version configured as "Maven3.9.12" and add it to the path.
        maven "Maven3.9.12"
        jdk 'Corretto-17'
    }
    stages {
        stage('Fix Java & Run') {
            steps {
                script {
                    // Récupère dynamiquement le chemin du JAVA_HOME configuré
                    def javaHome = tool name: 'Corretto-17', type: 'jdk'
                    // Trigger de sécurité : force le chmod avant toute action
                    sh "chmod +x ${javaHome}/bin/java"
                }
                sh 'java -version'
            }
        }
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh 'chmod +x mvnw'
                sh "./mvnw clean install package"
            }
            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.war'
                }
            }
        }
    }
}
