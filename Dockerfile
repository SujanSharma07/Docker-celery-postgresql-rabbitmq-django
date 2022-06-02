FROM ubuntu:18.04
RUN mkdir -p /code
WORKDIR /code
 
# Base requirements
RUN apt update
RUN apt install -y git

# Development Tools
RUN apt install -y build-essential gcc python-dev python3-dev libjpeg8 libjpeg8-dev \
    && apt install -y zlib1g-dev libxml2 libpq-dev libcairo2 libpango1.0-dev libgtk-3-dev

# PIP
RUN apt install -y python3-pip

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


COPY ./project /code


# CMD ["python","manage.py", "syncdb"]
# CMD ["python","manage.py","migrate"]
# CMD ["python","manage.py","runserver","0.0.0.0:8000"]

#ENTRYPOINT
#CMD ["manage.py","runserver"]
