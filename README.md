Hey! 

Very first release of a project im working on. The idea is to make a program that will run before the main program in a docker container. The function of the program is to pull down the main program from a github repo, to allways make sure we get the freshest edition.

Right now it utlizes maven shader plugin, and the following dependencies;

* Jgit
* Slf4j
* Commons IO (Apache)
* Junit for testing

You can acsess it via docker by building a image with:

docker build -t jap (jap for java auto pull)

Then create a container with "docker run --name jaap jap" - this should run the docker auto puller and the program (only docker auto puller is currently working)

OR you can run "docker run -it --name jaap jap /bin/bash" 

Now you have full acsess to the Ubuntu system, and can test the two pulled down programs as you see fit. Use this command to run your jars "java -jar YOURJARNAME.jar" 🥇

Remember to edit paths and folder names in the app.java, and from what repo it should download!


**** TODO ****

Make .sh file to run multiple commands when the container is started. Right now we only build the program via maven, and runs it to download target repo. We need to make it so we acutally also builds the pulled down repo into a fat jar, and runs it.

More UML :)
