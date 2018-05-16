# usage: docker run -d -p 8889:80 --name=nginx retgits/nginx
# build: docker build . -t retgits/nginx
# Based on https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container
FROM nginx:alpine

ADD crontab.txt /crontab.txt
ADD update-flogo.sh /update-flogo.sh
COPY entry.sh /entry.sh
RUN chmod 755 /update-flogo.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]
