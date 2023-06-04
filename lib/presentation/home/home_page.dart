// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/auth/widgets/authentication_page.dart';
import 'package:pcet_placements/presentation/description/views/description_view.dart';
import 'package:pcet_placements/presentation/listing/listing_page.dart';

import 'package:pcet_placements/presentation/theme/app_colors.dart';
import 'package:pcet_placements/presentation/user/views/user_view.dart';

import 'widgets/company_details_card.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/title_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
          // AppBar
          appBar: PreferredSize(
            preferredSize: Size(
              width,
              70,
            ),
            child: Builder(builder: (context) {
              return HomeAppBar(
                title: "Home",
                icon: Icons.menu,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                barColor: const Color(0xFFC5C9C3),
              );
            }),
          ),
          // Body which shows the three statuses, in progress, already applied, finished.
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 16,
                // ),
                // In Progress
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    color: AppColors.alto,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TitleBarWidget(
                            title: 'In Progress',
                            barColor: AppColors.casablanca,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListingPage(
                                    title: 'In Progress',
                                    barColor: AppColors.casablanca,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 225,
                              ),
                              itemBuilder: (context, index) {
                                return CompanyDetailsCard(
                                  title: 'Company Name',
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur dipiscing lit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const DescriptionPage(),
                                      ),
                                    );
                                  },
                                  buttonColor: AppColors.casablanca,
                                  buttonText: 'Check Eligibility',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Already Applied
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    color: AppColors.alto,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TitleBarWidget(
                            title: 'Already Applied',
                            barColor: AppColors.froly,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListingPage(
                                    title: 'Already Applied',
                                    barColor: AppColors.froly,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 225,
                              ),
                              itemBuilder: (context, index) {
                                return CompanyDetailsCard(
                                  title: 'Company Name',
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur dipiscing lit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  onTap: () {},
                                  buttonColor: AppColors.froly,
                                  buttonText: 'Track',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Finised
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    color: AppColors.alto,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TitleBarWidget(
                            title: 'Finished',
                            barColor: AppColors.feioja,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListingPage(
                                    title: 'Already Applied',
                                    barColor: AppColors.feioja,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 225,
                              ),
                              itemBuilder: (context, index) {
                                return CompanyDetailsCard(
                                  title: 'Company Name',
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur dipiscing lit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  onTap: () {},
                                  buttonColor: AppColors.feioja,
                                  buttonText: 'Not Selected',
                                );
                              },
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

          // Left side drawer
          drawer: Container(
            width: width * 0.7,
            height: height - 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
            child: Column(
              children: [
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                DrawerListItemWidget(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {},
                ),
                DrawerListItemWidget(
                  icon: Icons.notifications_active_rounded,
                  title: 'Notifications',
                  onTap: () {},
                ),
                DrawerListItemWidget(
                  icon: Icons.edit_document,
                  title: 'Applications',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListingPage(
                          title: 'Applications',
                          barColor: AppColors.feioja,
                        ),
                      ),
                    );
                  },
                ),
                DrawerListItemWidget(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
                DrawerListItemWidget(
                  icon: Icons.exit_to_app,
                  title: 'Exit',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AuthenticationPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class DrawerListItemWidget extends StatelessWidget {
  const DrawerListItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: AppColors.alto,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 30,
              color: const Color(0xFF070707),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF070707),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFA9A9A9),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
