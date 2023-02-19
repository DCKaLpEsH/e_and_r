import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/auth/widgets/auth_text_field.dart';
import 'package:pcet_placements/presentation/home/home_page.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  bool isUsernameValid = true;
  bool isPasswordValid = true;
  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  // This method checks if the entered username is an email id, which contains an @ sign, a .com, etc.
  void usernameValid(String value) {
    debugPrint(value);
    // Here RegExp stands for Regular Expression which has a pattern and it checks if the given value matches that pattern or not.
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    // If the pattern matches, we set the isUsernameValid value to true
    if (emailValid) {
      isUsernameValid = true;
    } else {
      // If the pattern matches, we set the isUsernameValid value to "False"
      isUsernameValid = false;
    }
    debugPrint(isUsernameValid.toString());
    // setState((){}) causes the rebuild which show the invalid username text on screen.
    setState(() {});
  }

  // This is the same as username, here we pass the password, which checks if the entered value contains a capital letter, small letters, a special character and a number.
  void passwordValid(String value) {
    debugPrint(value);
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty || !regex.hasMatch(value)) {
      isPasswordValid = false;
    } else {
      isPasswordValid = true;
    }
    debugPrint(isPasswordValid.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Used MediaQuery.of(context) to get the device and screen dimensions
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      // Wrapped column with center to center the widget horizontally on screen.
      body: Center(
        // Used Column to align widgets in a top-down fashion
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log In',
              style: TextStyle(
                fontSize: 35,
                color: AppColors.casablanca,
                fontWeight: FontWeight.bold,
                // Gave a small shadow to show the Log In text a bit lifted from the screen
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Used sizedbox to give specific width to the card widget.
            // You can add height and change it to see it's effect.

            SizedBox(
              // Here the width given will be 70% of overall width of the screen.
              width: width * 0.8,
              child: Card(
                // Gave elevation as 5 to increase shadow below the card.
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "USERNAME",
                        style: TextStyle(
                          color: AppColors.alto,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      // Created a Reusable Widget of the TextField since the same is being used for password too.
                      // Passed the TextEditingController here to get text of individual textfield and verify whether the user is valid or not.
                      // _usernameController is used to get text written inside of Username textfield.
                      AuthenticationTextField(
                        controller: _usernameController,
                      ),
                      // Here the Enter Valid Username text is displayed only when the isUsernameValid value if false, which is checked at the function above.
                      if (!isUsernameValid)
                        const Text(
                          ' Enter Valid Username',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      // SizedBox given to add empty space between elements.
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "PASSWORD",
                        style: TextStyle(
                          color: AppColors.alto,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          // Letter spacing is the space between individual characters like, when no letterSpacing, it will show PASSWORD but now since it's given. it will have a little space between each character like this - P A S S W O R D
                          letterSpacing: 1.2,
                        ),
                      ),
                      // _passwordController is used to get text written inside of Password textfield.
                      AuthenticationTextField(
                        controller: _passwordController,
                      ),
                      // Here the Enter Valid Password text is displayed only when the isUsernameValid value if false, which is checked at the function above.
                      if (!isPasswordValid)
                        const Text(
                          ' Enter Valid Password',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              // Here we call the methods to check both the username and password, whether it is correct or not.
                              usernameValid(_usernameController.text);
                              passwordValid(_passwordController.text);
                              // If both, username and password are correct, we navigate to the next page.
                              if (isUsernameValid && isPasswordValid) {
                                // User is taken to HomePage after pressing on the button.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              // Padding increases the space inside the button. You can make it zero and see what happens.
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              // Giving StadiumBorder() makes the button rouded on both sides.
                              shape: const StadiumBorder(),
                              foregroundColor: AppColors.casablanca,
                              backgroundColor: AppColors.casablanca,
                            ),
                            child: const Text(
                              'Verify',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
