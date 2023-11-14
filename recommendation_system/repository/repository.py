from abc import ABC, abstractmethod
from typing import TypeVar, Generic

T = TypeVar('T')


class Repository(ABC, Generic[T]):

    def create(self, entity: T) -> None:
        pass

    def find_by_id(self, id: int) -> list:
        pass

    def find_all(self) -> list:
        pass

    def update(self, entity: T) -> None:
        pass

    def delete(self, entity: T) -> None:
        pass




