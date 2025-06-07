# rag-sample-tf

## terraform plan
```
$ docker compose down
$ docker compose build --no-cache && docker compose up -d && docker compose exec terraform sh
# cd environments/test && terraform init
# terraform plan -var="aws_profile=AdministratorAccess-767398075406"
```

## terraform apply
```
$ docker compose down
$ docker compose build --no-cache && docker compose up -d && docker compose exec terraform sh
# cd environments/test && terraform init
# terraform apply -var="aws_profile=AdministratorAccess-767398075406"
```

## terraform apply
```
$ docker compose down
$ docker compose build --no-cache && docker compose up -d && docker compose exec terraform sh
# cd environments/test && terraform init
# terraform destroy -var="aws_profile=AdministratorAccess-767398075406"
```