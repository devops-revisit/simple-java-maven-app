pipeline
{
	agent any
	tools
	{
		maven 'maven3.9'
	}
	environment {
	IMAGE_NAME = "simple-maven-app"
	CONTAINER_NAME = "simple-maven-app"
	PORT = "8081"
	}
	stages
	{
		stage('Checkout') {
			steps {
				git credentialsId: 'github', url: 'https://github.com/devops-revisit/simple-java-maven-app.git'
			}
		}
		stage('Build')	{
			steps {
				sh 'mvn clean package -DiskipTest'
			}
		}
		stage('Verify Build')	{
			steps {
				sh 'ls -l target/'
			}
		}
		stage('SonarQube Analysis') {
			steps {
				withSonarQubeEnv('SonarQube') {
 			   	sh """
                    		mvn sonar:sonar \
                    		-Dsonar.projectKey=${JOB_NAME} \
                    		-Dsonar.projectName=${JOB_NAME}
                    		"""
				}
			}
		}
		stage('Docker Build image') {
			steps {
				sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
			}
		}
	}
}
