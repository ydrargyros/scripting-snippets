        stage('Build') {
            steps {
                script {
                    checkout scm
                    def commitMessage = getLastCommitMessage()
                    // Change the Build Name, and show it on the list of builds, above description
                    def buildName = "#${params.Build_ID} - deploy to ${params.environment} - ${commitMessage}" 
                }
            }
        }



        stage('Update Job Description') {
            steps {
                script {
                    def currentJob = currentBuild.rawBuild
                    def lastCommitMessage = sh(script: 'git log -1 --pretty=%B', returnStatus: true).trim()
                    
                    if (lastCommitMessage) {
                        currentJob.setDescription(lastCommitMessage)
                        currentJob.save()
                    }
                }
            }
        }
