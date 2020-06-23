helm install --name sh-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgdgsf%44sd --set mysqlDatabase=monitoring_app --set nodeSelector.node-type=app

helm install --name sh-master-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgdjkgsf%44sd --set mysqlDatabase=monitoring_master --set nodeSelector.node-type=app

helm install --name crawling-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=crawler --set mysqlPassword=HgHjhsdkgsf%44sd --set mysqlDatabase=monitoring_crawl --set nodeSelector.node-type=app

helm install --name fb-api-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=fb-api --set mysqlPassword=HgHjhshsdkgsf%44sd --set mysqlDatabase=fb_api --set nodeSelector.node-type=app

helm install --name job-queue-redis --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name identity-redis --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name sh-memcached  stable/memcached --namespace sl-production --set replicaCount=2

##### Beging  set up database for staging  
helm install --name sh-mysql-staging --namespace sl-staging ./mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgujdf%44sd --set mysqlDatabase=monitoring_app --set nodeSelector.node-type=app

helm install --name sh-master-mysql-staging --namespace sl-staging ./mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=lskdj%44sd --set mysqlDatabase=monitoring_master --set nodeSelector.node-type=app

helm install --name crawling-mysql-staging --namespace sl-staging ./mysql --set imageTag=5.7.19 --set mysqlUser=crawler --set mysqlPassword=kejudsY%44sd --set mysqlDatabase=monitoring_crawl --set nodeSelector.node-type=app

helm install --name fb-api-mysql-staging --namespace sl-staging ./mysql --set imageTag=5.7.19 --set mysqlUser=fb-api --set mysqlPassword=JshdJds%44sd --set mysqlDatabase=fb_api --set nodeSelector.node-type=app

helm install --name job-queue-redis-staging --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name identity-redis-staging --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name topicposts-redis-staging --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app
helm install --name topicoldposts-redis-staging --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name sh-memcached-staging  stable/memcached --namespace sl-staging --set replicaCount=1

helm install --name insta-token-redis-testing --namespace sl-testing stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

##### End set up database for staging  




helm install --name sh-mysql-testing --namespace sl-testing stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgujdf%44sd --set mysqlDatabase=monitoring_app --set nodeSelector.node-type=app

helm upgrade sh-master-mysql-testing --namespace sl-testing ./stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=lskdj%44sd --set mysqlDatabase=monitoring_master --set nodeSelector.node-type=app

helm upgrade crawling-mysql-testing --namespace sl-testing ./stable/mysql --set imageTag=5.7.19 --set mysqlUser=crawler --set mysqlPassword=kejudsY%44sd --set mysqlDatabase=monitoring_crawl --set nodeSelector.node-type=app

helm upgrade fb-api-mysql-testing --namespace sl-testing ./stable/mysql --set imageTag=5.7.19 --set mysqlUser=fb-api --set mysqlPassword=JshdJds%44sd --set mysqlDatabase=fb_api --set nodeSelector.node-type=app

helm install --name job-queue-redis-testing --namespace sl-testing stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name identity-redis-testing --namespace sl-testing stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name topicposts-redis-testing --namespace sl-testing stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name sh-memcached-testing  stable/memcached --namespace sl-testing --set replicaCount=1

kubectl get secret local-registry --namespace=sl-production --export -o yaml | kubectl apply --namespace=sl-staging -f -

helm install --name sentry stable/sentry -namespace monitoring --set nodeSelector.node-type=app,web.nodeSelector.node-type=app,cron.nodeSelector.node-type=app,worker.nodeSelector.node-type=app,metrics.nodeSelector.node-type=app

helm install --name docker-registry --namespace default stable/docker-registry --set tlsSecretName=docker-registry-cert --set persistence.enabled=true

helm install --name prometheus --namespace monitoring ./stable/prometheus --set nodeSelector.node-type=app,server.nodeSelector.node-type=app,alertmanager.nodeSelector.node-type=app

helm install --name jenkins_test stable/jenkins --set master.nodeSelector.node-type=app,nodeSelector.node-type=app

helm install --name grafana ./stable/grafana --set persistence.enabled=true,nodeSelector.node-type=app

helm install --name kong --namespace kong stable/kong --set postgresql.enabled=true,ingress.enabled=false,postgresql.persistence.storageClass=rook-ceph-block

helm install --name rabbitmq --namespace sl-production stable/rabbitmq --set rabbitmq.password=eIX6YZI2RZ,rabbitmq.erlangCookie=k6fG0FHQsxLbAgYo0POm70aC92hKxCTK,persistence.enabled=true,persistence.size=100Gi,service.type=NodePort
helm install --name rabbitmq-testing --namespace sl-testing stable/rabbitmq --set rabbitmq.password=S5gQ5qZV2j,persistence.enabled=true,persistence.size=10Gi
helm install --name rabbitmq-staging --namespace sl-staging stable/rabbitmq --set persistence.enabled=true,persistence.size=10Gi

