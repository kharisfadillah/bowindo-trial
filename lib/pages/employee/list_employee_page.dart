import 'dart:developer';

import 'package:bowindo_trial/providers/employee_provider.dart';
import 'package:bowindo_trial/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_snackbar.dart';
import 'form_employee_page.dart';

class ListEmployeePage extends StatefulWidget {
  const ListEmployeePage({super.key});

  @override
  State<ListEmployeePage> createState() => _ListEmployeePageState();
}

class _ListEmployeePageState extends State<ListEmployeePage> {
  TableRow _buildTableRow({
    required String labelText,
    required String contentText,
  }) {
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 3,
      horizontal: 5,
    );

    TextStyle style = GoogleFonts.poppins(
      fontSize: 14,
    );
    return TableRow(
      children: [
        Padding(
          padding: padding,
          child: Text(
            labelText,
            style: style,
          ),
        ),
        Padding(
          padding: padding,
          child: Text(
            ':',
            style: style,
          ),
        ),
        Padding(
          padding: padding,
          child: Text(
            contentText,
            style: style,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadEmployee();
  }

  void loadEmployee() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      context.read<EmployeeProvider>().setLoading(true);
      try {
        await context.read<EmployeeProvider>().getEmployee();
      } catch (e) {
        CustomSnackbar.showError(
          context: context,
          message: e.toString(),
        );
      } finally {
        context.read<EmployeeProvider>().setLoading(false);
      }
    });
  }

  void showSuccessDeleted() {
    CustomSnackbar.showInfo(
      context: context,
      message: 'Employee deleted',
    );
  }

  void deleteEmployee(int employeeId) {
    CustomDialog.yesNo(
      context: context,
      title: 'Alert',
      content: 'Do you want to delete this employee?',
    ).then((value) async {
      if (value ?? false) {
        var employeeProvider = context.read<EmployeeProvider>();
        employeeProvider.setLoading(true);
        try {
          await employeeProvider.deleteEmployee(employeeId);
          employeeProvider.getEmployee();
          showSuccessDeleted();
        } catch (e) {
          CustomSnackbar.showError(
            context: context,
            message: e.toString(),
          );
        } finally {
          employeeProvider.setLoading(false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F8FD),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF9F8FD),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'List Employee',
                style: GoogleFonts.poppins(
                  color: AppColorStyle.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            floatingActionButton: ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormEmployeePage(),
                  ),
                );
                loadEmployee();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorStyle.primary,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(Icons.add_rounded),
            ),
            body: Consumer<EmployeeProvider>(
              builder: (context, employeeProvider, _) {
                return employeeProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColorStyle.primary,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: employeeProvider.listEmployee?.length ?? 0,
                        itemBuilder: (context, index) {
                          var employee = employeeProvider.listEmployee![index];
                          return Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FormEmployeePage(
                                          employee: employee,
                                        ),
                                      ),
                                    );
                                    loadEmployee();
                                  },
                                  backgroundColor: AppColorStyle.primary,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit_rounded,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    deleteEmployee(employee.employeeId!);
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete_rounded,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColorStyle.primaryLight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Table(
                                      columnWidths: const {
                                        0: IntrinsicColumnWidth(),
                                        1: IntrinsicColumnWidth(),
                                        2: FlexColumnWidth(1),
                                      },
                                      children: [
                                        _buildTableRow(
                                          labelText: 'Name',
                                          contentText:
                                              employee.employeeName ?? '',
                                        ),
                                        // _buildTableRow(
                                        //   labelText: 'Address',
                                        //   contentText: 'content',
                                        // ),
                                        // _buildTableRow(
                                        //   labelText: 'Birth',
                                        //   contentText: 'content',
                                        // ),
                                        _buildTableRow(
                                          labelText: 'Email',
                                          contentText:
                                              employee.employeeMail ?? '',
                                        ),
                                        _buildTableRow(
                                          labelText: 'Department',
                                          contentText:
                                              employee.departmentName ?? '',
                                        ),
                                        _buildTableRow(
                                          labelText: 'Branch',
                                          contentText:
                                              employee.branchName ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                      );
              },
            )),
      ),
    );
  }
}
