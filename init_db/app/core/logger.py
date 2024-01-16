import logging

logging.basicConfig(level=logging.INFO)

# Logger singleton
class Logger:
    _logger = None

    @staticmethod
    def get():
        if Logger._logger is None:
            Logger._logger = logging.getLogger(__name__)
        return Logger._logger