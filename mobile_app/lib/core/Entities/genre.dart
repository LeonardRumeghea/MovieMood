enum Genre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  scienceFiction,
  tvMovie,
  thriller,
  war,
  western,
}

Genre genreFromString(String genreString) {
  switch (genreString) {
    case 'Action':
      return Genre.action;
    case 'Adventure':
      return Genre.adventure;
    case 'Animation':
      return Genre.animation;
    case 'Comedy':
      return Genre.comedy;
    case 'Crime':
      return Genre.crime;
    case 'Documentary':
      return Genre.documentary;
    case 'Drama':
      return Genre.drama;
    case 'Family':
      return Genre.family;
    case 'Fantasy':
      return Genre.fantasy;
    case 'History':
      return Genre.history;
    case 'Horror':
      return Genre.horror;
    case 'Music':
      return Genre.music;
    case 'Mystery':
      return Genre.mystery;
    case 'Romance':
      return Genre.romance;
    case 'Science Fiction':
      return Genre.scienceFiction;
    case 'TV Movie':
      return Genre.tvMovie;
    case 'Thriller':
      return Genre.thriller;
    case 'War':
      return Genre.war;
    case 'Western':
      return Genre.western;
    default:
      return Genre.drama;
  }
}

String genreToString(Genre genre) {
  switch (genre) {
    case Genre.action:
      return 'Action';
    case Genre.adventure:
      return 'Adventure';
    case Genre.animation:
      return 'Animation';
    case Genre.comedy:
      return 'Comedy';
    case Genre.crime:
      return 'Crime';
    case Genre.documentary:
      return 'Documentary';
    case Genre.drama:
      return 'Drama';
    case Genre.family:
      return 'Family';
    case Genre.fantasy:
      return 'Fantasy';
    case Genre.history:
      return 'History';
    case Genre.horror:
      return 'Horror';
    case Genre.music:
      return 'Music';
    case Genre.mystery:
      return 'Mystery';
    case Genre.romance:
      return 'Romance';
    case Genre.scienceFiction:
      return 'Science Fiction';
    case Genre.tvMovie:
      return 'TV Movie';
    case Genre.thriller:
      return 'Thriller';
    case Genre.war:
      return 'War';
    case Genre.western:
      return 'Western';
    default:
      return 'Drama';
  }
}

List<Genre> genresFromJSONList(String list) {
  List<Genre> genres = [];
  for (String genre in list.split(',')) {
    genres.add(genreFromString(genre));
  }
  return genres;
}
