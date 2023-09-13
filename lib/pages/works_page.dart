import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

final titles = [
  "List 1",
  "List 2",
  "List 3",
  "List 4",
  "List 5",
  "List 6",
  "List 7",
  "List 8",
  "List 9",
  "List 10",
  "List 11",
  "List 12"
];
final subtitles = [
  "Here is list 1 subtitle",
  "Here is list 2 subtitle",
  "Here is list 3 subtitle",
  "Here is list 4 subtitle",
  "Here is list 5 subtitle",
  "Here is list 6 subtitle",
  "Here is list 7 subtitle",
  "Here is list 8 subtitle",
  "Here is list 9 subtitle",
  "Here is list 10 subtitle",
  "Here is list 11 subtitle",
  "Here is list 12 subtitle",
];

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                  child: ListTile(
                title: Text(titles[index]),
                subtitle: Text(subtitles[index]),
                leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                trailing: const Icon(Icons.arrow_forward),
              )),
            ],
          );
        });
  }
}
