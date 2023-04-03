import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/landing_cubit.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/app_icons.dart';
import 'package:portfolio/helpers/constants.dart';
import 'package:portfolio/helpers/launch_url.dart';
import 'package:portfolio/model/experience_model.dart';
import 'package:portfolio/widgets/dot_indicator_widget.dart';
import 'package:portfolio/widgets/loader_animation.dart';

class WebHome extends StatelessWidget {
  WebHome({Key? key}) : super(key: key);
  late TextTheme theme;
  LandingCubit bloc = LandingCubit();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).textTheme;
    bloc = BlocProvider.of<LandingCubit>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sbh(20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.logo_dev,
                  color: AppColors().neonColor,
                ),
                Row(
                  children: [
                    _topNavigator(1, "About"),
                    _topNavigator(2, "Experience"),
                    _topNavigator(3, "Work"),
                    _topNavigator(4, "Contact"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sbh(100),
                    Text(
                      "Hii, My name is ",
                      style: theme.titleMedium
                          ?.copyWith(color: AppColors().neonColor),
                    ),
                    sbh(20),
                    TextAnimation(
                      word: "Muhammed",
                      style: theme.titleLarge
                              ?.copyWith(color: Colors.white, fontSize: 35) ??
                          const TextStyle(),
                    ),
                    TextAnimation(
                      word: "Jasir.",
                      style: theme.titleLarge
                              ?.copyWith(color: Colors.white, fontSize: 35) ??
                          const TextStyle(),
                    ),
                    sbh(20),
                    Text(
                      Constants.tagLine,
                      style: theme.titleLarge
                          ?.copyWith(color: Colors.white.withOpacity(0.5)),
                    ),
                    sbh(20),
                    LayoutBuilder(builder: (context, cons) {
                      return SizedBox(
                        width: cons.maxWidth * 0.4,
                        child: Text(
                          Constants.shortDescription,
                          style: theme.bodySmall,
                        ),
                      );
                    }),
                    sbh(50),
                    _titleWidget(bloc.aboutMeKey, 1, 'About Me'),
                    sbh(50),
                    Text(
                      Constants.aboutMe,
                      style: theme.bodyLarge?.copyWith(
                        color: AppColors().textLight,
                      ),
                    ),
                    sbh(50),
                    Text(
                      'Here are some technologies im working with recently',
                      style: theme.bodyLarge?.copyWith(
                        color: AppColors().textColor,
                      ),
                    ),
                    sbh(20),
                    Wrap(
                      runSpacing: 20,
                      spacing: 50,
                      children: Constants.tech
                          .map(
                            (e) => Text(
                              e,
                              style: theme.titleMedium
                                  ?.copyWith(color: AppColors().neonColor),
                            ),
                          )
                          .toList(),
                    ),
                    sbh(30),
                    _titleWidget(bloc.experienceKey, 2, "Experience"),
                    sbh(20),
                    experienceWidget(),
                    sbh(30),
                    _titleWidget(bloc.workKey, 3, "Works"),
                    sbh(20),
                    const Text(
                        "Some of the screenshots of my works are shared below"),
                    sbh(20),
                    BlocBuilder<LandingCubit, LandingState>(
                        builder: (c, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            items: AppIcons()
                                .workScreenShots
                                .map(
                                  (e) => Image.asset(e, fit: BoxFit.cover),
                                )
                                .toList(),
                            options: CarouselOptions(
                              initialPage: state.currentPage!,
                              onPageChanged: (int i, _) => bloc.onPageChange(i),
                              aspectRatio: 3,
                              autoPlay: true,
                              pageSnapping: true,
                            ),
                          ),
                          sbh(20),
                          DotIndicator(
                            currentIndex: state.currentPage!,
                            length: AppIcons().workScreenShots.length,
                          ),
                        ],
                      );
                    }),
                    sbh(30),
                    _titleWidget(bloc.contactKey, 4, "Contact"),
                    sbh(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget experienceWidget() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Constants.experience.length,
      separatorBuilder: (c, i) => sbh(20),
      itemBuilder: (c, i) {
        ExperienceModel model = Constants.experience[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title ?? '',
              style: theme.titleMedium
                  ?.copyWith(color: AppColors().neonColor, fontSize: 18),
            ),
            sbh(15),
            Text(model.date ?? '', style: theme.bodySmall),
            sbh(15),
            Visibility(
              visible: model.link != null,
              child: InkWell(
                onTap: () {
                  LaunchUrl.launch(model.link!);
                },
                child: Text(
                  model.link ?? '',
                  style: theme.bodySmall?.copyWith(color: Colors.blue),
                ),
              ),
            ),
            sbh(15),
            Text(
              model.description ?? '',
              style: theme.bodySmall?.copyWith(
                color: AppColors().textColor,
              ),
            ),
            sbh(15),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: AppColors().neonColor,
                ),
                sbw(20),
                Flexible(
                  child: Text(
                    model.techs?.first ?? '',
                    style: theme.titleMedium
                        ?.copyWith(color: AppColors().neonColor),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _titleWidget(Key key, int i, title) {
    return Row(
      key: key,
      children: [
        Text(
          '0$i.',
          style: theme.bodyLarge?.copyWith(color: AppColors().neonColor),
        ),
        sbw(10),
        Text(
          title,
          style: theme.bodyLarge?.copyWith(color: AppColors().textColor),
        ),
      ],
    );
  }

  Widget _topNavigator(int index, title) {
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              '0$index',
              style: theme.titleSmall?.copyWith(color: AppColors().neonColor),
            ),
            sbw(10),
            InkWell(
              onHover: (bool hover) {
                print(hover);
                if (hover) {
                  bloc.onHover(index);
                } else {
                  bloc.onHover(null);
                }
              },
              child: Text(
                '$title',
                style: theme.titleSmall?.copyWith(
                  color: state.hoverIndex == index
                      ? AppColors().neonColor
                      : AppColors().textColor,
                ),
              ),
            ),
            sbw(10),
          ],
        );
      },
    );
  }
}
