"""
This is the main API module
"""

from flask import request, Flask

from monitor import Monitor
from stress import Stress


app = Flask(__name__)

monitor = Monitor()
stress = Stress()


@app.route("/cpu", methods=["GET"])
def get_cpu():
    """ Route for '/cpu' """

    return str(monitor.cpus_avg), 200


@app.route("/memory", methods=["GET"])
def get_mem():
    """ Route for '/memory' """

    return str(monitor.memory), 200


@app.route("/stress_cpu", methods=["GET"])
def stress_cpu():
    """ Route for '/stress_cpu' """

    interval = request.args.get("interval")
    stress.stress_cpu_cores(interval=int(interval))

    return"Starting stress on all CPU cores...", 200


@app.route("/stress_memory", methods=["GET"])
def stress_mem():
    """ Route for '/stress_memory' """

    stress.stress_memory()

    return "Starting stress on memory...", 200


@app.route("/status", methods=["GET"])
def status_health():
    """ Route for '/status' """

    return f"""<xmp>
              Welcome to the Stress API
              status OK

              CPU avg: {monitor.cpus_avg}%
              Mem: {monitor.memory}%
              </xmp>""", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
