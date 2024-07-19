import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes_app/pages/home_page.dart';
import 'package:recipes_app/pages/signUp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      validator: (value) {
        if(value!.isEmpty){
          return ("Please enter your email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },

      onChanged:(value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("Password is required for login");
        }
        if(!regex.hasMatch(value)) {
          return ("Please enter vallid password(Min. 6 Character");
        }
      },

      onChanged:(value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(onPressed: () { signIn(emailController.text, passwordController.text);},
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      child: Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 220,width: 550,child: Image.asset(
                    'assets/images/cart2.png',fit: BoxFit.fitHeight,),),
                  SizedBox(height: 45,),
                  emailField,
                  SizedBox(height: 25,),
                  passwordField,
                  SizedBox(height: 35,),
                  loginButton,
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text('Dont have an account? '),
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text('Sign up',style: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                    ],
                  ),
                ],
              ),),
            ),
          ),
        ),
      ),
    );
  }
  void signIn(String email, String password) async {
    EasyLoading.show();
    if(_formKey.currentState!.validate()) {

      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid)=>{
        Fluttertoast.showToast(msg: 'Login successfull'),

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()

        ),
        ),
        EasyLoading.dismiss(),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}





















