
"""
Produces load on all available CPU cores and memory
"""

import logging
import multiprocessing
import time
import utils


class Stress:
    """
    This class is designed to control and stress all host CPUs with load
    """

    __VERY_BIG_NUMBER = 512000000

    def __init__(self):
        """
        Class constructor

        """

        logging.basicConfig()
        self._logger = logging.getLogger(__name__)
        self._logger.setLevel(logging.INFO)

        self.cpu_cores = multiprocessing.cpu_count()

        self.interval = 60
        self._logger.info('Using %d cores\n' % self.cpu_cores)

    def _stress_function(self, x):
        """
        This function generates CPU load during a concrete time interval (in seconds)
        Args:
            x: the function argument to map

        """
        end_time = time.time() + self.interval

        while time.time() < end_time:
            x*x

    @utils.run_in_thread
    def stress_cpu_cores(self, interval: int = None):
        """
        This function generates load for every CPU core during the desired seconds

        """

        if interval:
            self.interval = interval
        pool = multiprocessing.Pool(self.cpu_cores)
        self._logger.info("Starting stress on all CPU cores...")
        pool.map(self._stress_function, range(self.cpu_cores))
        self._logger.info("Process finished!!")

    @utils.run_in_thread
    def stress_memory(self):
        """
        This function generates load for every CPU core during the desired seconds

        """

        self._logger.info("Starting stress on memory...")
        bytearray(self.__VERY_BIG_NUMBER)
        self._logger.info("Process finished!!")
