import 'package:chat_app_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 2;
  }
  return state;
}

void main() {
  runApp(LoginScreen());
}

class MyApp extends StatelessWidget {
  final store = Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("hfgghh"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have hung pushed thes manyvg times:',
                ),
                StoreConnector<int, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) {
                      return Text(
                        count,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }),
              ],
            ),
          ),
          floatingActionButton:
              StoreConnector<int, VoidCallback>(converter: (store) {
            return () => store.dispatch(Actions.Increment);
          }, builder: (context, callback) {
            return FloatingActionButton(
                onPressed: callback,
                tooltip: "Incress",
                child: Icon(Icons.add));
          }),
        ),
      ),
    );
  }
}
