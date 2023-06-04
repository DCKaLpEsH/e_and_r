// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pcet_placements/presentation/theme/app_colors.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DescriptionView();
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.alto,
              ),
              color: AppColors.mercury,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ]),
          child: Column(
            children: [
              const DescriptionAppBar(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                          color: AppColors.casablanca,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Raja Software Labs',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFCFC),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'You Are Eligible for this Drive',
                                    style: TextStyle(
                                      color: AppColors.cornflowerBlue,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: AppColors.cornflowerBlue,
                                  ),
                                ],
                              ),
                              const DescriptionPointWidget(
                                title: 'Job Description',
                                subtitle: 'Lorem ipsum dolor sit amet, '
                                    'consectetur adipiscing elit, '
                                    'sed do  tempor incididunt ut '
                                    'labore et dolore magna aliqua. '
                                    'Lorem ipsum dolor sit amet, '
                                    'consectetur adipiscing elit, '
                                    'sed do eiusmod tempor ut labore '
                                    'et dolore magna aliqua.',
                              ),
                              const DescriptionPointWidget(
                                title: 'Eligibility Criteria ',
                                subtitle: 'Lorem ipsum dolor sit amet, '
                                    'consectetur adipiscing elit, '
                                    'sed do  tempor incididunt ut ',
                              ),
                              const DescriptionPointWidget(
                                title: 'Salary Details',
                                subtitle: '\u2022 Lorem ipsum dolor sit amet,\n'
                                    '\u2022 Consectetur adipiscing elit,\n'
                                    '\u2022 Sed do  tempor incididunt ut\n'
                                    '\u2022 Labore et dolore magna aliqua.\n',
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: AppColors.feioja,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                    ),
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: AppColors.alto,
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionPointWidget extends StatelessWidget {
  const DescriptionPointWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: '\u2022 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class DescriptionAppBar extends StatelessWidget {
  const DescriptionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.descriptionGradient,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const Text(
            'Application Form',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
