import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/authMethods.dart';
import 'package:nust_conference/Models/textField.dart';
import 'package:nust_conference/provider/loggedInProvider.dart';
import 'package:provider/provider.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

final TextEditingController email = TextEditingController();
final TextEditingController pass = TextEditingController();

class _DialogWidgetState extends State<DialogWidget> {
  // String to show error message if admin login fails
  String loginResponse = "";

  // Bool to show or hide Circular Progress Indicator
  bool isLoading = false;

  // METHOD TO LOGIN ADMIN
  loginAdmin() async {
    try {
      if (email.text.isNotEmpty || pass.text.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        String res = await AuthMethods()
            .loginUser(email: email.text, password: pass.text);
        print(res);
        if (res == "Success!") {
          email.text = "";
          pass.text = "";
          Provider.of<AdminProvider>(context, listen: false).isLoggedIn = true;
          if (!mounted) return;
          setState(() {
            isLoading = false;
          });
          Navigator.pop(context);

          Navigator.pushNamed(context, '/programme');
        } else {
          setState(() {
            loginResponse = "Login Failed!";
            isLoading = false;
          });
        }
      } else {
        setState(() {
          loginResponse = "Please fill all the fields!";
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: 80,
                        width: 70,
                        child: Image.asset("assets/nust.png")),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Admin Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Text(
                  loginResponse,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  textEditingController: email,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
            backgroundColor: Colors.white,
            elevation: 24,
            content: TextFieldInput(
              textEditingController: pass,
              hintText: 'Password',
              textInputType: TextInputType.text,
              isPassword: true,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    email.text = '';
                    pass.text = '';
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    loginAdmin();
                  },
                  child: const Text("Login")),
            ],
          );
  }
}
