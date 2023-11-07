from abc import abstractmethod
from publisher import Publisher

class Observer():
    def __init__(self):
        self._publisher = Publisher()

    @abstractmethod
    def update(self, publisher: Publisher) -> None:
        pass