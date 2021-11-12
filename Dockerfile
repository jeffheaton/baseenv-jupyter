FROM nvidia/cuda:11.4.2-cudnn8-runtime-ubuntu20.04
WORKDIR /root/notebooks
COPY tensorflow.yml /root/tensorflow.yml
COPY startup.sh /root/startup.sh

RUN \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install wget && \
	cd && \
	wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh && \
	bash ~/Miniconda3-py39_4.10.3-Linux-x86_64.sh -b -p $HOME/miniconda && \
	rm ~/Miniconda3-py39_4.10.3-Linux-x86_64.sh && \
	$HOME/miniconda/bin/conda init bash && \
#	$HOME/miniconda/bin/conda install -y jupyter && \
	$HOME/miniconda/bin/conda install -c conda-forge jupyterlab && \
	$HOME/miniconda/bin/conda env create -v -f /root/tensorflow.yml && \
	rm /root/tensorflow.yml && \
	chmod +x /root/startup.sh
RUN $HOME/miniconda/envs/tensorflow/bin/python -m ipykernel install --user --name tensorflow --display-name "Python 3.9 (tensorflow)"

CMD ["bash", "-c", "/root/startup.sh"]

