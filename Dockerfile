FROM node:20-alpine

# Java para Firebase Emulator
RUN apk add --no-cache openjdk17

# Instala CLI necesarias
RUN npm install -g firebase-tools vite

WORKDIR /app
COPY . .

RUN yarn install

EXPOSE 4000 8081 5173

# Corre emulador y Vite (React dev server)
CMD ["sh", "-c", "firebase emulators:start --project demo & yarn start"]
