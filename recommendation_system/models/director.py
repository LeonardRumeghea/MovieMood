from datetime import datetime

from models.person import Person


class Director(Person):
    def __init__(self, id: int, first_name: str, last_name: str, date_of_birth: datetime, biography: str,
                 nationality: str, filmography: list, style: list):
        super().__init__(id, first_name, last_name, date_of_birth, biography, nationality)
        self._filmography = filmography
        self._style = style

    def set_filmography(self, filmography: list):
        self._filmography = filmography

    def get_filmography(self):
        return self._filmography

    def set_style(self, style: list):
        self._style = style

    def get_style(self):
        return self._style

