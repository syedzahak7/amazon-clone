import 'package:amazon_clone/Screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage(this.haveacount);
 final bool haveacount;
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
    });
  }
  //bool _ishaveacount=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                  child: Image.asset('images/images.png', height: 80.0)),
              const SizedBox(height: 40.0),
              if(widget.haveacount)
              TextField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                  //prefixIcon: Icon(CupertinoIcons.textformat),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              if(widget.haveacount)
              TextField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  //prefixIcon: Icon(CupertinoIcons.textformat),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                onChanged: (_) => _validatePasswords(),
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              if(widget.haveacount)
              TextField(
                controller: _confirmPasswordController,
                onChanged: (_) => _validatePasswords(),
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorText:
                  !_passwordsMatch ? 'Passwords do not match' : null,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
                },
                // color: Colors.blue,
                // textColor: Colors.white,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    widget.haveacount?'SIGN UP':'LOGIN',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // setState(() {
                  //   widget.haveacount!=!widget.haveacount;
                  // });
                  // Navigate to sign up page
                },
                child: Text(
                  widget.haveacount?'already have an account':'Create an account',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
