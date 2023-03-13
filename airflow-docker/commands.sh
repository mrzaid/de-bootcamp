docker --version
docker-compose --version


curl -LfO "https://airflow.apache.org/docs/apache-airflow/2.5.1/docker-compose.yaml"
LocalExecutor
delete celery result/broker and redis def /dependency
celery worker/flower

mkdir -p ./dags ./logs ./plugins
 mkdir  .\dags .\logs .\plugins   
echo -e "AIRFLOW_UID=$(id -u)" > .env linux necessary

docker compose up airflow-init
