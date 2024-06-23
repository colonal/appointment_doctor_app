import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/model/specializations_response_model.dart';
import 'doctor_list_view_item.dart';

class DoctorListView extends StatelessWidget {
  final List<Doctors?> doctors;
  const DoctorListView(this.doctors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorListViewItem(doctors[index]!);
        },
      ),
    );
  }
}
