# DockerPractice
Creating a Dockerfile and image for performing task i.e setting up nginx web server and jenkins on an Azure Vm running Ubuntu as well
as integrating a Github Repository for your website

1. First we will login into the azure Vm and install docker (Refer Docker Documentation)
2. Create a direcory as images 
3. Go inside your directory and create a vim file as Dockerfile
4. Paste the below configuration file and save it.
   This will Uses the latest Ubuntu image as the base.
   Installs Nginx, OpenJDK 11 (for Jenkins), wget, and git.
   Adds the Jenkins repository, installs Jenkins, and sets it up.
   Exposes ports 80 (for Nginx) and 8080 (for Jenkins).
   Creates a directory for Nginx's HTML files.
   Copies your HTML files to the Nginx HTML directory.
   Starts Nginx and Jenkins services and keeps the container running.
  
//File is uploaded in this repo.
  

5. Save the file
6. Now Create a image by running the command
	docker build -t myimage .   //myimage being the name of your image
7. Check whether the image is created or not by running Docker images
8. Run the below command to start your image
	docker run -p 80:80 -p 8888:8080 myimage  //8888 will be the port where you are doing the port forwarding for port 8080
9. Check whether the image is running or not by using command docker ps

This is creating a docker image for the website which is kept in Github and hosting it in nginx web server

10. Now you can push this docker image to your public docker repository by using command 
	docker login, giving your creds and then docker push myimage

Thank You!
