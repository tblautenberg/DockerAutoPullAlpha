Hey! 

Very first release of a project im working on. The idea is to make a program that will run before the main program in a docker container. The function of the program is to pull down the main program from a github repo, to allways make sure we get the freshest edition.

Right now it utlizes maven shader plugin, and the following dependencies;

* Jgit
* Slf4j
* Commons IO (Apache)
* Junit for testing

You can acsess it via docker by building a image with:

docker build -t jap (jap for java auto pull) --> docker run -it --name jaap jap

This will build the JavaDockerAutoPull, inside of the container, and run a bashscript to run it, and build/run the JAR from target-repo.

Remember to edit paths and folder names in the app.java, and from what repo it should download! Currently creating a folder /app/target-repo inside the container. Target project is https://github.com/tblautenberg/DockerAutoPullTarget

Small diagram of how it works.



![Untitled Diagram drawio](https://github.com/tblautenberg/DockerAutoPullAlpha/assets/109878505/4614a6a7-178e-4f31-b7a6-9357837ebb36)


**** TODO ****

Add more text to what happens - maybe also colors and emojies. Also clean the bashScript.sh file abit - needs some love atm.

More UML :)
