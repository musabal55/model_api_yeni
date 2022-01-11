import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final url = Uri.parse("https://reqres.in/api/users");
int? counter;
var personalResult;

Future callPerson() async {
  try{
final response = await http.get(url);
if (response.statusCode==200) {
var result = personalFromJson(response.body);

  setState(() {
    counter=result.data!.length;
    print(counter);
    print(result.data);
    personalResult=result;
    print(personalResult.data);
  });

return result;
} else {
  print(response.statusCode);
}
  } catch(e) {
    print(e.toString());
  }
}

  @override

  void initState(){
  super.initState();
  callPerson();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: counter,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Title"),
                  subtitle: Text("SubTitle"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                  ),
                );
              }),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
