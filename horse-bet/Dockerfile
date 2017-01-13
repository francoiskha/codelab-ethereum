FROM zenika/alpine-node
RUN npm i -g truffle \
	&& npm i -g ethereumjs-testrpc \
	&& npm i -g gulp-cli \
	&& npm i -g gulp
COPY ./package.json /usr/src
RUN npm -D install
EXPOSE 8545
EXPOSE 9000
EXPOSE 35729
CMD truffle version