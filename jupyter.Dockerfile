FROM base

ARG spark_version=3.1.2
ARG jupyter_version=3.1.9

RUN apt install -y python3 python3-pip

RUN pip3 install pyspark==${spark_version} jupyterlab==${jupyter_version} wget

EXPOSE 8888

WORKDIR /opt/workspace

CMD jupyter lab --ip 0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=