Hey! 

Very first release of a project im working on. The idea is to make a program that will run before the main program in a docker container. The function of the program is to pull down the main program from a github repo, to allways make sure we get the freshest edition.

Right now it utlizes maven shader plugin, and the following dependencies;

* Jgit
* Slf4j
* Commons IO (Apache)
* Junit for testing

To run the program first clone it to your machine (you need maven - i dident use a wrapper for it). Then run "mvn clean install" inside of your folder where the src, target and pom file is located.

After the buld is done, your are getting a FAT JAR (also refered to as Uber JAR), that includes all the dependencies and the main program.

Then move down to the target folder by cd target

Run java -jar YOURJARNAME.jar and it should work 🥇

Remember to tell it where it should make a folder, and from what repo it should download!


**** TODO ****

Make docker file complete so it's acutally functioning.

Upload detailed UML over what the F is going on - sometimes it gets a bit frisky (still learning Maven and Docker)
