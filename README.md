<div align=center style="text-align: center;">
<h1>Stay in Tarkov - Dockerized</h1>
<h2>Quickly set up your personal Escape from Tarkov server in just 5 minutes..</h2>
<h2>The Linux Container, that builds the server too</h2>
<h4>Why? Because everyone should be able to build, and not rely on unknown builds from unknown sources.</h3>

Platform independent.
  
(for 3.7.6 - see the example)
</div>

---

## How to use this Repo?

1. Install [DOCKER](https://docs.docker.com/get-docker/)
2. `git clone https://github.com/stayintarkov/SIT.Docker`
3. `cd SIT.Docker`
4. Build the server 
	
   Example for SIT 1.6.0:
   ```bash
   docker build \
      --build-arg SIT=36d7fd71cacb38868f74dfad41beafe6e8dac6dc \
      --build-arg SPT=4b8b62ae8344cbc2a42135ca9225089809832873 \
      --build-arg NODE=20.10.0
      --label SITCoop \
      -t sitcoop .
   ```
   Same, but in one line:
   ```bash
   docker build --build-arg SIT=36d7fd71cacb38868f74dfad41beafe6e8dac6dc --build-arg SPT=4b8b62ae8344cbc2a42135ca9225089809832873 --build-arg NODE=20.10.0 --label SITCoop -t sitcoop .
   ```
   
   
   > Windows dont handle the \\, use the oneliner!
5. Run the image once:
   ```bash
   docker run --pull=never -v $PWD/server:/opt/server -p 6969:6969 -p 6970:6970 -it --name sitcoop sitcoop
   ```
   - ⚠️ If you don't set the -v (volume), you won't be able to do a required step!
6. Go to your `./server` directory, delete `delete_me`, and optionally install additional mods, make config changes, etc.
    > Using `-p6969:6969`, you expose the port to `0.0.0.0` (meaning: open for LAN, localhost, VPN address, etc).
    > 
    > You can specify `-p 192.168.12.34:6969:6969` for each port if you don't want the ports to listen on all interfaces. 
   
7. Start your server (and enable auto restart):
 ```bash
docker start sitcoop
docker update --restart unless-stopped sitcoop
```
8. ... wait a few seconds, then you can connect to `http://YOUR_IP:6969`

## Bugs and Issues
Let me know if there are any. Feel free to submit a PR.
