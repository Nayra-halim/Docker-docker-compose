#! /bin/bash
while true ; do
	echo -e "1.list all container\n2.list all running container\n3.list all images\n4.run container from image\n5.stop container\n6.remove container\n7.remove image\n8.Remove all unused image\n9.Remove all stopped container\n10.remove all containers\n11.Remove all images\n12.pull image\n13.exit:"
	read num
	if [[ $num == 1 ]]; then
		docker ps
		continue
	elif [[ $num == 2 ]]; then
		docker ps -a
	elif [[ $num == 3 ]]; then
		docker images
	elif [[ $num == 4 ]]; then
		read -p 'enter container name:' name
		read -p 'enter port:' port
		read -p 'enter image:' nimage
		read -p 'enter tag version:' tag
		docker run -d -p $port:80 --name $name $nimage:$tag
	elif [[ $num == 5 ]]; then
		read -p 'enter container name or id:' id
		docker stop $id
	elif [[ $num == 6 ]]; then
		read -p 'enter container name or id:' id2
                docker stop $id2
		docker rm $id2
	elif [[ $num == 7 ]]; then
		read -p 'enter image:' id3
		docker rmi -f $id3
	elif [[ $num == 8 ]]; then
		docker image prune -a
	elif [[ $num == 9 ]]; then
		docker container prune -f
	elif [[ $num == 10 ]]; then
		docker stop $(docker ps -aq)
		docker rm $(docker ps -aq)
	elif [[ $num == 11 ]]; then
		docker rmi -d $(docker images -a -q)
	elif [[ $num == 12 ]]; then
		read -p 'enter imag name' imname
		read -p 'enter tag version' ver
		docker image pull $imname:$ver
	
	else
		break
	fi
done

