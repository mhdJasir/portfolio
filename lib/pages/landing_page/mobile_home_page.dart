import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/landing_cubit.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/app_icons.dart';
import 'package:portfolio/helpers/constants.dart';
import 'package:portfolio/helpers/launch_url.dart';
import 'package:portfolio/model/experience_model.dart';
import 'package:portfolio/widgets/dot_indicator_widget.dart';
import 'package:portfolio/widgets/focused_menu.dart';
import 'package:portfolio/widgets/loader_animation.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late TextTheme theme;

  LandingCubit bloc = LandingCubit();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).textTheme;
    bloc = BlocProvider.of<LandingCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {});
            return Future(() => false);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbh(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.logo_dev,
                      color: AppColors.neonColor,
                    ),
                    FocusedMenuHolder(
                      onPressed: () {},
                      animateMenuItems: true,
                      openWithTap: true,
                      menuItems: [
                        FocusedMenuItem(
                          title: Text(
                            "About",
                            style: theme.displaySmall?.copyWith(fontSize: 13),
                          ),
                          onPressed: () {
                            bloc.scrollToWidget(
                                bloc.aboutMeKey.currentContext ?? context);
                          },
                        ),
                        FocusedMenuItem(
                          title: Text(
                            "Experience",
                            style: theme.displaySmall?.copyWith(fontSize: 13),
                          ),
                          onPressed: () {
                            bloc.scrollToWidget(
                                bloc.experienceKey.currentContext ?? context);
                          },
                        ),
                        FocusedMenuItem(
                          title: Text(
                            "Work",
                            style: theme.displaySmall?.copyWith(fontSize: 13),
                          ),
                          onPressed: () {
                            bloc.scrollToWidget(
                                bloc.workKey.currentContext ?? context);
                          },
                        ),
                        FocusedMenuItem(
                          title: Text(
                            "Contact",
                            style: theme.displaySmall?.copyWith(fontSize: 13),
                          ),
                          onPressed: () {
                            bloc.scrollToWidget(
                                bloc.contactKey.currentContext ?? context);
                          },
                        ),
                      ],
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbh(80),
                        Text(
                          "Hii, My name is ",
                          style: theme.titleMedium
                              ?.copyWith(color: AppColors.neonColor),
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
                          style: theme.titleLarge?.copyWith(
                              color: Colors.white.withOpacity(0.5), fontSize: 28),
                        ),
                        sbh(20),
                        Text(
                          Constants.shortDescription,
                          style: theme.bodySmall,
                        ),
                        sbh(50),
                        _titleWidget(bloc.aboutMeKey, 1, 'About Me'),
                        sbh(50),
                        Text(
                          Constants.aboutMe,
                          style: theme.bodyLarge?.copyWith(
                            color: AppColors.textLight,
                          ),
                        ),
                        sbh(50),
                        Text(
                          'Here are some technologies im working with recently',
                          style: theme.bodyLarge?.copyWith(
                            color: AppColors.textColor,
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
                                      ?.copyWith(color: AppColors.neonColor),
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
                                  onPageChanged: (int i, _) =>
                                      bloc.onPageChange(i),
                                  aspectRatio: 0.7,
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
        ),
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
                  ?.copyWith(color: AppColors.neonColor, fontSize: 18),
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
                color: AppColors.textColor,
              ),
            ),
            sbh(15),
            Row(
              children: [
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: AppColors.neonColor,
                ),
                sbw(20),
                Flexible(
                  child: Text(
                    model.techs?.first ?? '',
                    style: theme.titleMedium
                        ?.copyWith(color: AppColors.neonColor),
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
          style: theme.bodyLarge?.copyWith(color: AppColors.neonColor),
        ),
        sbw(10),
        Text(
          title,
          style: theme.bodyLarge?.copyWith(color: AppColors.textColor),
        ),
      ],
    );
  }
}
