import 'dart:developer' as dev;

import 'package:atmiya_community/bloc/filter/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue ;
    var student = Student(
      division: 'division',
      rollNo: 'rollNo',
      enrollNo: 'enrollNo',
      regNo: 'regNo',
      studentName: 'studentName',
      studentEmail: 'studentEmail',
      studentMobile: 'studentMobile',
      fatherMobile: 'fatherMobile',
      fatherOccupation: 'fatherOccupation',
      motherOccupation: 'motherOccupation',
      business: true,
      typeOfBusiness1: "true",
      typeOfBusiness2: 'typeOfBusiness2',
      city: 'city',
      district: 'district',
      job: true,
      jobCompany: 'jobCompany',
      jobRole: 'jobRole',
      jobCity: 'jobCity',
      physicallyDisable: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: selectedValue,
                items: dropdownItems,
                onChanged: (value) {
                  dev.log("Changed : $value");


                    selectedValue = value!;
                    dev.log("SelectedValue : $selectedValue");

                },
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  if (selectedValue == "Yes" || selectedValue == "No") {
                    dev.log("SelectedValue : $selectedValue");
                    student = student.copyWith(
                        business: selectedValue == "Yes" ? true : false);

                    context.read<FilterBloc>().add(
                          ApplyFilterEvent(student),
                        );
                  } else {
                    dev.log("SelectedValue : $selectedValue");
                    context.read<FilterBloc>().add(GetInitialList());
                  }
                },
                child: const Text('apply filter'),
              ),
            ],
          ),
          BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              if (state is FilterInitial) {
                context.read<FilterBloc>().add(GetInitialList());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (State is Filtering) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Filtered) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(state.students[index].rollNo),
                        title: Text(state.students[index].studentName),
                        subtitle:
                            Text(state.students[index].business.toString()),
                        trailing: Text(state.students[index].division),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.students.length,
                  ),
                );
              } else if (state is InitialFilter) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(state.initialList[index].rollNo),
                        title: Text(state.initialList[index].studentName),
                        subtitle:
                            Text(state.initialList[index].business.toString()),
                        trailing: Text(state.initialList[index].division),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.initialList.length,
                  ),
                );
              } else if (state is FilterError) {
                return Text(state.message);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Yes", child: Text("Yes")),
      DropdownMenuItem(value: "No", child: Text("No")),
      DropdownMenuItem(value: "All", child: Text("All")),
    ];
    return menuItems;
  }
}
