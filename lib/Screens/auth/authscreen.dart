import 'package:amazon_clone/Screens/auth/loginscreen.dart';
import 'package:flutter/material.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq=MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
                child: Image.asset('images/images.png', height: mq.height*.07)),
            const SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(mq.width*.7, mq.height*.05),
                shape: StadiumBorder()
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginSignUpPage(true)));
              },
              child: Text(
                    'Sign UP',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),

            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(mq.width*.7, mq.height*.05),
                  shape: StadiumBorder()
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginSignUpPage(false)));
                // Implement login functionality
              },
              child:  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18.0),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
