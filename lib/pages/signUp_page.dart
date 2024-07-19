
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes_app/models/user_model.dart';
import 'package:recipes_app/pages/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailNameEditingController = new TextEditingController();
  final passwordNameEditingController = new TextEditingController();
  final confirmPasswordNameEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

//firstNameField
    final firsrNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return("First name cannot be empty");
        }
        if(!regex.hasMatch(value)) {
          return ("Please enter valid name(Min. 3 Character");
        }
        return null;
      },

      onChanged:(value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//secondNameField
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if(value!.isEmpty){
          return("Second name cannot be a empty");
        }
        return null;
      },

      onChanged:(value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Second name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//emailField
    final emailField = TextFormField(
      autofocus: false,
      controller: emailNameEditingController,
      keyboardType: TextInputType.name,
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
        emailNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//passwordField
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordNameEditingController,
      keyboardType: TextInputType.emailAddress,
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
        passwordNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//ConfirmPasswordField
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordNameEditingController,
      keyboardType: TextInputType.emailAddress,

      validator: (value) {
        if(confirmPasswordNameEditingController.text!=passwordNameEditingController.text) {
          return ("Password does't match");
        }
        return null;
      },

      onChanged:(value) {
        confirmPasswordNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


//SignUpButton
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(onPressed: () {
        signUp(emailNameEditingController.text, passwordNameEditingController.text);
      },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text('Sign up',textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,color: Colors.white,
              fontWeight: FontWeight.bold),),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 120,child:Text('Welcome to our Application\n              Please, Sign up',
                      style: TextStyle(fontSize: 22,color: Colors.redAccent,fontWeight: FontWeight.w500),)),
                    SizedBox(height: 25,),
                    firsrNameField,
                    SizedBox(height: 20,),
                    secondNameField,
                    SizedBox(height: 20,),
                    emailField,
                    SizedBox(height: 20,),
                    passwordField,
                    SizedBox(height: 20,),
                    confirmPasswordField,
                    SizedBox(height: 35,),

                    signUpButton,
                    SizedBox(height: 15,),
                  ],
                ),),
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      EasyLoading.show();
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
          postDetailsToFirestore(),
        }).catchError((e) {
          Fluttertoast.showToast(msg:e!.message);
        });
        EasyLoading.dismiss();
    }
  }
  postDetailsToFirestore() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :");

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context)=>HomePage()), (route) => false);
  }
}





















