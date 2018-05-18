# This Dockerfile allows you to build a Flogo web docker image which comes
# preinstalled with additional activities. To add activities update the
# imports.go file and for each activity you want to have installed add the
# go get path (which you also use for flogo install). So if the URL you would
# paste is http://github.com/retgits/flogo-components/activity/trellocard
# simply add _ "github.com/retgits/flogo-components/activity/trellocard" to the
# imports.go
#
# Build a new image
# docker build . -t retgits/flogo
#
# Run the image:
# docker run -d -p 3303:3303 --name=flogoweb retgits/flogo:latest eula-accept
#
FROM flogo/flogo-docker:latest
LABEL maintainer "retgits"

# Add the imports.go which contains all activities you want to pre-install and
# run `flogo ensure` to make sure the activities are installed
ADD imports.go /tmp/flogo-web/build/server/local/engines/flogo-web/src/flogo-web/imports.go
RUN cd /tmp/flogo-web/build/server/local/engines/flogo-web && flogo ensure