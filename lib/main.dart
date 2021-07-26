import 'package:flutter/material.dart';
import 'dados.dart';
import 'Dialogs.dart';
import 'SwitchButtonClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'EyeNox - Covid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool validaConta() {
    return false;
  }

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Login loginUser = Login();

    bool executa(String x, String xx) {
      if (loginUser.executaLogin(x, xx)) {
        return true;
      }
      return false;
    }

    final loginButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xff3b184c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (executa(myController1.text, myController2.text)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _MainMenu().build(context)),
            );
          }
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    final cpfField = TextField(
      controller: myController1,
      obscureText: false,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: const Color(0xff3b184c),
          filled: true,
          hintText: "User",
          hintStyle: TextStyle(color: Colors.white),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: myController2,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: const Color(0xff3b184c),
          filled: true,
          hintText: "Senha",
          hintStyle: TextStyle(color: Colors.white),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3b184c),
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        color: const Color(0xff202020),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/jackal.jpg',height: 400,width: 400,),
            //ChangeUser(),
            SizedBox(height: 45.0),
            cpfField,
            SizedBox(height: 25.0),
            passwordField,
            SizedBox(
              height: 35.0,
            ),
            SizedBox(
              height: 35.0,
            ),
            loginButton,
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      )),
    );
  }
}

class MainMenu extends StatefulWidget {
  MainMenu() : super();

  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //dataSimples data1 = new dataSimples("17033-360", 50);

    final cepField = TextField(
      controller: myController1,
      obscureText: false,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: const Color(0xff3b184c),
          filled: true,
          hintText: "CEP",
          hintStyle: TextStyle(color: Colors.white),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final searchButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xff3b184c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return PrincipalViewHistory(myController1.text);
              });
        },
        child: Text(
          "search",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("MainMenu"), //title aof appbar
        backgroundColor: const Color(0xff3b184c), //background color of appbar
      ),
      body: Center(
        child: Center(
          child: Container(
            color: const Color(0xff202020),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: const Color(0xff3b184c),
                    radius: 50,
                    child: Icon(
                      Icons.push_pin_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  Divider(
                    height: 50,
                  ),
                  cepField,
                  SizedBox(
                    height: 70.0,
                  ),
                  searchButton,
                  //TODO map
                  SizedBox(
                    height: 70.0,
                  ),

                  //rechargeButton,
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: DrawerLeft(),
    );
  }
}

class HistoryMenu extends StatefulWidget {
  HistoryMenu() : super();

  @override
  _HistoryMenu createState() => _HistoryMenu();
}

class _HistoryMenu extends State<HistoryMenu> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xff3b184c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogListHistory(myController1.text);
              });
        },
        child: Text(
          "search",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    final cepField = TextField(
      controller: myController1,
      obscureText: false,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: const Color(0xff3b184c),
          filled: true,
          hintText: "CEP",
          hintStyle: TextStyle(color: Colors.white),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      appBar: AppBar(
        //appbar widget on Scaffold
        title: Text("HistoryMenu"), //title aof appbar
        backgroundColor: const Color(0xff3b184c), //background color of appbar
      ),
      body: Center(
        child: Center(
          child: Container(
            color: const Color(0xff202020),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: const Color(0xff3b184c),
                    radius: 50,
                    child: Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  Divider(
                    height: 50,
                  ),
                  cepField,
                  SizedBox(
                    height: 70.0,
                  ),
                  searchButton,
                  //TODO map
                  SizedBox(
                    height: 70.0,
                  ),

                  //rechargeButton,
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: DrawerLeft(),
      //endDrawer: DrawerLeft(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class DrawerLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xff202020),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff3b184c),
              ),
              child: CircleAvatar(
                backgroundColor: const Color(0xff3b184c),
                radius: 60,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MainMenu().build(context)),
                );
              },
            ),
            ListTile(
              title: Text(
                'History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _HistoryMenu().build(context)),
                );
              },
            ),
            ListTile(
              title: Text(
                'Exit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          new MyHomePage(title: "EyeNox - Covid")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
