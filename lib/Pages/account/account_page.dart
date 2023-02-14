import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/account_widget.dart';
import 'package:ecart/widgets/app_icon.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          color: Colors.white,
          text: "Profile",
          size: 24,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(children: [
          AppIcon(
            icon: Icons.person,
            BackGroundcolor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height45 + Dimensions.height15,
            size: Dimensions.height15 * 10,
          ),
          SizedBox(height: Dimensions.height20),
          // name
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        BackGroundcolor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Aditya")),
                  SizedBox(height: Dimensions.height20),
                  //phone
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        BackGroundcolor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "+918791585856")),
                  SizedBox(height: Dimensions.height20),
                  //email
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        BackGroundcolor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Aditya")),
                  SizedBox(height: Dimensions.height20),
                  //address
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        BackGroundcolor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "fill the address")),
                  SizedBox(height: Dimensions.height20),
                  //message
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        BackGroundcolor: Colors.orange,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Aditya")),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
