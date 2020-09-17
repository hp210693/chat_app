import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  SlidableController slidableController;
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'phan van hung',
    'dfgdsfg',
    'aaaa',
    'bbb',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    500,
    100,
    600,
    500,
    100,
    500,
    100,
    600,
    500,
    100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hung"),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: Key(entries[index]),
            actionPane: SlidableDrawerActionPane(),
            direction: Axis.horizontal,
            //controller: slidableController,
            actionExtentRatio: 0.25,
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              closeOnCanceled: true,
              onDismissed: (actionType) {
                _showSnackBar(
                    context,
                    actionType == SlideActionType.primary
                        ? 'Dismiss Archive'
                        : 'Dimiss Delete');
                setState(() {
                  entries.removeAt(index);
                });
              },
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'More',
                color: Colors.grey.shade200,
                icon: Icons.more_horiz,
              ),
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () async {
                  var dissmis =
                      await _showConfirmationDialog(context, "Delete");
                  if (dissmis) {
                    setState(() {
                      entries.removeAt(index);
                    });
                  }
                },
              ),
            ],
            child: ListTile(
              isThreeLine: true,
              onLongPress: () {},
              onTap: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("My Super title"),
                      content: Text("${entries[index]}"),
                    ));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/chat/chicken.png'),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name ${entries[index]}",
                    maxLines: 1,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  Text(
                    "21/06/1993",
                    maxLines: 1,
                    style: TextStyle(fontSize: 10.0, color: Colors.black54),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#54",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Divider(
                      color: Colors.black12,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  Future<bool> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text("Are you sure $action?"),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  /// Show snack bar when the user dissmised item
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
