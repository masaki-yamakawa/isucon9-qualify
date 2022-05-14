# isucon9-qualify for kubernetes

## 前準備

```shell-session
# ISUCARIアプリケーションDockerイメージビルド
$ cd webapp/${devlang}
$ docker-compose build

# Dockerイメージビルド結果確認
$ docker images
```

## minikube での起動方法

```shell-session
# minikube起動/リポジトリのディレクトリをマウント
$ cd ${reposRootDirFullPath}
$ minikube start --mount --mount-string ${PWD}:/repository

# docker endpointをminikubeに変更
$ eval $(minikube docker-env)

# アプリケーション起動
$ cd webapp/kubernetes
$ kubectl apply -f app-go-service.yaml,db-service.yaml,app-go-deployment.yaml,db-deployment.yaml,isucon9-qualify_default-networkpolicy.yaml

# 別ターミナルでminikube tunnelを実行
$ minikube tunnel

# または別ターミナルでポートフォワードを実行
$ kubectl port-forward deployment/app-go 8000
```