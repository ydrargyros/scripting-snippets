// Sample function
def call() {
    properties([
        parameters([
            booleanParam(defaultValue: false, name: 'BuildAll', description: ''),
            [$class: 'ChoiceParameter', choiceType: 'PT_CHECKBOX',
                description: 'Choose environment category.',
                name: 'ENVIRONMENT',
                script: [
                    $class: 'GroovyScript',
                    script: [sandbox: true, script: 'return ["QA", "DEV", "PROD"]']
                ]
            ]
        ])
    ])
}

// Sample usage
@Library('my-library@branch or tag') _

// call deriveJobParams at beginning
deriveJobParams()

pipeline {
    
  stages {
  }
}