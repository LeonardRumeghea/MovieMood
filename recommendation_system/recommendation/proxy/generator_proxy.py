from recommendation.proxy.real_recommendation_generator import RealRecommendationGenerator
from recommendation.proxy.recommendation_generator import RecommendationGenerator


class GeneratorProxy(RecommendationGenerator):
    def __int__(self, real_recommendation_generator: RealRecommendationGenerator):
        self._real_recommendation_generator = real_recommendation_generator

    def get_final_recommendation_list(self):
        self._real_recommendation_generator.get_final_recommendation_list()

