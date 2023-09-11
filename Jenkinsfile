def gv

pipeline {
    agent any
    tools {
       
        maven "MAVEN"
        
    }
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "localhost:8081"
        NEXUS_REPOSITORY = "java-app"
        NEXUS_CREDENTIAL_ID = "NEXUS_CRED"
    }
    stages {
        stage("Clone code from Github jhgjhand nexus 11 ") {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubwithpassword', url: 'https://github.com/Quvonchdev/java-maven-app.git']]])
                }
            }
        }
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn -Dmaven.test.failure.ignore=true clean package"
                }
            }
        }
        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findfiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artificatPath = filesByGlob[0].path;
                    artificatExists = fileExists artificatPath;
                    if(artificatExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: nexusUrl,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                        
                    }
                }
            }
        }


        //sdsdcsd
    }   
}
