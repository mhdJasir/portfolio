import 'package:flutter/material.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/constants.dart';
import 'package:portfolio/helpers/extensions/context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.h * 60,
              width: double.infinity,
              color: AppColors.primaryColor,
              padding:
                  EdgeInsets.symmetric(horizontal: context.toPlatformSize(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jasir",
                            style: context.largeText?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          sbh(10),
                          SizedBox(
                            width: context.w * 80,
                            child: Text(
                              Constants.objective,
                              style: context.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sbh(20),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   "Projects",
                   style: context.titleMedium?.copyWith(
                     fontWeight: FontWeight.w500,
                     color: Colors.white,
                   ),
                 ),
                 sbh(20),
                 Container(
                   height: 200,
                   width: context.w * 90,
                   color: AppColors.tileBg,
                 ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}
