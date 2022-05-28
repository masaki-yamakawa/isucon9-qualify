# isucon9-qualify for kubernetes

## minikube での起動方法（convert版）

```shell-session
# minikube起動/リポジトリのディレクトリをマウント
$ cd ${reposRootDirFullPath}
$ minikube start --mount --mount-string ${PWD}:/repository

# docker endpointをminikubeに変更
$ eval $(minikube docker-env)

# ISUCARIアプリケーションDockerイメージビルド
$ cd webapp/${devlang}
$ docker-compose build

# Dockerイメージビルド結果確認
$ docker images

# アプリケーション起動
$ cd webapp/kubernetes/convert
$ kubectl apply -f app-go-service.yaml,db-service.yaml,app-go-deployment.yaml,db-deployment.yaml,isucon9-qualify_default-networkpolicy.yaml

# 別ターミナルでminikube tunnelを実行
$ minikube tunnel

# または別ターミナルでポートフォワードを実行
$ kubectl port-forward deployment/app-go 8000
```


## minikube での起動方法（basic版）

```shell-session
# minikube起動/リポジトリのディレクトリをマウント
$ cd ${reposRootDirFullPath}
$ minikube start

# docker endpointをminikubeに変更
$ eval $(minikube docker-env)

# ISUCARIアプリケーションDockerイメージビルド
$ cd webapp/${devlang}
$ docker-compose build

# Dockerイメージビルド結果確認
$ docker images

# ConfigMap作成
$ cd webapp/kubernetes
$ kubectl create configmap sql --from-file=sql
$ kubectl get configmap sql -o yaml

# PersistentVolume作成
$ cd webapp/kubernetes/basic
$ kubectl apply -f isucon2-pv-claim.yaml
$ kubectl get pvc

# アプリケーション起動
$ cd webapp/kubernetes/basic
$ kubectl apply -f app-go-service.yaml,db-service.yaml,app-go-deployment.yaml,db-deployment.yaml

# 初期イメージ配置ジョブ実行
$ cd webapp/kubernetes/basic
$ kubectl apply -f init-images-job.yaml

# 別ターミナルでminikube tunnelを実行
$ minikube tunnel

# または別ターミナルでポートフォワードを実行
$ kubectl port-forward deployment/app-go 8000
```


## minikube/kubectl Tips

いろいろ削除

```shell-session
minikube delete --all --purge
```
