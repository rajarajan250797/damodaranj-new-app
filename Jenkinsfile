node
{
   def buildNumber = BUILD_NUMBER
stage("Git CheckOut"){
        git url: 'https://github.com/Vignesh15git/damodaranj-new-app',branch: 'master'
    }
    stage(" Maven Clean Package"){
      def mavenHome=  tool name: "maven3", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    }
    stage("Build Dokcer Image") {
    sh "docker build -t vignesh1592/javawebapp:${buildNumber} ."
    }
    stage("Docker login and Push"){
    withCredentials([string(credentialsId: 'docker_hub_password', variable: 'Dockerpassword')]){
    sh "docker login -u vignesh1592 -p ${Dockerpassword} " 
    sh "docker push vignesh1592/javawebapp:${buildNumber}"
    
           }  }
    stage("Deploy to dockercontinor in docker slave"){
    sshagent(['ad1047a1-6c50-498c-9fd7-389bee5ec464']) {
    sh "ssh -o StrictHostKeyChecking=no ubuntu@13.232.50.184 docker rm -f cloudcandy || true"
    sh "ssh -o StrictHostKeyChecking=no ubuntu@13.232.50.184 docker run -itd -p 8082:8080 --name cloudcandy vignesh1592/javawebapp:${buildNumber}"           
     }  }
   }
