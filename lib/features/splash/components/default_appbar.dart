import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/assets.dart';
import 'package:flutter_application_1/core/constants/colors.dart';

class DefaultAppbar extends StatelessWidget {
  const DefaultAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: MediaQuery.of(context).size.height*0.17,

      padding: EdgeInsets.symmetric(vertical: 20,
        horizontal: 30,
      ),
      color: AppColors.barcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: AppColors.secondcolor,
            ),
            child: Icon(Icons.menu,color: AppColors.whitecolor,
              size: 40,
            ),
          )),

          Spacer(),
          Image.asset(Images.logomain,color: AppColors.secondcolor,)
        ],
      ),
    )
    ;
  }
}
