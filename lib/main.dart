import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const ProfilePage(title: '@ivan11navi'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _StatusState();
}

class _StatusState extends State<ProfilePage> {
  var list = ["На связи", "Занят(-та)", "На работе", "Низкий уровень заряда", "Сплю"];
  String _status = "";
  void _determinateStatus() {
    setState(() {
      final _random = new Random();
      _status = list[_random.nextInt(list.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 202, 171),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 146, 113),
          title: Text(widget.title),
        ),
        body: Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white70,
                    ),
                    margin: EdgeInsets.all(30),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person, size: 150),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Иванов Иван",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text("@ivan11navi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.indigo
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text("11.11.2000",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                            color: Colors.black
                                        ),
                                      )
                                    ]
                                )
                              ],
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Статус: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text(
                                    '$_status',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              )
                            ),
                            const SizedBox(width: 20),
                            IconButton(onPressed: _determinateStatus, tooltip: 'Установка статуса', icon: const Icon(Icons.contact_page_sharp))
                          ],
                        )
                      ],
                    ),
                  )
              )
      );
  }
}
