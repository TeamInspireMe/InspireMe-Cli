import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../library/globals.dart' as globals;

final HttpLink httpLink = HttpLink(
  uri: "${globals.url}/graphql",
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
  ),
);

