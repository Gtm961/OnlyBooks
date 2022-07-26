import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'package:onlybook/home.dart';
import 'package:onlybook/services/authservice.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({Key? key}) : super(key: key);

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  var firstName, lastName, branch, sem, phNum;
  String dropdownValueBranch = 'CS';
  String dropdownValueSem = '1';
  final Map userDetails = {};
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
                'Enter Your Details',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Fields(context, userDetails, firstName, "First Name", "s"),
            const SizedBox(height: defaultPadding / 2),
            Fields(context, userDetails, lastName, "Last Name", "s"),
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Choose Your Branch:',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: defaultPadding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: MediaQuery.of(context).size.width * 0.83,
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueBranch,
                // icon: const Icon(Icons.arrow_circle_down),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueBranch = newValue!;
                  });
                },
                items: <String>['CS', 'EC', 'EE', 'EB', 'ME']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Choose Your Semester:',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: defaultPadding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: MediaQuery.of(context).size.width * 0.83,
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueSem,
                // icon: const Icon(Icons.arrow_circle_down),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueSem = newValue!;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ),
            // Fields(context,branch,"First Name"),
            // Fields(context,sem,"First Name"),
            const SizedBox(height: defaultPadding / 2),
            Fields(context, userDetails, phNum, "Phone Number", "n"),
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
                  // AuthService().addUser(name, password).then((val) {
                  //   print(name);
                  //   print(password);
                  //   print("Success");
                  // });

                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return Navig();
                    }),
                  );
                },

                child: Text(
                  "Submit".toUpperCase(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget Fields(BuildContext context, Map userDetails, var detail,
    String hintText, var type) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.83,
    child: TextFormField(
      keyboardType: type == "s" ? TextInputType.name : TextInputType.phone,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (detail) {},
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14),
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: type == "s" ? Icon(Icons.person) : Icon(Icons.phone),
        ),
      ),
      onChanged: (val) {
        userDetails[detail] = val;
      },
    ),
  );
}

// Widget ChangeBranch(BuildContext context,Map userDetails) {
   
//   return 
// }

