from observer import Observer
from publisher import Publisher

class Concrete_Observer(Observer):
    def __init__(self):
        super().__init__()

    def update(self, publisher: Publisher) -> None:
        # Reacted to the event
        pass