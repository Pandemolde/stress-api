"""
This module monitors host

"""

import psutil


class Monitor:
    """
    This class contains a subset of features that monitors the host

    """

    def __init__(self):
        """
        Class Constructor

        """

    @property
    def cpus_avg(self) -> float:
        """
        This property returns the average of all CPU cores usage

        Returns:
            float: average of all cpus

        """

        return psutil.cpu_percent()

    @property
    def cpus_usage(self) -> list:
        """
        This property returns the average of all CPU cores usage

        Returns:
            list: list of floats that contains the usage of all cpus

        """

        return psutil.cpu_percent(percpu=psutil.cpu_count())

    @property
    def memory(self):
        """
        This property returns the current RAM memory used

        Returns:
            float: current RAM memory percent used

        """

        return psutil.virtual_memory().percent
