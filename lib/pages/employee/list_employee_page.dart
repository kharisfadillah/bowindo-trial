import 'package:bowindo_trial/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListEmployeePage extends StatelessWidget {
  const ListEmployeePage({super.key});

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
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F8FD),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFF9F8FD),
            elevation: 0,
            title: Text(
              'List Employee',
              style: GoogleFonts.poppins(
                color: AppColorStyle.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return Container(
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
                            contentText: 'content',
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
                            contentText: 'content',
                          ),
                          _buildTableRow(
                            labelText: 'Department',
                            contentText: 'content',
                          ),
                          _buildTableRow(
                            labelText: 'Branch',
                            contentText: 'content',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          color: Colors.red,
                          child: Text('Edit'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
