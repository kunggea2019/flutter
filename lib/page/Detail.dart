import 'package:flist/page/Lists.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  static const routeName = '/detail';

  // @override
  // Widget build(BuildContext context) {
  //   return ElevatedButton(
  //       onPressed: () => {Navigator.pop(context)},
  //       child: const Text('back bitch'));
  // }

  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Detail> {
  var items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.green),
              child: ListTile(
                  title: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('jump bitch')));
                  Navigator.pushNamed(context, Lists.routeName);
                },
                child: Text(item),
              )),
            );
          },
        ),
      ),
    );
  }
}
