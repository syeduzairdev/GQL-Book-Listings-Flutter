import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:gql_flutter_todo/repositories/books_repository/books_repository.dart';

class BooksListing extends StatefulWidget {
  const BooksListing({Key? key}) : super(key: key);

  @override
  State<BooksListing> createState() => _BooksListingState();
}

class _BooksListingState extends State<BooksListing> {
  List<Book> books = [];
  bool _loading = false;
  final BooksRepository _booksRepository = BooksRepository(
      Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // books repository
    fetchBooks();
  }

  void fetchBooks() async {
    setState(() {
      _loading = true;
    });
    books = await _booksRepository.getBooksPaginated(10, 0);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books List Using Service and Repository Layer'),
      ),
      body: Center(
        child: (_loading)
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].title!),
                    subtitle: Text(books[index].isbn!),
                  );
                },
              ),
      ),
    );
  }
}
