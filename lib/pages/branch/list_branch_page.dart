import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/branch.dart';
import '../../models/department.dart';
import '../../providers/branch_provider.dart';
import '../../providers/department_provider.dart';
import '../../res/colors.dart';
import '../../widgets/custom_snackbar.dart';

class ListBranchPage extends StatefulWidget {
  const ListBranchPage({super.key});

  @override
  State<ListBranchPage> createState() => _ListBranchPageState();
}

class _ListBranchPageState extends State<ListBranchPage> {
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
    loadBranch();
  }

  void loadBranch() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      context.read<BranchProvider>().setLoading(true);
      try {
        await context.read<BranchProvider>().getBranch();
      } catch (e) {
        CustomSnackbar.showError(
          context: context,
          message: e.toString(),
        );
      } finally {
        context.read<BranchProvider>().setLoading(false);
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
            body: Consumer<BranchProvider>(
              builder: (context, branchProvider, _) {
                return branchProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColorStyle.primary,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: branchProvider.listBranch?.length ?? 0,
                        itemBuilder: (context, index) {
                          var branch = branchProvider.listBranch![index];
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
                                  Navigator.pop<Branch>(context, branch);
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
                                            labelText: 'Branch Name',
                                            contentText:
                                                branch.branchName ?? '',
                                          ),
                                          _buildTableRow(
                                            labelText: 'Branch Address',
                                            contentText:
                                                branch.branchAddress ?? '',
                                          ),
                                          _buildTableRow(
                                            labelText: 'Branch Phone',
                                            contentText:
                                                branch.branchPhone ?? '',
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
