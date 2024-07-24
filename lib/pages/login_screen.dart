import 'package:Diabo/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  static const routeName = '/home';
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
        bool _obscureText = true;
        List<String> gameList = ["ชาย", "หญิง"];
        var selectedValue;
 

  @override
  void initState() {
    super.initState();
  }

  Widget HomePage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 58, 60, 173), //หน้าwebหลัก
        //image: DecorationImage(
          //colorFilter: ColorFilter.mode(
             // Colors.black.withOpacity(0.1), BlendMode.dstATop),
          //image: const AssetImage('assets/images/mountains.jpg'), //ภาพพื้นหลัง
          //fit: BoxFit.cover,
      //  ),
      ),
      child: Column(
        children: <Widget>[
          Container( //logo
            padding: const EdgeInsets.only(left: 60.0,right: 50,top: 100),
            child:
                Image.asset('assets/images/Diabo_logo.png',
                width: 350,
                height: 350,
                fit: BoxFit.cover,
                ),
                
              
              //child: Icon(
                //Icons.headset_mic,
                //color: Colors.white,
                //size: 40.0,
              //),
            ),
          
          
          Container(//go signup
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded( 
                  child: OutlinedButton( //no color
                    onPressed: () => gotoSignup(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(//go login
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton( //have color
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    //color: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget LoginPage() {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0.0,
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 30),
          color: Color.fromARGB(255, 255, 255, 255), 
          onPressed: () => gotoHomePage(),
        ),
        backgroundColor: Color.fromARGB(255, 49, 42, 107),
      ),
      backgroundColor: Color.fromARGB(255, 75, 110, 192),
      
        //image: DecorationImage(
          //colorFilter: ColorFilter.mode(
              //Colors.black.withOpacity(0.05), BlendMode.dstATop),
          //image: const AssetImage('assets/images/mountains.jpg'), //background
          //fit: BoxFit.cover,
        //),
        body: Container(
          child : SingleChildScrollView(
        padding: EdgeInsets.only(left: 50,right: 40,top: 20),
          child:
        Column(


          children: <Widget>[
            Container( //logo
              //padding: const EdgeInsets.all(0.0),
              child: 
                Image.asset('assets/images/Diabo_logo.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
                )
                
              
            ),




            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  //cursorColor: Color.fromARGB(255, 255, 118, 118), สีเวลาจะพิม
                  //keyboardType: TextInputType.phone,
                  
                 decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  //errorText: 'Error message',
                  //suffixIcon: Icon(Icons.remove_red_eye),//color text float
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  ),
                    labelText: "Username",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        //helperText: 'Helper text',
                        filled: true,
                        fillColor: Color.fromARGB(62, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        )
                        //icon: Icon(Icons.person),
                        //hintText: "กรุณากรอกชื่อและนามสกุลเป็นภาษาไทย",
                      ),
                //keyboardType: TextInputType.number,
                ),
                const Divider(
              height: 20.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            TextFormField(
                  //cursorColor: Color.fromARGB(255, 255, 118, 118), สีเวลาจะพิม
                  //keyboardType: TextInputType.phone,
                  obscureText: _obscureText,
                 decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  //errorText: 'Error message',
                  suffixIcon: Icon(Icons.remove_red_eye),//color text float
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  ),
                    labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        //helperText: 'Helper text',
                        filled: true,
                        fillColor: Color.fromARGB(62, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        )
                        //icon: Icon(Icons.person),
                        //hintText: "กรุณากรอกชื่อและนามสกุลเป็นภาษาไทย",
                      ),
                //keyboardType: TextInputType.number,
                ),
               


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: OutlinedButton(
                     style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(0, 255, 255, 255)), // Border color
                    ), //FlatButton
                    child: const Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 139, 45, 45),
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic
                        //decoration: TextDecoration.underline,
                        //decorationColor: Color.fromARGB(255, 158, 46, 46),
                        
                      ),
                      
                    ),
                    onPressed: () => gotoHomePage(), //go forgot password
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),


            
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      //color: Colors.redAccent,
                      onPressed: () => gotoMain(), //go homepage
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 48, 126),
                                    fontWeight: FontWeight.bold),    
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
          ]
        ),
    ),
        ),
    );
  }

  Widget SignupPage() {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Diabo"),
        //centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 25),
        //elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 40),
          color: Color.fromARGB(255, 255, 255, 255), 
          onPressed: () => gotoHomePage(),
        ),
        backgroundColor: Color.fromARGB(255, 49, 42, 107),
      ),
      backgroundColor: Color.fromARGB(255, 75, 110, 192),
      
    body: Center(
      
      child : SingleChildScrollView(
        padding: EdgeInsets.all(32),
        
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              
              child: CircleAvatar(
                child: Align(
                  alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 208, 180, 180),
                      radius: 12.0,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15.0,
                        color: Color(0xFF404040),
                      ),
                    ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                 decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "ชื่อ - นามสกุล",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.person),
                        //hintText: "กรุณากรอกชื่อและนามสกุลเป็นภาษาไทย",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ),
                      ),
                //keyboardType: TextInputType.number,
                ),
                const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
                TextFormField(
                 decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "Username",   
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.assignment_ind),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ),
                        //hintText: "กรุณากรอก username.",
                      ),
                //keyboardType: TextInputType.number,
                ),
                const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
                TextFormField(
                 decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "Password",   
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.pin),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ), //https lock pin
                        //hintText: "กรุณากรอก password.",
                      ),
                //keyboardType: TextInputType.number,
                ),
                const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
                TextFormField(
                 decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "วันเกิด",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.cake),
                        //errorText: 'Username is required',
                        hintText: "วัน / เดือน / ปี พ.ศ.",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ),
                      ),
                //keyboardType: TextInputType.number,
                ),
              ],
            ),
            const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
                TextFormField(
                 decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "น้ำหนัก",
                         labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.monitor_weight), //monitor_weight_outlined
                        //errorText: 'Username is required',
                        hintTextDirection: TextDirection.rtl,
                        hintText: ".kg",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ),
                        ),
                //keyboardType: TextInputType.number,
                ),
            const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
                TextFormField(
                 decoration: const InputDecoration(
                         border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "ส่วนสูง",
                         labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                        filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.emoji_people),  //height
                        //errorText: 'Username is required',
                        hintTextDirection: TextDirection.rtl,
                        hintText: ".cm",
                       focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            )
                        ),
                        ),
                //keyboardType: TextInputType.number,
                ),
            const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "เพศ",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                          ),
                          filled: true,
                        fillColor: Color.fromARGB(65, 255, 255, 255),
                        icon: Icon(Icons.wc), //people 
                           focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0) // color border
                            ),
                           ),
              ),
              value: selectedValue,
              items: gameList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                selectedValue = value;
              },
                );
            }
            ),
            const Divider(
              height: 30.0,
              color: Color.fromARGB(0, 255, 255, 255),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      //color: Colors.redAccent,
                      onPressed: () => gotoLogin(), //go to login
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "SIGN UP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
  gotoHomePage() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      1,
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceOut,
    );
  }
  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: const Duration(milliseconds: 50),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceOut,
    );
  }
  gotoMain() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      3,
      duration: const Duration(milliseconds: 50),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
//      child: new GestureDetector(
//        onHorizontalDragStart: _onHorizontalDragStart,
//        onHorizontalDragUpdate: _onHorizontalDragUpdate,
//        onHorizontalDragEnd: _onHorizontalDragEnd,
//        behavior: HitTestBehavior.translucent,
//        child: Stack(
//          children: <Widget>[
//            new FractionalTranslation(
//              translation: Offset(-1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: SignupPage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(0 - (scrollPercent / (1 / numCards)), 0.0),
//              child: HomePage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: LoginPage(),
//            ),
//          ],
//        ),
//      ),
        child: PageView(
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[LoginPage(),GridViewPage(),HomePage(),SignupPage(),GridViewPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}