# pull down the pode image
FROM badgerati/pode.web:latest

# or use the following for GitHub
# FROM docker.pkg.github.com/badgerati/pode.web/pode.web:latest

# copy over the local files to the container
COPY . /usr/src/app/

# expose the port
EXPOSE 8090

# run the server
CMD [ "pwsh", "-c", "cd /usr/src/app; ./full.ps1" ]