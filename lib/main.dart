import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/reusable_code/constants.dart';
import 'package:signup_login/reusable_code/custom_button.dart';
import 'package:signup_login/sign_up.dart';

void main() {
  runApp(const MaterialApp(
    title: "My Page",
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                    radius: 50),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff7339ac),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LibreBarnesville'
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // contentPadding: EdgeInsets.only(top:10),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xff7339ac),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff7339ac),
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color(0xff7339ac),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Username";
                    } else if (!RegExp(r'^[a-zA-z]+$').hasMatch(value)) {
                      return "Not Valid Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Color(0xff7339ac),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xff7339ac),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff7339ac),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    } else {
                      if (value.length < 6) {
                        return "Minimum 6 length is Required";
                      } else {
                        return null;
                      }
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPageWidget(),
                        ),
                      );
                    }
                  },
                  name: 'Get Started',
                  style: elevatedButtonStyle.copyWith(
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const Center(
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7339ac),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      child: Image(
                        image: AssetImage(
                          'asset/images/google.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      child: Image(
                        image: AssetImage(
                          'asset/images/apple.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      child: Image(
                        image: AssetImage(
                          'asset/images/facebook.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPageWidget(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(color: Color(0xff7339ac), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
