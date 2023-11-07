from recommendation_strategy import RecommendationStrategy


class RecommendationService:
    def __init__(self, strategy: RecommendationStrategy):
        self._strategy = strategy

    def process_request(self):
        self._strategy.create_recommendation()
