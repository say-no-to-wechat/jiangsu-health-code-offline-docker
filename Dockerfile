from ubuntu:22.04

run apt update -y && DEBIAN_FRONTEND="noninteractive" apt install -y unzip curl nodejs nginx php php-fpm

copy . /src
run cd /src && \
    ./download-latest-zip.sh && \
    unzip latest.zip && \
    mv /src/jiangsu-health-code-offline/repo /repo
run mv /src/nginx.conf /etc/nginx/nginx.conf
run echo '<html><script>window.location.replace("jkmIndex.html?token=1")</script>redirecting...</html>' > /repo/index.html

workdir /repo
# cmd /src/go.sh
cmd ["bash","-c","/src/patch-repo.sh && /src/go.sh"]
    




