FROM python:3
WORKDIR /usr/src/app
COPY ./ stress-api/
WORKDIR /usr/src/app/stress-api
RUN python3 -m pip install -r requirements.txt

CMD ["python", "./api/run.py"]
