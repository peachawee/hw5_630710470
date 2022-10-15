import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class NewWork{
  bool done;
  String work;
  NewWork({required this.done, required this.work});
}

var List = [
  NewWork(done: true, work: 'ทำการบ้านครั้งที่ 4 วิชา Mobile App Dev'),
  NewWork(done: false, work: 'ทำการบ้านครั้งที่ 5 วิชา Mobile App Dev'),
  NewWork(done: false, work: 'ทำโปรเจค วิชา Mobile App Dev'),
];

class _TodoPageState extends State<TodoPage> {
  final _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.check_box),
              Text(' My ToDo'),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: List.length,
                itemBuilder: (context, i) {
                  var value = List[i].done;
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        List[i].done = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${List[i].work}',
                                      style: TextStyle(
                                          decoration: value
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onTap: () {
                                setState(() {
                                  List.removeAt(i);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _input,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter new ToDo',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      child: InkWell(
                        hoverColor: Colors.blue[100],
                        onTap: () {
                          if (_input.text.length > 0)
                            setState(
                                  () {
                                List.add(NewWork(
                                  done: false,
                                  work: _input.text,
                                ));
                                _input.clear();
                              },
                            );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
