node {
    stage('Github Checkout'){
        git 'https://github.com/sunilsankar/Docker-python.git'
    }
    
    stage('Docker Build Image'){
        sh label: '', script: 'docker build -t sunilsankar/my-app:1.0.0 .'
    }
    stage('Docker Push Registry'){
        withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
          sh label: '', script: "docker login -u sunilsankar -p ${dockerpwd}"
       sh label: '', script: 'docker push sunilsankar/my-app:1.0.0 ' 
}
    }   
    stage('Docker Run'){
        sshagent(['vagrant']) {
            def dockerRun= 'docker run -d --name my-app -p 5000:5000 sunilsankar/my-app:1.0.0'
       sh "ssh -o StrictHostKeyChecking=no -l vagrant 192.168.18.101 ${dockerRun}"
}
    }
}