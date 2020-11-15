"""
This is the main API module
"""

import flask

from flask_restful import Api
from monitor import Monitor


app = flask.Flask(__name__)
api = Api(app)

monitor = Monitor()


@app.route("/cpu", methods=["GET"])
def get_cpu():

    return str(monitor.cpus_avg), 200


@app.route("/mem", methods=["GET"])
def get_mem():

    return str(monitor.memory), 200


@app.route("/stress_cpu", methods=["GET"])
def stress_cpu():

    return "", 200


@app.route("/stress_mem", methods=["GET"])
def stress_mem():

    return "", 200


@app.route("/status", methods=["GET"])
def status_health():
    return f"""<xmp>
              Welcome to the Stress API
              status OK

              CPU avg: {monitor.cpus_avg}%
              Mem: {monitor.memory}%
              </xmp>""", 200


if __name__ == "__main__":
    app.run(debug=True)
