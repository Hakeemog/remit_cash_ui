FROM node:latest

RUN mkdir -p /home/node/onboardingui/node_modules && chown -R node:node /home/node/onboardingui

WORKDIR /home/node/onboardingui

COPY package.json ./

USER node

RUN yarn install

COPY --chown=node:node . .

RUN yarn build

RUN mkdir -p /home/node/onboardingapi/uiapp

RUN cp -R /home/node/onboardingui/dist/* /home/node/onboardingapi/uiapp/.