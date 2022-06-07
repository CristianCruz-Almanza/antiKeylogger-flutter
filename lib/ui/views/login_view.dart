import 'package:antikeyloger_flutter/ui/colors/colors.dart';
import 'package:antikeyloger_flutter/ui/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_keyboard/flutter_secure_keyboard.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _keyboardController = SecureKeyboardController();

  final _passwordEditor = TextEditingController();
  final _passwordTextFieldFocusNode = FocusNode();

  final _pinCodeEditor = TextEditingController();
  final _pinCodeTextFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return WithSecureKeyboard(
      controller: _keyboardController,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: blue,
            ),
            const TopSginin(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteshade,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/logo.png"),
                    ),
                    InputField(headerText: "Username", hintTexti: "Username"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: grayshade.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _passwordEditor,
                        focusNode: _passwordTextFieldFocusNode,
                        enableInteractiveSelection: false,
                        obscureText: true,
                        onTap: () {
                          _keyboardController.show(
                              type: SecureKeyboardType.ALPHA_NUMERIC,
                              focusNode: _passwordTextFieldFocusNode,
                              initText: _passwordEditor.text,
                              hintText: 'passowrd',
                              onCharCodesChanged: (List<int> charCodes) {
                                _passwordEditor.text =
                                    String.fromCharCodes(charCodes);
                              });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CheckerBox(),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: blue.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        debugPrint("Sign up click");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: whiteshade),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.149,
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: Text.rich(
                        TextSpan(
                            text: "Don't already Have an account? ",
                            style: TextStyle(
                                color: grayshade.withOpacity(0.8),
                                fontSize: 16),
                            children: [
                              TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(color: blue, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterView()));
                                      debugPrint("Sign Up click");
                                    }),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: blue,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  // ignore: avoid_print
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "Remember me",
              style: TextStyle(color: grayshade.withOpacity(0.8), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              // border: Border.all(
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}

// ignore: must_be_immutable
class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: grayshade.withOpacity(0.5),
            // border: Border.all(
            //   width: 1,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              obscureText: _visible,
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSginin extends StatelessWidget {
  const TopSginin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 40,
            ),
            color: whiteshade,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterView()));
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Sign In",
            style: TextStyle(color: whiteshade, fontSize: 25),
          )
        ],
      ),
    );
  }
}
