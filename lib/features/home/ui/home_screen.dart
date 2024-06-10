import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "widget/doctor_speciality_see_all.dart";
import "widget/doctors_blue_container.dart";
import "widget/home_top_bar.dart";
import "widget/specialization_and_doctor_bloc_builder.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              SizedBox(height: 24.h),
              const DoctorSpecialitySeeAll(),
              SizedBox(height: 18.h),
              const SpecializationAndDoctorBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
