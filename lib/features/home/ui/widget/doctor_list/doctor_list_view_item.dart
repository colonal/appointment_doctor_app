import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../data/model/specializations_response_model.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctors doctors;
  const DoctorListViewItem(this.doctors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: doctors.photo ?? "",
              width: 110.w,
              height: 120.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.network(
                'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
                width: 110.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors.name ?? "Name",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  "${doctors.degree} | ${doctors.phone}",
                  style: TextStyles.font12GrayMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  doctors.email ?? "Email",
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
