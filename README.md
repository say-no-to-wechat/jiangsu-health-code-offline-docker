# Healthcode in docker

I saw this great project on the Internet, so I put it into docker. Now it allows one-click deploy! 

## Usage

For example, if you want to host the healthcode at `http://localhost:80`: 

```bash
docker run -tid --restart=always --log-opt max-size=10M -p 80:80 --name healthcode ghcr.io/say-no-to-wechat/jiangsu-health-code-offline-docker:master
```

Further more, you can set some **optional** environment variables to modify personal information and prefix URL. Like this: 

```
-e NAME=中华鲟 -e PHONE=15311112222 -e IDCARD="111******222" -e URL_PREFIX="https://my-reverse-proxy.com/my-path"
```

## Build

```bash
sudo docker build -f Dockerfile -t ghcr.io/say-no-to-wechat/jiangsu-health-code-offline-docker:master .
```

## FAQ

- I want to change the QR code from env

You have to modify api.php manually. I am lazy. 

You can also add this feature into patch-repo.sh and raise a PR. I appreciate it. 

- It is not working

Use F12 to see which request is failing, and test the request in cURL. 

Carefully see what's wrong in your failed URL. 80% issue is caused by wrong URL PREFIX. 

