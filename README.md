# baseenv-jupyter
Basic Docker environment for Jupyter and Python

sudo docker run -it --rm --gpus all -p 8888:8888 -v /home/jeff/projects/t81_558_deep_learning/:/root/mnt --env-file ./env.list baseenv


