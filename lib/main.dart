import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:job_search_app/main_app.dart';

void main() {
  runApp(QueryClientProvider(queryClient: QueryClient(), child: MainApp()));
}
