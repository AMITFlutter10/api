import 'package:api/home_page.dart';
import 'package:api/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User',
      theme:
          ThemeData(primarySwatch: Colors.grey, backgroundColor: Colors.teal),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://reqres.in/api/users";

  late Future<UserModel> future;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    future = getData();
  }

  Future<UserModel> getData() async {
    //  ************************************************************ HTTP Package ************************************************************

    //http request
    //response body
    //  try {
    //    final http.Response response = await http.get(Uri.parse(url));
    //    print(
    //        "http package -Response body ${response.body} -States Code ${response
    //            .statusCode}");
    //    return UserModel.fromJson(jsonDecode(response.body));
    //  }catch(error){
    //    throw Exception('Failed to load Users');
    //  }

    //  ************************************************************ Dio Package ************************************************************

    //Dio Request
    try {
      final Response response = await dio.get(url);
      print(
          "Dio package Response data => ${response.data} -States Code ${response.statusCode}");
      return UserModel.fromJson(response.data);
    } on DioError catch (error) {
      throw Exception(
          "Failed to load Users : Error ${error.error} -Response ${error.response}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get Api "),
        ),
        //  ************************************************************ Using Future Builder ************************************************************

        body: FutureBuilder<UserModel>(
            future: future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return (const Text("Error is happened"));
                  } else {
                    return Column(
                        children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.data?.length,
                          itemBuilder: (context, index) {
                            final Model = snapshot.data?.data![index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage('${Model!.avatar}'),
                              ),
                              title:
                                  Text('${Model.firstName} ${Model.lastName}'),
                              subtitle: Text('${Model.email}'),
                              trailing: Text('${Model.id}'),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text("Press"),
                        ),
                      )
                    ]);
                  }
              }
            }
            )
    );
  }
}
