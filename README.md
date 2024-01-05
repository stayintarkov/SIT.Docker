<div align=center style="text-align: center;">
<h1> Stay in Tarkov - Dockerized</h1>
<h2>Quickly set up your personal Escape from Tarkov server in just 5 minutes..</h2>
<h2>The Linux Container, that builds the server too</h2>
<h4>Why? Because everyone should be able to build, and not rely on unknown builds from unknown sources.</h3>

Platform independent.
  
(for 3.7.6 - see the example)
</div>

---

## How to use this Repo?

* Install [DOCKER](https://docs.docker.com/get-docker/)
* `git clone https://github.com/bullet4prz/SIT.Server-Linux`
* `cd SIT.Server-Linux`
* Build the server:
  * `docker build --build-arg SPT=db70e8e4bc480f551b7c71b886e4a72c0e99b469 --label SITCoop -t sitcoop . `
  * `docker run --pull=never -v $PWD/server:/opt/server -p 6969:6969 -p 6970:6970 -it --name sitcoop sitcoop`
    *  *PLEASE NOTE, if you dont set the -v (volume), you will not able to do a required step!*
* go to your `./server` directory, delete `delete_me` and optional: + install additional mods, do the changes you want in the configs, etc
  * PLEASE NOTE, Docker does the EXPOSE, port 6969 and port 6970 will be available on 0.0.0.0 (meaning ALL addresses on your machine -- the port will be open for your lan, your localhost and vpn address, etc)
    * you can specify `-p 192.168.12.34:6969:6969` for each port, if you dont want the ports listen on all interfaces
  * `docker start sitcoop`

## Bugs and Issues
Let me know if there is any.. feel free to do a PR.
