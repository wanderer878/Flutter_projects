//import 'dart:html';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_testing/album.dart';
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

    test("unsuccessful", () {
      final client = mocker.MockClient();

      when(client
              .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1")))
          .thenAnswer((_) async => http.Response("Not Found", 404));

      expect(fetchAlbum(client), throwsException);
    });

    test('create data', () async {
      final client = mocker.MockClient();

      when(client.post(Uri.parse('https://jsonplaceholder.typicode.com/albums'),
              headers: {'Content-type': 'application/json; charset=UTF-8'},
              body: jsonEncode(<String, String>{'title': 'hello_world'})))
          .thenAnswer((_) async => http.Response(
              '{"userId" : 1, "id" : 2, "title" : "hello_world"}', 201));

      expect(await createAlbum(client, "hello_world"), isA<Album>());
    });

    test("update data", () async {
      final client = mocker.MockClient();

      when(client.put(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body:
              jsonEncode({'title': 'hello world'}))).thenAnswer((_) async =>
          http.Response('{"userId": 1,"id": 1,"title": "hello world"}', 200));

      expect(await updateAlbum('hello world', 1, client), isA<Album>());
    });
  });
}
