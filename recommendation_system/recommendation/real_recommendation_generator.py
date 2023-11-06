from recommendation.recommendation_generator import RecommendationGenerator


class RealRecommendationGenerator(RecommendationGenerator):
    def __int__(self, list_of_services):
        self._list_of_services = list_of_services
        self._final_recommendation_list = []
        self._recommendation_lists = []

    def generate_recommendations(self):
        pass

    def chose_or_combine_lists(self):
        pass

    def validate_final_list(self):
        pass

    def get_final_recommendation_list(self):
        return self._final_recommendation_list
