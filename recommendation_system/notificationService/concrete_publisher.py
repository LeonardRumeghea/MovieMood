from publisher import Publisher
from observer import Observer

class Concrete_Publisher(Publisher):
    def __init__(self):
        super().__init__()
        _state = None
        _observers = []


    def subscribe(self, observer: Observer) -> None:
        print("Subject: Attached an observer.")
        self._observers.append(observer)


    def unsubscribe(self, observer: Observer) -> None:
        self._observers.remove(observer)


    def notify(self) -> None:
        for observer in self._observers:
            observer.update(self)


    def some_business_logic(self) -> None:
        # some logic
        self.notify()