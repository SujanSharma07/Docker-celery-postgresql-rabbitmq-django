FROM ubuntu:18.04
USER root
RUN mkdir -p /code
WORKDIR /code
 
# Base requirements
RUN apt update
RUN apt install -y git

# Development Tools
RUN apt install -y build-essential
RUN apt install -y libssl-dev
RUN apt install -y libffi-dev
RUN apt install -y python-dev
RUN apt install -y libpq-dev
RUN apt install -y libjpeg8 libjpeg62-dev
RUN apt install -y libfreetype6 libfreetype6-dev

# PIP
RUN apt install -y python3-pip

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN ipython profile create
RUN sed -i 's/#c.Completer.use_jedi = True/c.Completer.use_jedi = False/g' /root/.ipython/profile_default/ipython_config.py


COPY ./project /code


# CMD ["python","manage.py", "syncdb"]
# CMD ["python","manage.py","migrate"]
# CMD ["python","manage.py","runserver","0.0.0.0:8000"]

#ENTRYPOINT
#CMD ["manage.py","runserver"]
