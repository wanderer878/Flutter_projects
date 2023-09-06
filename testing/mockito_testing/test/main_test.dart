//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito_testing/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'main_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {}
