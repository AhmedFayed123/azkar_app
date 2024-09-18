import 'package:flutter/material.dart';


class AdhkarScreenDetails extends StatelessWidget {
  const AdhkarScreenDetails(
      {super.key, required this.description, required this.title});

  final List description;
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: description.length,
          itemBuilder: (context, index) {
            return ListItem(
              description: description, index: index,
            );
          },
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.description, required this.index,
  });

  final List description;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            description[index].count==""?const Text(''):
            Text(
              'عدد التكرارات ${description[index].count}',
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              description[index].content,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 10,),
            description[index].description==""?const Text(''):
            Text(
              'وصف : ${description[index].description}',
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 16
              ),
            ),
            const Divider(thickness: 3,color: Colors.black,)
          ],
        ),
      ),
    );
  }
}
