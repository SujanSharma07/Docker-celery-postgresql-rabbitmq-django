FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
COPY ./project /code
WORKDIR /code

RUN pip install -r requirements.txt
EXPOSE 8000
# CMD ["python","manage.py", "syncdb"]
# CMD ["python","manage.py","migrate"]
# CMD ["python","manage.py","runserver","0.0.0.0:8000"]

#ENTRYPOINT
#CMD ["manage.py","runserver"]
