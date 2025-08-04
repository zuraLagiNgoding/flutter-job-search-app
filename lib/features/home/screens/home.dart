import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import 'package:job_search_app/app_styles.dart';
import 'package:job_search_app/features/job/domain/services/job_service.dart';
import 'package:job_search_app/features/job/widgets/widgets.dart';
import 'package:job_search_app/size_config.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final query = useQuery(['jobs'], () => JobService.getJobs());

    if (query.data != null) {
      debugPrint('DATA: ${query.data?.data.length}');
    }

    if (query.isError) {
      debugPrint('ERROR: ${query.error}');
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        height: 52,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kBluePrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                style: kPoppinsMedium.copyWith(color: kWhite),
                controller: TextEditingController(),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.search, color: kWhite),
                  ),
                  hintText: "Enter your jobs preference",
                  hintStyle: kPoppinsMedium.copyWith(color: kWhiteF5),
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: kTransparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: kTransparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: kTransparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: kTransparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: kTransparent),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const VerticalDivider(color: kWhite, thickness: 1),
            const SizedBox(width: 12),
            Icon(Icons.filter_list, color: kWhite, size: 24),
          ],
        ),
      ),
      backgroundColor: kWhiteF5,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '40 JOBS FOUND',
                    style: kPoppinsBold.copyWith(
                      color: kBlack18,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'All Relevance',
                        style: kPoppinsSemibold.copyWith(
                          color: kBluePrimary,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down, color: kBluePrimary),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                itemCount: query.data?.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final job = query.data?.data[index];

                  if (job == null) return null;

                  return JobCard(
                    position: job.position,
                    company: job.company,
                    companyImage: job.companyImage,
                    status: job.status,
                    types: job.types,
                    salary: job.salary,
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
