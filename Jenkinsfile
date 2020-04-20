pipeline {
     agent any
	stages {
		stage('Git Checkout'){
			steps {
				git 'https://github.com/madhumita-kundo/time-tracker.git'
				}
		}
		stage('compile'){
			steps {
				sh 'mvn compile'
				}
		}
		stage('clean'){
			steps {
				sh 'mvn clean'
				}
		}
		stage('path'){
			steps {
				sh 'pwd'
				}
		}
		stage('clear container'){
			steps {
				sh 'docker container rm --force time-tracker'
				}
		}
		stage('docker build'){
			steps {
				sh 'docker build -t timetracker-test:${BUILD_NUMBER} .'
				}
		}
		stage('docker run'){
			steps {
				sh 'docker container run --name time-tracker -d -p 8888:8080 timetracker-test:${BUILD_NUMBER}'
				}
		}
	}
}
