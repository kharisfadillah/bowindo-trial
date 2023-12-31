
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/department.dart';
import '../../providers/department_provider.dart';
import '../../res/colors.dart';
import '../../widgets/custom_snackbar.dart';

class ListDepartmentPage extends StatefulWidget {
  const ListDepartmentPage({super.key});

  @override
  State<ListDepartmentPage> createState() => _ListDepartmentPageState();
}

class _ListDepartmentPageState extends State<ListDepartmentPage> {
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
    loadDepartment();
  }

  void loadDepartment() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      context.read<DepartmentProvider>().setLoading(true);
      try {
        await context.read<DepartmentProvider>().getDepartment();
      } catch (e) {
        CustomSnackbar.showError(
          context: context,
          message: e.toString(),
        );
      } finally {
        context.read<DepartmentProvider>().setLoading(false);
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
                'List Department',
                style: GoogleFonts.poppins(
                  color: AppColorStyle.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Consumer<DepartmentProvider>(
              builder: (context, departmentProvider, _) {
                return departmentProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColorStyle.primary,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: departmentProvider.listDepartment?.length ?? 0,
                        itemBuilder: (context, index) {
                          var department = departmentProvider.listDepartment![index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColorStyle.primaryLight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop<Department>(context, department);
                                },
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
                                            labelText: 'Department Id',
                                            contentText:
                                                department.departmentId?.toString() ?? '',
                                          ),
                                          _buildTableRow(
                                            labelText: 'Department Name',
                                            contentText:
                                                department.departmentName ?? '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
