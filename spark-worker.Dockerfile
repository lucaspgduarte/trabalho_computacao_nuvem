FROM base

EXPOSE 8081:8081
# Só vamos expor esta porta 

CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out

# Vamos usar as variáveis de ambiente que dizem qual o host e qual a porta
# Master precisa conhecer todos os workers para direcionar os trabalhos
# Todo log gerado pelo programa será salvo em um arquivo para ver na interface web

#docker build -f spark-Worker.Dockerfile -t spark-worker .

# docker run --network spark-cluster --network-alias spark-worker-1 
# -p 8081:8081 -p 7077:7077 spark-worker
