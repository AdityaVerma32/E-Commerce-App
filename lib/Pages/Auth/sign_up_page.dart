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

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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

            //Name
            AppTextField(
              textController: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //Phone
            AppTextField(
              textController: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Container(
              width: Dimensions.screenWidth / 2.5,
              height: Dimensions.screenHeight / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  size: Dimensions.font20 + Dimensions.font20 / 4,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
                text: TextSpan(
                    // same as <a> tag in html - for converting statement to link
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Already have an Account?",
                    style: TextStyle(
                        color: Colors.grey[800], fontSize: Dimensions.font20))),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            // Sign Up options

            RichText(
                text: TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font16))),
            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: Dimensions.radius30,
                          backgroundImage: AssetImage(
                              "assets/Images/" + signUpImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
