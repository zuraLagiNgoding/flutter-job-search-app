import 'package:flutter/material.dart';
import 'package:job_search_app/app_styles.dart';
import 'package:job_search_app/size_config.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.position,
    required this.company,
    required this.companyImage,
    required this.status,
    required this.salary,
    required this.types,
    required this.onTap,
  });

  final String position;
  final String company;
  final String companyImage;
  final String status;
  final String salary;
  final List<String> types;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 113,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: kShadow.withValues(alpha: 0.05),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(companyImage),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              position,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kPoppinsSemibold.copyWith(
                                color: kBlack18,
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                            ),
                            Text(
                              company,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kPoppinsMedium.copyWith(
                                color: kBlack18,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                jobStatus(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 21,
                    child: ListView.builder(
                      itemCount: types.length >= 2 ? 2 : types.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kWhiteF5,
                          ),
                          child: Center(
                            child: Text(
                              types[index],
                              style: kPoppinsMedium.copyWith(
                                color: kBlack18,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  '$salary/yearly',
                  style: kPoppinsRegular.copyWith(
                    color: kBlack18,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget jobStatus() {
    switch (status) {
      case 'expired_soon':
        return Container(
          transform: Matrix4.translationValues(16, 0, 0),
          height: 20,
          color: kYellowExpires,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: SizeConfig.blockSizeHorizontal! * 3,
                color: kWhite,
              ),
              SizedBox(width: 4),
              Text(
                'Expired Soon',
                style: kPoppinsSemibold.copyWith(
                  color: kWhite,
                  fontSize: SizeConfig.blockSizeHorizontal! * 2.3,
                ),
              ),
            ],
          ),
        );
      case 'applied':
        return Container(
          transform: Matrix4.translationValues(16, 0, 0),
          height: 20,
          color: kGreenApplied,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: SizeConfig.blockSizeHorizontal! * 3,
                color: kWhite,
              ),
              SizedBox(width: 4),
              Text(
                'Applied',
                style: kPoppinsSemibold.copyWith(
                  color: kWhite,
                  fontSize: SizeConfig.blockSizeHorizontal! * 2.3,
                ),
              ),
            ],
          ),
        );
      default:
        Container();
        break;
    }

    return Container();
  }
}
