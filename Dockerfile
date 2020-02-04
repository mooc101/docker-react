FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# CMD [ "npm", "run", "build" ]
RUN npm run build


# /app/build
# --- PREVIOUS BLOCK COMPLETE ---
# No Need to specify default command for nginx automatcially started
FROM nginx

# For AWS Elastic Beanstalk(For local dev we need to do port mapping -p 8080:80)
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html







