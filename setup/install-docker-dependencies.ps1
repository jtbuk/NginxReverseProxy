Push-Location .\docker

docker compose rm -f
docker compose pull
docker compose up --build -d

Pop-Location