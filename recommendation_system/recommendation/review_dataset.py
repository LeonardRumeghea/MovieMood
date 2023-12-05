from torch.utils.data import Dataset
from recommendation.data_manager import DataManager
__all__ = ['ReviewDataset']

from repository.genre_repository import GenreRepository

from repository.review_repository import ReviewRepository


# Custom dataset class
class ReviewDataset(Dataset):
    def __init__(self, review_repo: ReviewRepository, genre_repo: GenreRepository, user_id: int):
        data_manager = DataManager(review_repo, genre_repo, user_id)
        self.dataset = data_manager.create_dataset()

    def __len__(self):
        return len(self.dataset)

    def __getitem__(self, idx):
        input_data = self.dataset[idx][0]
        output_data = self.dataset[idx][1]
        return input_data, output_data
