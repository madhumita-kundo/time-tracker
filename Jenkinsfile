#!/usr/bin/env groovy
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
				sh 'mvn clean compile'
				}
		}
		stage('package'){
			steps {
				sh 'mvn package'
				}
		}
		stage('clear service'){
			steps {
				sh ''' GO=$(docker service ls | grep "time-tracker" | wc -l)
				if [ $GO -ne 0 ]
 				then
   				docker service rm time-tracker
   				fi
				'''
				}
		}
		stage('docker build'){
			steps {
				sh 'docker build -t timetracker-test:${BUILD_NUMBER} .'
				}
		}
		stage('swarm service'){
			steps {
				sh 'docker service create --name time-tracker -d -p 8000:8080 timetracker-test:${BUILD_NUMBER}'
				}
		}
	}
}
