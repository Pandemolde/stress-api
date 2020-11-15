import multiprocessing


def run_in_thread(func):
    """
    This function is intended to be used as a decorator, in order to make other functions to be run in a thread
    Args:
        func: function to run in a thread

    """
    def run(*k, **kw):
        thread = multiprocessing.Process(target=func, args=k, kwargs=kw)
        thread.start()

        return thread

    return run
