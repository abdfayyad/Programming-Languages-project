import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/components/applocal.dart';
import 'package:project/models/api_response.dart';
import 'package:project/models/helperWidgets.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/services/user_service.dart';

class sign_up extends StatefulWidget {
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  var formkey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
bool loading=false;
  bool showPass = true;
  bool showConfirmPass = true;


void _registerUser()async{
  ApiResponse response=await register(userNameController.text, emailAddressController.text, phoneNumberController.text, passwordController.text);
if(response.error!=null){
  setState(() {
    loading=!loading;
  });
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong, try again'),));
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${getLang(context,"SingIn")}'),
      ),
      body: Form(
        key: formkey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(13.0),
            children: [
              TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (va) {
                    print(va);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter User Name Please';
                    }
                    return null;
                  },
                  decoration:  InputDecoration(
                      labelText: '${getLang(context, 'Username')}',
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: 'Enter User Name',
                      border: OutlineInputBorder())),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  controller: emailAddressController,
                keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (va) {
                    print(va);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Email Please';
                    }
                    return null;
                  },
                  decoration:  InputDecoration(
                      labelText: '${getLang(context, 'Email')}',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      hintText: 'Enter Email Address',
                      border: OutlineInputBorder())),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (va) {
                    print(va);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Phone Number Please';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: '${getLang(context, 'phoneNumber')}',
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder())),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
                onFieldSubmitted: (va) {
                  print(va);
                },
                onChanged: (String value) {
                  print(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password Please';
                  }
                  return null;
                },
                obscureText: showPass,
                decoration: InputDecoration(
                    labelText: '${getLang(context, 'password')}',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                        showPass ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: 'Enter Password',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: rePasswordController,
                obscureText: showConfirmPass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(!showConfirmPass
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          showConfirmPass = !showConfirmPass;
                        });
                      },
                    ),
                    hintText: '${getLang(context, 'Confirmpassword')}'),
                onChanged: (String value) {},
                validator: (value) {
                  return ((value!.isEmpty) ||
                          (rePasswordController.text !=
                              passwordController.text))
                      ? 'not same password'
                      : null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              defaultbutton(
                width: 100.0,       
                onPressed: () {
                  if (!formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${getLang(context, 'something went wrong. try again')}')));
                  } else {
             loading=!loading;
             _registerUser();

                  }
                },
                radius: 20.0,
                text: '${getLang(context, 'SingIn')}',
                background: Colors.orange,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('${getLang(context, 'Alreadyhaveanaccount')}'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_screen(),
                        ),
                      );
                    },
                    child: Text(
                      '${getLang(context, 'Login')}',
                      style: TextStyle(color: Colors.deepOrange[900]),
                    ))
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                      ),
                      onPressed: () {}),
                  const SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                      ),
                      onPressed: () {}),
                  const SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

