FROM node:alpine

user node

run mkdir /home/node/app
workdir '/home/node/app'
copy package.json .
run npm install

COPY --chown=node:node ./ ./

run npm run build

from nginx
copy --from=0 /home/node/app/build /usr/share/nginx/html
