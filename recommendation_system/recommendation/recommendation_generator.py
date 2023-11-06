from abc import ABC, abstractmethod


class RecommendationGenerator(ABC):
    @abstractmethod
    def get_final_recommendation_list(self):
        pass
    