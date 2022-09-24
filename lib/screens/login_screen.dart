import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:project/components/applocal.dart';
import 'package:project/models/api_response.dart';
import 'package:project/models/helperWidgets.dart';
import 'package:project/screens/sign_up.dart';
import 'package:project/models/constants.dart';
import 'package:project/services/user_service.dart';
class login_screen extends StatefulWidget {


  @override
  State<login_screen> createState() => _login_screenState();


}

class _login_screenState extends State<login_screen> {
     var formkey = GlobalKey<FormState>();
     
  

  var emilcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();

  bool isPasswordShow = true;
bool loading=false;
 void _loginUser() async{
   ApiResponse response=await login(emilcontroler.text,passwordcontroler.text);
  if(response.error!=null)
  {
    setState(() {
      loading=!loading;
    });
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${getLang(context, 'Login')}'
        ),
       
      ),
      body: Form(
        key:formkey,
        child: SafeArea(
          child: ListView(
                        padding: EdgeInsets.all(13.0),

            children: [
            TextFormField(
                controller: emilcontroler,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (va) {
                  print(va);
                },
                onChanged: (String value) {
                  print(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'emil address must not be embty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: '${getLang(context, 'Email')}',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    hintText: 'Enter Your Emil Address',
                    border: OutlineInputBorder())),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: passwordcontroler,
              onFieldSubmitted: (va) {
                print(va);
              },
              onChanged: (String value) {
                print(value);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'password must not be empty';
                }
                return null;
              },
              // keyboardType: TextInputType.phone,
              obscureText: isPasswordShow,
              decoration: InputDecoration(
                  labelText: '${getLang(context, 'password')}',
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                    icon: Icon(
                      isPasswordShow
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  hintText: 'Enter Your Password',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30.0,
            ),
            loading? Center(child: CircularProgressIndicator(),):
            defaultbutton(
              width: 100.0,
              onPressed: (){if (!formkey.currentState!.validate()) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${getLang(context, 'SomeThingWentWrongTryAgain')}')));
                      } else {
                        setState(() {
                          loading=!loading;
                          _loginUser();
                        });
                        // Navigator.pop(context);
                      }},
              radius: 20.0,
              text: '${getLang(context, 'Login')}',
              background: Colors.orange, 
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${getLang(context, "Alreadyhaveanaccount")}"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => sign_up(),
                        ),
                      );
                    },

                    child: Text('${getLang(context, "SingIn")}',style: TextStyle(color:Colors.deepOrange[900]),)),
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
