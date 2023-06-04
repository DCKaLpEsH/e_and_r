// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/home/widgets/company_details_card.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({
    Key? key,
    required this.title,
    required this.barColor,
  }) : super(key: key);
  final String title;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size(
        //     width,
        //     80,
        //   ),
        //   child: HomeAppBar(
        //     title: title,
        //     icon: Icons.arrow_back,
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     barColor: barColor,
        //     textColor: Colors.white,
        //   ),
        // ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.alto.withOpacity(0.4),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                width: double.maxFinite,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
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
                        buttonColor: barColor,
                        buttonText: 'Apply',
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
