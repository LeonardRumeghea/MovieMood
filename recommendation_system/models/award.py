from datetime import datetime

from enums.genre import Genre


class Award:
    def __init__(self, id: int, title: str, date: datetime, category: Genre, description: str):
        self._id = id
        self._title = title
        self._date = date
        self._category = category
        self._description = description

    def set_title(self, title: str):
        self._title = title

    def get_title(self):
        return self._title

    def set_date(self, date: datetime):
        self._date = date

    def get_date(self):
        return self._date

    def set_category(self, category: Genre):
        self._category = category

    def get_category(self):
        return self._category

    def set_description(self, description: str):
        self._description = description

    def get_description(self):
        return self._description
