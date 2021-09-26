FROM base
# O objetivo deste arquivo é apenas inicializar o spark. 
# Precisamos criar dois arquivos para inicializar o spark porque o cmd de cada arquivo será diferente
# Vamos criar nossa imagem a partir da imagem base que fizemos

EXPOSE 8080 7077
# Por segurança, não conseguimos acessar aplicações do docker. Assim, precisamos expor as portas. Vamos expor duas portas aqui

CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out 
# Comando para inicializar o spark
# E salvar logs dele

# docker network create spark-cluster
# docker run --network spark-cluster --network-alias spark-master -d -p 8080:8080 -p 7077:7077 spark-master