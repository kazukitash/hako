# hako

自分用の Docker 環境。環境を更新したら image を作り直して DockerHub にアップロードする。

```bash
docker login
docker build --no-cache -t kazukitash/hako:latest .
docker image push kazukitash/hako:latest
```
