helm install --name sh-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgdgsf%44sd --set mysqlDatabase=monitoring_app --set nodeSelector.node-type=app

helm install --name sh-master-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=socialheat --set mysqlPassword=Hgdjkgsf%44sd --set mysqlDatabase=monitoring_master --set nodeSelector.node-type=app

helm install --name crawling-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=crawler --set mysqlPassword=HgHjhsdkgsf%44sd --set mysqlDatabase=monitoring_crawl --set nodeSelector.node-type=app

helm install --name fb-api-mysql --namespace sl-staging stable/mysql --set imageTag=5.7.19 --set mysqlUser=fb-api --set mysqlPassword=HgHjhshsdkgsf%44sd --set mysqlDatabase=fb_api --set nodeSelector.node-type=app

helm install --name job-queue-redis --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app

helm install --name identity-redis --namespace sl-staging stable/redis --set cluster.enabled=false,persistence.enabled=true,nodeSelector.node-type=app