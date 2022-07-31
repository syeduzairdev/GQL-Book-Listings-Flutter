import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:gql_flutter_todo/services/graphql_service/books_gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BooksRepository {
  final GraphQLClient client;
  late BooksGQLService _booksGQLService;
  BooksRepository(this.client) {
    _booksGQLService = BooksGQLService(client);
  }

  Future<List<Book>> getBooksPaginated(int limit, int offset) async {
    return _booksGQLService.getBooksPaginated(limit, offset);
  }
}
