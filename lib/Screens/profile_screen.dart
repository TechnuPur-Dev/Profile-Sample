import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:profilescreen/utils/app_constants.dart';
import 'package:profilescreen/widgets/Header/header.dart';
import 'package:profilescreen/widgets/Header/header_profile_icon.dart';
import 'package:profilescreen/widgets/Header/header_share_icon.dart';
import 'package:profilescreen/widgets/ProfileScreen/age_slider.dart';
import 'package:profilescreen/widgets/ProfileScreen/empty_sliver_widget.dart';
import 'package:profilescreen/widgets/ProfileScreen/experience_list.dart';
import 'package:profilescreen/widgets/ProfileScreen/show_hide_view.dart';

import '../Controllers/controller_profile.dart';
import '../utils/colors.dart';
import '../widgets/Drawer/drawer.dart';
import '../widgets/ProfileScreen/banner_and_details.dart';
import '../widgets/ProfileScreen/container_review.dart';
import '../widgets/ProfileScreen/heading.dart';

import '../widgets/ProfileScreen/my_skills.dart';
import '../widgets/ProfileScreen/phone_email_stats.dart';
import '../widgets/sliver_padding_height.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List listReviews = [
    {
      "clientName": "Client Name",
      "date": DateTime.now(),
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel sagittis tortor. Duis volutpat justo ut velit varius, vivante auctor.",
      "reviewStart": 5.0
    },
    {
      "clientName": "Client Name",
      "date": DateTime.now(),
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel sagittis tortor. Duis volutpat justo ut velit varius, vivante auctor.",
      "reviewStart": 5.0
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final ControllerProfile cProfile = Get.put(ControllerProfile());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Header(
              title: "Profile",
              actions: [
                HeaderShareIcon(),
                const SizedBox(
                  width: 5,
                ),
                HeaderProfileIcon(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                )
              ],
            ),
            Expanded(
              child: CustomScrollView(controller: _scrollController, slivers: <
                  Widget>[
                //Profile Banner, Image, Name & Rating
                const BannerAndDetails(),

                const PhoneEmailState(),

                const Heading(
                  title: 'My Skills',
                ),

                MySkills(),
                const SliverPaddingHeight(),
                const Heading(
                  title: 'I Have',
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
                    child: Obx(() => Text(
                          cProfile.yearsExprence.toString() +
                              " years of experience",
                        )),
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
                  sliver: Obx(
                    () => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Row(
                            children: [
                              const Icon(Icons.check_box_rounded,
                                  color: Colors.green),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  cProfile.listHaveExperince[index].toString(),
                                  style: TextStyle(color: colorBodyText),
                                ),
                              )
                            ],
                          );
                        },
                        childCount: cProfile.listHaveExperince.length,
                      ),
                    ),
                  ),
                ),
                const SliverPaddingHeight(),
                const Heading(
                  title: "I don't",
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
                  sliver: Obx(
                    () => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Row(
                            children: [
                              const Icon(Icons.cancel_rounded,
                                  color: Colors.red),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  cProfile.listDontHaveExperince[index]
                                      .toString(),
                                  style: TextStyle(color: colorBodyText),
                                ),
                              )
                            ],
                          );
                        },
                        childCount: cProfile.listDontHaveExperince.length,
                      ),
                    ),
                  ),
                ),
                const SliverPaddingHeight(),
                Obx(
                  () => ShowHideView(
                    title: "Professional User",
                    onTap: () {
                      cProfile.setviewProfessional(
                          !cProfile.viewProfessional.value);

                      if (cProfile.viewProfessional.value) {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 400));
                      }
                    },
                    flag: cProfile.viewProfessional.value,
                  ),
                ),

                const SliverPaddingHeight(),

                AgeSlider(),
                ExperinceList(),
                Obx(() => (cProfile.viewProfessional.value)
                    ? const SliverPaddingHeight()
                    : const EmptySliverWidget()),
                Obx(
                  () => ShowHideView(
                    title: "Reviews",
                    onTap: () {
                      cProfile.setviewReviews(!cProfile.viewReviews.value);

                      if (cProfile.viewReviews.value) {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent + 150,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 400));
                      }
                    },
                    flag: cProfile.viewReviews.value,
                  ),
                ),

                Obx(
                  () => cProfile.viewReviews.value
                      ? SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppContanst.PADDING,
                              vertical: AppContanst.PADDING),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return ReviewDetails(
                                    review: listReviews[index],
                                    flag: (index == listReviews.length - 1)
                                        ? false
                                        : true);
                              },
                              childCount: listReviews.length,
                            ),
                          ),
                        )
                      : const EmptySliverWidget(),
                ),
                const SliverPaddingHeight(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              primary: colorWhite,
                              backgroundColor: colorPink),
                          onPressed: () {},
                          child: const Text(
                            "SUBMIT A REVIEW",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                SliverPadding(
                    padding: EdgeInsets.only(top: AppContanst.HEIGT * 3)),
              ]),
            ),
          ],
        ));
  }
}
