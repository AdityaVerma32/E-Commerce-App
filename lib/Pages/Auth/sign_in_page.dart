import 'package:ecart/Pages/Auth/sign_up_page.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_text_field.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var PasswordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["Google-Icon.jpg", "Twitter-icon.png", "FB-icon.png"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), // Bounce at the edges
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/Images/AppIcon.png"),
                ),
              ),
            ),
            //Welcome

            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize:
                            Dimensions.font20 * 3 + Dimensions.font20 / 2),
                  ),
                  Text(
                    "Sign into your Account",
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //Email
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            // Password
            AppTextField(
              textController: PasswordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),

            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20))),
                SizedBox(
                  width: Dimensions.width20,
                )
              ],
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //Sign In
            Container(
              width: Dimensions.screenWidth / 2.5,
              height: Dimensions.screenHeight / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimensions.font20 + Dimensions.font20 / 4,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            // Sign Up options

            RichText(
                // benefits of using Richtext
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font20),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fade),
                      text: "Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackcolor,
                          fontSize: Dimensions.font20))
                ])),
          ],
        ),
      ),
    );
  }
}
