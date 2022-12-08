import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:web_server/constant.dart';
import 'package:web_server/model/user_info_model.dart';

void main(List<String> args) async {
  final db = await Db.create(mongoDBurl);
  await db.open();

  final app = Router();

  app.get('/', (Request request) async {
    final collections = await db.collection("users_info").find().toList();
    return Response.ok(
      json.encode(collections),
      headers: {'Content-Type': 'application/json'},
    );
  });

  app.post('/', (Request request) async {
    final payload = request.readAsString();
    await db.collection("staffs").find().toList();
    print(payload);
    return Response.ok('Success');
  });

  app.post('/signup', (Request request) async {
    final usersCollection = db.collection("users");
    final userInfoCollection = db.collection("users_info");
    final payload = await request.readAsString();
    final userInfoPayload = UserInfoModel(email: json.decode(payload)['email']);
    print(userInfoPayload.toJson());
    final allUsersCollections = await usersCollection.find().toList();
    if (!allUsersCollections.any(
        (element) => element.containsValue(json.decode(payload)['email']))) {
      await usersCollection.insert(json.decode(payload));
      await userInfoCollection.insert({"data": userInfoPayload.toJson()});
      print(payload);
      return Response.ok('Success');
    } else {
      print(payload);
      return Response.forbidden('user exists already');
    }
  });

  app.post('/login', (Request request) async {
    final usersCollection = db.collection("users");
    final payload = await request.readAsString();
    final oneUser = await usersCollection.findOne(json.decode(payload));
    if (oneUser != null &&
        oneUser['password'] == json.decode(payload)['password']) {
      return Response.ok('Success');
    } else {
      print(payload);
      return Response.forbidden('Incorrect password/username');
    }
  });

  app.get('/', (Request request) async {
    final collections = await db.collection("staffs").find().toList();
    return Response.ok(json.encode(collections),
        headers: {'Content-Type': 'application/json'});
  });

  // final handleCascade = shelf.Cascade().add((request) {
  //   if (request.method == 'GET') {
  //     final collections = db.collection("staffs").find().toList();
  //     return shelf.Response.ok("success")
  //         .change(body: collections.then((value) => value));
  //   }
  //   return shelf.Response.notFound('get not found');
  // }).add((request) {
  //   if (request.method == 'POST') {
  //     print(request.handlerPath);
  //     return shelf.Response.ok('handler POST method');
  //   }
  //   return shelf.Response.notFound('post not found');
  // }).add((request) {
  //   if (request.method == 'PATCH') {
  //     print(args);
  //     return shelf.Response.ok('handler PATCH method');
  //   }
  //   return shelf.Response.notFound('patch not found');
  // }).handler;

  // final handler = const shelf.Pipeline()
  //     .addMiddleware(shelf.logRequests())
  //     .addMiddleware((innerHandler) => (request) async {
  //           final updatedrequest = request.change();
  //           return await innerHandler(updatedrequest);
  //         })
  //     .addHandler(handleCascade);

  final server = await io.serve(
    app,
    hostname,
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}
