import 'package:carrier/presentation/user/user_view_model.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<UserViewModel>().getUser().then((user) {
      setState(() {
        _userNameController.text = user.phoneNumber!;
        _passwordController.text = user.password!;
      });
    });

    _userNameController.addListener(() {
      context.read<UserViewModel>().checkUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      context.read<UserViewModel>().checkPassword(_passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "易键达",
                  style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: const InputDecoration(
                    hintText: "请输入手机号",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller: _userNameController,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 16,
                  controller: _passwordController,
                  cursorColor: Theme.of(context).accentColor,
                  obscureText: context.select(
                      (UserViewModel viewModel) => !viewModel.showPassword),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "请输入6-16位密码，区分大小写",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<UserViewModel>().updateShowPassword();
                      },
                      icon: Icon(context.select((UserViewModel viewModel) =>
                          viewModel.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                  ),
                  validator: (String? value) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: context.select(((UserViewModel viewModel) =>
                                viewModel.savePassword)),
                            onChanged: (bool? newValue) {
                              if (newValue == null) {
                                context
                                    .read<UserViewModel>()
                                    .updateSavePassword(false);
                              } else {
                                context
                                    .read<UserViewModel>()
                                    .updateSavePassword(newValue);
                              }
                            }),
                        Text("记住密码"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Constants.changePasswordPage);
                      },
                      child: Text("忘记密码"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Padding(
                          child: Text("登录"),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: _login,
                        /*onPressed: () => context.read<UserViewModel>().login(
                            _userNameController.text, _passwordController.text)*/
                        /*context.select(
                          ((UserViewModel viewModel) => viewModel.isValid
                              ? () => viewModel.login(_userNameController.text,
                                  _passwordController.text)
                              : null),
                        )*/
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

  _setLoadingIndicator(bool isActive) {
    if (isActive) {
      showDialog(
          context: this.context,
          barrierDismissible: true,
          builder: (context) {
            return SimpleDialog(
              contentPadding: EdgeInsets.only(top: 32.0, bottom: 32.0),
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text("正在登录中..."),
                    )
                  ],
                )
              ],
            );
          });
    } else {
      Navigator.of(context).pop();
    }
  }

  _login() {
    context
        .read<UserViewModel>()
        .login(_userNameController.text, _passwordController.text)
        .then((result) {
      if (result) {
        Navigator.pushReplacementNamed(context, Constants.homePage);
        debugPrint("login successful");
      } else {
        debugPrint("login failed");
      }
    }).catchError((error) {
      debugPrint("login error $error");
    });
  }
}
