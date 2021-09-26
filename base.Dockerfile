FROM openjdk:8-jre-slim
# Preciso do Java 8 instalado na máquina

ARG spark_version=3.1.2
ARG hadoop_version=3.2
# Definem variáveis de versão do que será baixado

RUN mkdir -p /opt/workspace
# Vai existir em todas as máquinas com o mesmo diretório. Este diretório será o volume (arquivo da minha máquina automaticamente copiado para CNTR)

RUN apt update -y && apt install -y curl
# apt - gerenciador de pacote do linux - precisa dar um update neste gerenciador de pacotes
# && comando relacionado (ambos são RUN). Seria idêntico a rodar duas linhas com RUN

RUN curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz
# curl vai baixar um arquivo - spark - para dentro da nossa máquina. Isso aqui vai demorar um pouco
# Ele vai usar as variáveis que foram definidas acima
# Depois do "-o" estamos renomeando o arquivo

RUN tar -xf spark.tgz
# Descompactar arquivo baixado anteriormente

RUN mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/
# Mover arquivo para diretório usr/bin - todo linux tem e normalmente é usado para instalar arquivo

RUN mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs
# Vai permitir ver o que acontece dentro do container

RUN rm spark.tgz
# Vamos deletar o arquivo para diminuir a memória da imagem

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master 
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3
# Variáveis de ambiente

# Não vamos dar docker-run neste dockerfile. Este servirá como base dos outros docker-files

WORKDIR ${SPARK_HOME} 
# em qual pasta comandos serão executados
CMD ["bash"] 
# O que vai ser executado quando der o docker-run. Bash abre o próprio terminal do Linux.

# Para rodar no terminal, usar: docker build -f base.Dockerfile -t base .
