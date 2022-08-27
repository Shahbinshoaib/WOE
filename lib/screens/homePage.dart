import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woe/authenticate/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage>{

  final FirebaseAuthService _auth = FirebaseAuthService();

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }


  bool loader = false;
  bool _showPassword = true;
  String email = '';
  String password = '';
  String error = '';
  String gError = '';

  int _index1 = 0;

  AnimationController controller1;
  Animation<int> animationForTypingText1;

  List<String> text = ['Color Photo Copier,\nPrinter,\nScanner,\nNetworking,\nSale,\nService & Rental'];

  List<Machine> machine = [
    Machine(pic: 'assets/c2551.jpg',title: 'Ricoh Aficio MP c2551',details: 'Colour Printer, Colour Scanner & Networking\nA3 Size & 250gsm. Paper\n25 copies/minute'),
    Machine(pic: 'assets/c2003.jpg',title: 'Ricoh Aficio MP c2003',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n12/18 Size & 250gsm. Paper\nUSB Printing\n20 copies/minute'),
    Machine(pic: 'assets/c3003.jpg',title: 'Ricoh Aficio MP c3003',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n12/18 Size & 250gsm. Paper\nUSB Printing\n30 copies/minute'),
    Machine(pic: 'assets/c3004.png',title: 'Ricoh Aficio MP c3004',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n12/18 Size & 250gsm. Paper\nUSB Printing & Full Touch Panel\n30 copies/minute'),
    Machine(pic: 'assets/c5100.jpg',title: 'Ricoh Aficio MP c5100',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n13/19 Size & 300gsm. Paper\nUSB Printing\n51 copies/minute'),
    Machine(pic: 'assets/c7501.jpg',title: 'Ricoh Aficio MP c6501',details: 'Colour Printer, Colour Scanner & Networking\n12/18 Size & 300gsm. Paper\n65 copies/minute'),
    Machine(pic: 'assets/c6502.png',title: 'Ricoh Aficio MP c6502',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n13/19 Size & 300gsm. Paper\nUSB Printing\n65 copies/minute'),
    Machine(pic: 'assets/c751.jpg',title: 'Ricoh Aficio MP c751',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n13/19 Size & 300gsm. Paper\nPro Production\n75 copies/minute'),
    Machine(pic: 'assets/c901.jpg',title: 'Ricoh Aficio MP c900',details: '(Latest Model)\nColour Printer, Colour Scanner & Networking\n13/19 Size & 300gsm. Paper\nPro Production\n90 copies/minute'),
    Machine(pic: 'assets/2851.png',title: 'Ricoh Aficio MP 2851',details: 'B/W Printer, Colour Scanner & Networking\nA3 Size Paper\n28 copies/minute'),
    Machine(pic: 'assets/2852.jpg',title: 'Ricoh Aficio MP 2852',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA3 Size Paper\n33 copies/minute'),
    Machine(pic: 'assets/3352.jpg',title: 'Ricoh Aficio MP 3353',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA3 Size Paper\n33 copies/minute'),
    Machine(pic: 'assets/5000.jpg',title: 'Ricoh Aficio MP 5000',details: 'B/W Printer, Colour Scanner & Networking\nA3 Size Paper\n50 copies/minute'),
    Machine(pic: 'assets/5001.jpg',title: 'Ricoh Aficio MP 5001',details: 'B/W Printer, Colour Scanner & Networking\nA3 Size Paper\n50 copies/minute'),
    Machine(pic: 'assets/5002.png',title: 'Ricoh Aficio MP 5002',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA3 Size Paper\n50 copies/minute'),
    Machine(pic: 'assets/2501.jpg',title: 'Ricoh Aficio MP 2501',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA3 Size Paper\n25 copies/minute'),
    Machine(pic: 'assets/2501.jpg',title: 'Ricoh Aficio MP 2001',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA3 Size Paper\n20 copies/minute'),
    Machine(pic: 'assets/301.png',title: 'Ricoh Aficio MP 301',details: '(Latest Model)\nB/W Printer, Colour Scanner & Networking\nA4 Size Paper\n30 copies/minute'),
    Machine(pic: 'assets/201.jpg',title: 'Ricoh Aficio MP 201',details: 'B/W Printer, Colour Scanner & Networking\nA4 Size Paper\n20 copies/minute'),
    Machine(pic: 'assets/171.gif',title: 'Ricoh Aficio MP 171',details: 'B/W Printer, Colour Scanner & Networking\nA4 Size Paper\n17 copies/minute'),
  ];

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(vsync: this, duration: Duration(seconds: 10),);
    animationForTypingText1 = IntTween(begin: 0, end: text[0].length).animate(controller1);
    controller1.repeat(reverse: true);  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    Future<void> _showLoginDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
                child: Column(
                  children: [
                    Image.asset('assets/title.jpg',height: 70),
                    Text('WELCOME',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
            alignment: Alignment.center,),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: w*0.25,
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Text('Log in using email and password'),
                              TextFormField(
                                validator: _validateName,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  icon: Icon(Icons.email),
                                  labelText: 'Email',
                                ),
                                onChanged: (value){
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                              TextFormField(
                                validator: _validateName,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: _showPassword,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    icon: Icon(Icons.security),
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.remove_red_eye,color: _showPassword ? Colors.grey : Colors.green,),
                                      onPressed: (){
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                    )
                                ),
                                onChanged: (value){
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                              SizedBox(height: h*0.04),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                      onTap: () async{
                                        //_passwordResetDialog();
                                      },
                                      child: Text('Forget Password?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: h*0.018,color: Colors.red[800]),))),
                              SizedBox(height: h*0.04),
                              ButtonTheme(
                                height: h*0.06,
                                minWidth: w*0.9,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                                child: RaisedButton(
                                  color: Colors.red[800],
                                  child: Text('Sign in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: h*0.028),),
                                  onPressed: () async{
                                    // if(_formkey.currentState.validate()){
                                    //   setState(() {
                                    //     loader = true;
                                    //   });
                                    //   dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    //   if (result == null){
                                    //     setState(() {
                                    //       error = 'Incorrect credentials';
                                    //     });
                                    //   } else{
                                    //   }
                                    //   setState(() {
                                    //     loader = false;
                                    //   });
                                    // }
                                  },
                                ),
                              ),
                              SizedBox(height: h*0.01,),
                              Text(
                                error,
                                style: TextStyle(color: Colors.red[800], fontSize: 14.0),
                              ),
                              SizedBox(height: h*0.01),
                              GestureDetector(
                                  child: Text('Create a new account?',style: TextStyle(color: Colors.red[800]),),
                                onTap: (){

                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 1,
                        height: 300,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 20,),
                      Container(
                        //height: h*0.9,
                        width: w*0.25,
                        child: Column(
                          children: [
                            Text('Log in using social media'),
                            SizedBox(height: h*0.08,),
                            ButtonTheme(
                              buttonColor: Colors.white,
                              minWidth: w*0.4,
                              height: h*0.06,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                              child: RaisedButton(
                                child: Image.asset('assets/google2.png',height: h*0.03,),
                                onPressed: () async {
                                  //_auth.signInWithGoogle();
                                  // setState(() {
                                  //   loader = true;
                                  // });
                                  // dynamic result = await _auth.signInWithGoogle();
                                  // if (result == null){
                                  //   setState(() {
                                  //     gError = 'Could Not Sign In With Google';
                                  //     loader = false;
                                  //   });
                                  // } else{
                                  //
                                  // }
                                },
                              ),
                            ),
                            SizedBox(height: h*0.04,),
                            ButtonTheme(
                              buttonColor: Colors.indigo[900],
                              minWidth: w*0.4,
                              height: h*0.06,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                              child: RaisedButton(
                                  child: Image.asset('assets/facebook.jpg',height: h*0.05,),
                                  onPressed:  () async{
                                    // dynamic result = await _auth.signInFB();
                                    // print(result);
                                    // if (result == null){
                                    //   setState(() {
                                    //     gError = 'Could Not Sign In With Facebook';
                                    //     loader = false;
                                    //   });
                                    // } else{
                                    //
                                    // }
                                  }
                              ),
                            ),
                            SizedBox(height: h*0.13,),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    final drawerHeader = UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.red[900],
                Colors.red,
              ])
      ),

      accountName: Text('User'),
      accountEmail: null,
      currentAccountPicture: CircleAvatar(
        radius: 40.0,
       // backgroundImage: NetworkImage(''),
        backgroundColor: Colors.transparent,
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      drawer:
      w > 550 ? null :
      Container(
        width: w*0.5,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              drawerHeader,
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Buy / Rental'),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    //_showlogoutDialog();
                  });
                },
              ),
              //user.email == 'shahbinshoaib@gmail.com' || user.email == 'firebasedb786@gmail.com' || user.email == 'shahrukh_srk6@outlook.com' ?
              ListTile(
                leading: Icon(Icons.money),
                title: Text('Sell'),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                   // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: QueryDataScreen()));
                  });
                },
              ) ,
                //: Container(),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Contact'),
                onTap: () {
                  setState(() {
                    //Navigator.pop(context);
                    //Navigator.of(context).push(About1());
                  });
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.asset('assets/title.jpg',height: 60,),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          w < 550 ? Container() :
          FlatButton(
            child: Text('Buy / Rental',style: TextStyle(color: Colors.black),),
            onPressed: (){

            },
          ),
          w < 550 ? Container() :
          FlatButton(
            child: Text('Sell',style: TextStyle(color: Colors.black),),
            onPressed: (){

            },
          ),
          w < 550 ? Container() :
          FlatButton(
            child: Text('Contact',style: TextStyle(color: Colors.black),),
            onPressed: (){

            },
          ),
          w < 550 ? Container() :
          SizedBox(width: 20,),
          IconButton(
            icon: Icon(Icons.account_circle,color: Colors.grey,),
            onPressed: (){
              //_showLoginDialog();
            },
          ),
          SizedBox(width: 10,)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('WhatsApp',style: TextStyle(color: Colors.green),),
        icon: Image.asset('assets/whatsapp.png',height: 30,),
        backgroundColor: Colors.white,
        onPressed: (){
          launch('https://api.whatsapp.com/send/?phone=923222862483&text&app_absent=0');

        },
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              w > 550 ?
              Container(
                height: h*0.91,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: w*0.4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(50, h*0.2, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text('We Expertize in,',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50),),
                            SizedBox(height: h*0.02,),
                            TypingText(
                              string: text[0],
                              animation: animationForTypingText1,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Image.asset('assets/ricoh5.png',width: w*0.6,fit: BoxFit.contain),
                  ],
                ),
              ) : Container(
                height: h*0.91,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        child: Image.asset('assets/ricoh5.png',height: h*0.35,),
                      alignment: Alignment.center,
                    ),
                    Container(
                      height: h*0.35,
                      width: 320,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, h*0.05, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text('We Expertize in,',style: TextStyle(color: Colors.black,fontSize: h*0.05),),
                            SizedBox(height: h*0.02,),
                            TypingText(
                              string: 'Color Photo Copier,\nPrinter,\nScanner,\nNetworking,\nSale,\nService & Rental',
                              animation: animationForTypingText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.02,),
                  ],
                ),
              ),
              SizedBox(height: w > 550 ? 30 : 10),
              Text('PHOTOCOPIER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: w > 550 ? h*0.06 : h*0.05,color: Colors.red[800],letterSpacing: 4)),
              SizedBox(height: 40),
              w > 550 ?
              Container(
                color: Colors.white,
                height: h*1,
                child: PageView.builder(
                  itemCount: machine.length,
                  scrollDirection: Axis.horizontal,
                  controller: PageController(viewportFraction: 0.5),
                  onPageChanged: (int index) => setState(() => _index1 = index),
                  itemBuilder: (context,index){
                    return Transform.scale(
                      scale: index == _index1 ? 1 : 0.8,
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(machine[index].pic,height: h*0.7,fit: BoxFit.contain,),
                            SizedBox(height: 30,),
                            Text(machine[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: h*0.035),),
                            SizedBox(height: 5,),
                            Text(machine[index].details,textAlign: TextAlign.center,style: TextStyle(fontSize: h*0.018),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ) : Container(
                color: Colors.white,
                height: h*0.91,
                child: PageView.builder(
                  itemCount: machine.length,
                  scrollDirection: Axis.horizontal,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index1 = index),
                  itemBuilder: (context,index){
                    return Transform.scale(
                      scale: index == _index1 ? 1 : 0.8,
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(machine[index].pic,height: h*0.6,fit: BoxFit.contain,),
                            SizedBox(height: 30,),
                            Text(machine[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: h*0.03),),
                            SizedBox(height: 5,),
                            Text(machine[index].details,textAlign: TextAlign.center,style: TextStyle(fontSize: h*0.015),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: w > 550 ? 30: 0),
              Text('TONER',style: TextStyle(fontWeight: FontWeight.bold,fontSize:w > 550 ? h*0.06 : h*0.05,color: Colors.red[800],letterSpacing: 4)),
              SizedBox(height: 40),
              w > 550 ?
              Container(
                color: Colors.white,
                height: h*1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: h*0.5,
                              width: w*0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2551.jpg',fit: BoxFit.contain,),
                                  Text('Ricoh Aficio MP\nc2021/2050/2551',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2003.jpg'),
                                  Text('Ricoh Aficio MP\nc2003/3003/3004',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/5100.jpg'),
                                  Text('Ricoh Aficio MP c5100',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/6501.jpg'),
                                  Text('Ricoh Aficio MP\nc6501/6502/8300',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/751.jpg'),
                                  Text('Ricoh Aficio MP c751',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/900.jpg'),
                                  Text('Ricoh Aficio MP c900',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2851.jpg'),
                                  Text('Ricoh Aficio MP\n2851/2852/3353',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w*0.2,
                              height: h*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/5000.png'),
                                  Text('Ricoh Aficio MP\n5000/5001/5002',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ],
                    ),
                  ],
                )
              ) : Container(
                  color: Colors.white,
                  //height: h*1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: h*0.4,
                              width: w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2551.jpg',height: h*0.3,),
                                  Text('Ricoh Aficio MP\nc2021/2050/2551',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2003.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP\nc2003/3003/3004',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/5100.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP c5100',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/6501.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP\nc6501/6502/8300',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/751.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP c751',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/900.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP c900',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/2851.jpg',height: h*0.3),
                                  Text('Ricoh Aficio MP\n2851/2852/3353',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: w,
                              height: h*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/5000.png',height: h*0.3),
                                  Text('Ricoh Aficio MP\n5000/5001/5002',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  )
              ),
              w > 550 ?
              Container(
                color: Colors.black,
                height: h*0.91,
              ) : Container(
                color: Colors.black,
                height: h*0.91,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class TypingText extends AnimatedWidget {
  final String string;

  TypingText({this.string, Key key, Listenable animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {


    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final animation = listenable as Animation<int>;
    return Text(string.substring(0, animation.value),style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.bold,fontSize: w > 550 ? 35 : h*0.03),);
  }
}
class Machine {
  final String pic;
  final String title;
  final String details;

  Machine({this.pic, this.title,this.details});

}