from abc import ABC, abstractmethod
import datetime


class Person(ABC):
    def __init__(self, id: int, first_name: str, last_name: str, date_of_birth: datetime, biography: str, nationality: str):
        self.__id = id
        self.__first_name = first_name
        self.__last_name = last_name
        self.__date_of_birth = date_of_birth
        self.__biography = biography
        self.__nationality = nationality

    def set_first_name(self, first_name: str):
        self.__first_name = first_name

    def get_first_name(self):
        return self.__first_name

    def set_last_name(self, last_name: str):
        self.__last_name = last_name

    def get_last_name(self):
        return self.__last_name

    def set_date_of_birth(self, date_of_birth: datetime):
        self.__date_of_birth = date_of_birth

    def get_date_of_birth(self):
        return self.__date_of_birth

    def set_biography(self, biography: str):
        self.__biography = biography

    def get_biography(self):
        return self.__biography

    def set_nationality(self, nationality: str):
        self.__nationality = nationality

    def get_nationality(self):
        return self.__nationality
