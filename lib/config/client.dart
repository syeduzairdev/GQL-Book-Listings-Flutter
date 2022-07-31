import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/gql_String.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    '${'https://' + gqlString}',
  );

  static String getAuthHeaders() {
    if (AuthTokenRepository().authTokenSetForRequest()) {
      return AuthTokenRepository().getAuthToken().token;
    }
    return '';
  }

  // (AuthTokenRepository().getAuthToken().token)
  // check if the auth token is available

  static late String _token;
  static final AuthLink authLink =
      AuthLink(getToken: () async => getAuthHeaders());

  static final WebSocketLink webSocketLink = WebSocketLink(
    'wss://${gqlString}',
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(webSocketLink);

  // static String token;
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
          cache: GraphQLCache(
            store: HiveStore(),
          ),
          link: link),
    );
    return client;
  }

  static GraphQLClient initializeGQLClient(String token) {
    _token = token;
    GraphQLClient client =
        GraphQLClient(cache: GraphQLCache(store: HiveStore()), link: link);
    return client;
  }
}
