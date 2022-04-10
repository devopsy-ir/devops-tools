Jenins auto provisioned
Suppose your jenkns instance is down accidently and all of it's volume contents is cleared! What a bad situation.  Is not it? ::IF:: all of your jenkins' instance contents 
is in text files beside of jenkins docker-compose yaml file, you can restore jenkins up again ::ELSE:: you can not
You can make your jenkins auto up without any data loss. It means jenkins auto provisioning.
<br/>
Note: Copy `files/jars/*.jar` into `volumes/jenkins/home/war/WEB-INF/lib/` after starting the container! to avoid Crowd2 plugin compatibility issues with java11.
