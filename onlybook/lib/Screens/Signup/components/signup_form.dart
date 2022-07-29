import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/Screens/details.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'package:onlybook/home.dart';
import 'package:onlybook/services/authservice.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var name, password, token;
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        height: ht * 0.5,
        width: wt * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ht * 0.1,
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 1),
            //   child: Text('Create an Account',style: GoogleFonts.poppins(color: Colors.black,fontSize:24,fontWeight: FontWeight.w700),),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Create an Account',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Lets Get Started',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: ht * 0.05,
            ),
            Container(
              width: wt * 0.83,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Email cannot be empty' : null,
                onChanged: (val) {
                  name = val;
                },
              ),
            ),
            Container(
              width: wt * 0.83,
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
                validator: (value) =>
                    value!.length < 6 ? 'Password too short' : null,
                onChanged: (val) {
                  password = val;
                },
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Container(
              width: wt * 0.83,
              child: ElevatedButton(
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     CupertinoPageRoute(builder: (context) => Navig()),
                //   );
                //},
                onPressed: () {
                  AuthService().addUser(name, password).then((val) {
                    print(name);
                    print(password);
                    print("Success");
                  });

                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return DetailsPage();
                    }),
                  );
                },

                child: Text(
                  "Sign Up".toUpperCase(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
