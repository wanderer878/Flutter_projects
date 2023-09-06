//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_testing/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'main_test.mocks.dart' as mocker;

// bhai dart run build_runner build agr mocks.dart file create na krrha ho
// build-runner package ko dev dependency ki jaga main dependency me rkh kr check krien.

@GenerateMocks([http.Client])
void main() {
  group("mockito http test", () {
    test('successfull', () async {
      final client = mocker.MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response(
              '{"userId" : 1, "id" : 2, "title" : "hello_world"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test("unsuccessful", () async {
      final client = mocker.MockClient();

      when(client
              .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1")))
          .thenAnswer((_) async => http.Response("Not Found", 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
