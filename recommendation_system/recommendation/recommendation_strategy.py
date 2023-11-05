from abc import ABC, abstractmethod


class RecommendationStrategy(ABC):
    @abstractmethod
    def create_recommendation(self):
        pass
