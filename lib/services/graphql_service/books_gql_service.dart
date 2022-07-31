import 'package:gql_flutter_todo/graphql/queries/books/books_queries.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BooksGQLService {
  BooksGQLService(this.client);
  final GraphQLClient client;

  // List of all books
  Future<List<Book>> getBooksAll() async {
    // getting response based on gql query
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBooksAll),
    ));

    if (response.hasException) {
      print("getBooks exception");
    }
    return _getListOfObjects(response.data!['list']);
  }

  // List of books paginated
  Future<List<Book>> getBooksPaginated(int limit, int offset) async {
    print("getBooksPaginated limit: $limit, offset: $offset");
    // getting response based on gql query
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBooksPaginated),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      },
    ));

    if (response.hasException) {
      print("getBooksPaginated exception");
    }
    return _getListOfObjects(response.data!['books']);
  }

  // List of books paginated search
  Future<List<Book>> getBooksPaginatedSearch(
      int limit, int offset, String search) async {
    // getting response based on gql query
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBooksPaginatedBySearch),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
        'search': search,
      },
    ));

    if (response.hasException) {
      print("getBooksPaginatedSearch exception");
    }
    return _getListOfObjects(response.data!['books']);
  }

// privae method to convert list of map to list of object
  List<Book> _getListOfObjects(List<dynamic> listOfBooksJson) {
    return listOfBooksJson.map((book) => Book.fromJson(book)).toList();
  }

  //Addition of Book
  Future<Book> createBook(
    String isbn,
    String title,
    int author_id,
    String thumbnail,
  ) async {
    // getting response based on gql query
    final response = await client.mutate(MutationOptions(
      document: gql(BookQueries.createBook),
      variables: <String, dynamic>{
        "isbn": isbn,
        "title": title,
        "author_id": author_id,
        "thumbnail": thumbnail,
      },
    ));

    if (response.hasException) {
      print("getBooksMutation exception");
    }
    return (_getBookObject(response.data!["book"]));
  }

  //Deletion  of Book
  Future<Book> deleteBook(
    int id,
  ) async {
    // getting response based on gql query
    final response = await client.mutate(MutationOptions(
      document: gql(BookQueries.deleteBook),
      variables: <String, dynamic>{
        "id": id,
      },
    ));

    if (response.hasException) {
      print("getBooksDelete exception");
    }
    return (_getBookObject(response.data!["delete_books"]["returning"]));
  }

  //Addition of Book
  Future<Book> updateBook(
    int id,
    String isbn,
    String title,
    int author_id,
    String thumbnail,
  ) async {
    // getting response based on gql query
    final response = await client.mutate(MutationOptions(
      document: gql(BookQueries.updateBook),
      variables: <String, dynamic>{
        "id": id,
        "isbn": isbn,
        "title": title,
        "author_id": author_id,
        "thumbnail": thumbnail,
      },
    ));

    if (response.hasException) {
      print("getBooksUpdate exception");
    }
    return (_getBookObject(response.data!["book"]));
  }

// privae method to convert list of map to list of object
  Book _getBookObject(dynamic booksJson) {
    return booksJson.map((book) => Book.fromJson(book));
  }

  Future<Book> getBookById(String id) async {
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBookById),
      variables: <String, dynamic>{
        'id': id,
      },
    ));

    if (response.hasException) {
      print("getBookById exception");
    }

    // this will return single book
    return Book.fromJson(response.data!['books']);
  }
}
