import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  GlobalKey<FormState> _formKey = GlobalKey();
  String _email ='', _password ='', _username ='';

  _submit(){
    final isOk = _formKey.currentState.validate();
    print('form isOk');
    if(isOk){

    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive. isTablet? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'USERNAME',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text){
                  _username = text;
                },
                validator: (text){
                  if(text.trim().length<5){
                    return 'Invalid username';
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'EMAIL ADDRESS',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text){
                  _email = text;
                },
                validator: (text){
                  if(!text.contains('@')){
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),

              InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'PASSWORD',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text){
                  _password = text;
                },
                validator: (text){
                  if(text.trim().length < 6){
                    return 'Invalid password';
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: this._submit,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.dp(10)),
            ],
          ),
        ),
      ),
    );
  }
}
