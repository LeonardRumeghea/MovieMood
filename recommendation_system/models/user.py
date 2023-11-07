from abc import ABC, abstractmethod


class Person(ABC):
    def __init__(self, id: int, user_name: str, password: str, email: str):
        self.__id = id
        self.__user_name = user_name
        self.__password = password
        self.__email = email

    def set_user_name(self, user_name: str):
        self.__user_name = user_name

    def get_user_name(self):
        return self.__user_name

    def set_password(self, password: str):
        self.__password = password

    def get_password(self):
        return self.__password

    def set_email(self, email: str):
        self.__email = email

    def get_email(self):
        return self.__email