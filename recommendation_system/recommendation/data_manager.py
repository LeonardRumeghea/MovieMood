import torch

from repository.review_repository import ReviewRepository


class DataManager:
    def __init__(self):
        self.review_repo = ReviewRepository()

    def create_dataset(self):
        #pass
        #return [[1, "Title1", [Genre.adventure.value, Genre.animation.value]], [2, "Title2", [Genre.adventure.value, Genre.fantasy.value]]]
        dataset = []
        input = torch.zeros(20)
        input[0] = 1
        input[1] = 1
        dataset.append((input, 6))

        input = torch.zeros(20)
        input[3] = 1
        input[1] = 1
        dataset.append((input, 3))
        #[([Genre.adventure.value, Genre.animation.value], 6), ([Genre.adventure.value, Genre.fantasy.value], 3)]
        return dataset
