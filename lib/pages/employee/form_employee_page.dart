import 'dart:developer';

import 'package:bowindo_trial/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/branch.dart';
import '../../models/department.dart';
import '../../providers/employee_provider.dart';
import '../../res/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_textfield.dart';
import '../branch/list_branch_page.dart';
import '../department/list_department_page.dart';

class FormEmployeePage extends StatefulWidget {
  final Employee? employee;
  const FormEmployeePage({super.key, this.employee});

  @override
  State<FormEmployeePage> createState() => _FormEmployeePageState();
}

class _FormEmployeePageState extends State<FormEmployeePage> {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController birthController;
  late TextEditingController departmentController;
  late TextEditingController departmentIdController;
  late TextEditingController branchController;
  late TextEditingController branchIdController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    birthController = TextEditingController();
    departmentController = TextEditingController();
    departmentIdController = TextEditingController();
    branchController = TextEditingController();
    branchIdController = TextEditingController();
    if (widget.employee != null) {
      loadData();
    }
  }

  void loadData() {
    nameController.text = widget.employee!.employeeName ?? '';
    addressController.text = widget.employee!.employeeAddress ?? '';
    emailController.text = widget.employee!.employeeMail ?? '';
    birthController.text = widget.employee!.employeeDob ?? '';
    departmentController.text = widget.employee!.departmentName ?? '';
    departmentIdController.text =
        widget.employee!.departmentId?.toString() ?? '';
    branchController.text = widget.employee!.branchName ?? '';
    branchIdController.text = widget.employee!.branchId ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    birthController.dispose();
    departmentController.dispose();
    departmentIdController.dispose();
    branchController.dispose();
    branchIdController.dispose();
    super.dispose();
  }

  void showSuccessAdded() {
    CustomSnackbar.showInfo(
      context: context,
      message: 'Employee added',
    );
    Navigator.pop(context);
  }

  void showSuccessEdited() {
    CustomSnackbar.showInfo(
      context: context,
      message: 'Employee updated',
    );
    Navigator.pop(context);
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
              widget.employee == null ? 'Add Employee' : 'Edit Employee',
              style: GoogleFonts.poppins(
                color: AppColorStyle.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColorStyle.primary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Address',
                          hintText: 'Enter Address',
                          controller: addressController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Birth',
                          hintText: 'Enter Birth',
                          readOnly: true,
                          controller: birthController,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 36500)),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: AppColorStyle.primary,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              if (value != null) {
                                birthController.text =
                                    DateFormat('yyyy-MM-dd').format(value);
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Department',
                          hintText: 'Enter Department',
                          readOnly: true,
                          controller: departmentController,
                          onTap: () async {
                            var department = await Navigator.push<Department?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ListDepartmentPage(),
                              ),
                            );
                            if (department != null) {
                              departmentController.text =
                                  department.departmentName ?? '';
                              departmentIdController.text =
                                  department.departmentId.toString();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Branch',
                          hintText: 'Enter Branch',
                          readOnly: true,
                          controller: branchController,
                          onTap: () async {
                            var branch = await Navigator.push<Branch?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListBranchPage(),
                              ),
                            );
                            if (branch != null) {
                              branchController.text = branch.branchName ?? '';
                              branchIdController.text = branch.branchId ?? '';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<EmployeeProvider>(
                  builder: (context, employeeProvider, _) {
                    return employeeProvider.isLoading
                        ? const CircularProgressIndicator(
                            color: AppColorStyle.primary,
                          )
                        : CustomButton(
                            text: 'Submit',
                            onPressed: () async {
                              var name = nameController.text;
                              var address = addressController.text;
                              var email = emailController.text;
                              var birth = birthController.text;
                              var departmentId = departmentIdController.text;
                              var branchId = branchIdController.text;
                              if (name.isEmpty || name.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Name tidak boleh kosong',
                                );
                                return;
                              }
                              if (address.isEmpty || address.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Address tidak boleh kosong',
                                );
                                return;
                              }
                              if (email.isEmpty || email.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Email tidak boleh kosong',
                                );
                                return;
                              }
                              if (birth.isEmpty || birth.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Birth tidak boleh kosong',
                                );
                                return;
                              }
                              if (departmentId.isEmpty ||
                                  departmentId.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Department tidak boleh kosong',
                                );
                                return;
                              }
                              if (branchId.isEmpty || branchId.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Branch tidak boleh kosong',
                                );
                                return;
                              }
                              employeeProvider.setLoading(true);
                              try {
                                if (widget.employee != null) {
                                  await employeeProvider.editEmployee(
                                    EditEmployeeRequest(
                                      employeeId: widget.employee?.employeeId.toString(),
                                      employeeName: name,
                                      employeeAddress: address,
                                      employeeMail: email,
                                      employeeDob: birth,
                                      departmentId: departmentId,
                                      branchId: branchId,
                                    ),
                                  );
                                  showSuccessEdited();
                                } else {
                                  await employeeProvider.addEmployee(
                                    AddEmployeeRequest(
                                      employeeName: name,
                                      employeeAddress: address,
                                      employeeMail: email,
                                      employeeDob: birth,
                                      departmentId: departmentId,
                                      branchId: branchId,
                                    ),
                                  );
                                  showSuccessAdded();
                                }
                              } catch (e) {
                                print(e);
                                CustomSnackbar.showError(
                                  context: context,
                                  message: e.toString(),
                                );
                              } finally {
                                employeeProvider.setLoading(false);
                              }
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
