# flask-app-with-docker
flask app with docker

## build docker image
```
docker build -t flask-app-with-docker .
```

## run  docker container
```
docker run --env-file envvars.txt -p 5000:5000 flask-app-with-docker
```
environment variables are defined in envvars.txt as below
```
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=your_dbname
DB_HOST=your_host
```
