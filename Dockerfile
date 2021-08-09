FROM continuumio/miniconda3:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

#wget for frontend
RUN apt-get update && apt-get upgrade -y && apt-get install wget -y

#frontend
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs && apt-get install -y npm

RUN mkdir -p /backend
#frontend
RUN mkdir -p /frontend
RUN mkdir -p /frontend_tmp
RUN mkdir -p /static-files
RUN mkdir -p /scripts

COPY ./backend /backend
RUN /opt/conda/bin/conda env create -f /backend/requirements.yml
ENV PATH /opt/conda/envs/luna_backend/bin:$PATH

RUN echo "source activate luna_backend" >~/.bashrc

COPY ./scripts /scripts
RUN chmod +x ./scripts*

# frontend
WORKDIR /frontend_tmp
COPY ./frontend/package.json /frontend_tmp/
RUN npm install
COPY ./frontend /frontend_tmp
RUN npm run build

WORKDIR /backend


