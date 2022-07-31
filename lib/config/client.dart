import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/gql_string.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    gqlString,
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
      // initialPayload: () async {
      //   return {
      //     'headers': {
      //       // 'Authorization': _token,
      //       'HASURA_GRAPHQL_UNAUTHORIZED_ROLE': 'anonymous',
      //       // 'HASURA_GRAPHQL_ADMIN_SECRET':
      //       // 'XkUKGyUWVF9xfipcUvs1gXwpJnu2AsAeNWMKFTlW46qWhqi0lZAAJQKDLrGXY1GV'
      //     }
      //   };
      // },
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(webSocketLink);

  // static String token;
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(cache: GraphQLCache(store: HiveStore()), link: link),
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
