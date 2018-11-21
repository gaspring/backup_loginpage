import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.grey));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 4000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/wallp.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new ListView(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: new Image(
                    image: new AssetImage("assets/bluelamp.png"),
                    height: _iconAnimation.value * 120,
                    width: _iconAnimation.value * 120,
                  ),
                ),

//              new FlutterLogo(
//              //  size: _iconAnimation.value * 100,
//              ),

                new Form(
                  child: new Theme(
                    data: new ThemeData(
                        primaryColor: Colors.blue,
                        // HINTCOLOR muda a lihna do campo a ser preenchido
                        // PrimarySwatch/primaryColor também mudam a cor da linha do campo
                        hintColor: Colors.blue,
                        inputDecorationTheme: new InputDecorationTheme(
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: new TextStyle(
                                color: Colors.white, fontSize: 20.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: Text(
                              'Teste',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                            margin: EdgeInsets.only(
                              bottom: 30.0,
                            ),
                          ),

                          // E-MAIL
                          new TextFormField(
                            decoration: new InputDecoration(
                                hintStyle: TextStyle(color: Colors.blue),
                                labelText: "Digite o e-mail",
                                labelStyle: TextStyle(color: Colors.blue)),
                            style: TextStyle(
                                color: Colors.white,
                                decorationColor: Colors.white,

                                // O  "fontWeight" e "bold" são para inserir negrito
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          // SENHA
                          new TextFormField(
                            decoration: new InputDecoration(
                                hintStyle: new TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                labelText: "Digite a senha",
                                labelStyle: TextStyle(color: Colors.blue)),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),

                          // Espaçamento entre CAMPOS e BOTÃO
                          new Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                          ),

                          // BOTÃO
                          new PhysicalModel(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25.0),
                              child: new Container(
                                  width: 150.0,
                                  height: 48.0,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    child: new Text(
                                      'Entrar',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    // child: new Icon(Icons.arrow_forward),
                                    onPressed: () => {},


                                    splashColor: Colors.green,
                                  )))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
