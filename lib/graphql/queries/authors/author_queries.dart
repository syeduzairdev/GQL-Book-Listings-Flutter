class AuthorQueries {
  AuthorQueries._();

  static const String getAuthorByIdQuery = r'''
    query getAuthorById($author_id: Int!) {
      author(where: {id: {_eq: $author_id}}) {
        id
        first_name
        last_name
        email
      }
    }
''';

  static const String getAuthorsPaginatedQuery = r'''
  query getAuthorsPaginated($limit: Int, $offset: Int) {
    authors(limit: $limit, offset: $offset) {
      id
      first_name
      last_name
      email
    }
  }
''';

  static const getAuthorByFirstNameFirstLetterPaginatedQuery = r'''
  query getAuthorByFirstNameFirstLetterPaginated($first_name_first_letter: String, $limit: Int, $offset: Int) {
    authors(where: {first_name: {_like: $first_name_first_letter}}, limit: $limit, offset: $offset) {
      id
      first_name
      last_name
      email
    }
  }''';
}
