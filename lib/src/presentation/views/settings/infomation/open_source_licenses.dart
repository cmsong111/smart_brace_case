import 'package:flutter/material.dart';
import 'package:smart_brace_case/oss_licenses.dart';

class OpenSourceLicensePage extends StatelessWidget {
  const OpenSourceLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("오픈소스 라이선스"),
      ),
      body: ListView.separated(
        itemCount: ossLicenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ossLicenses[index].name),
            subtitle: Text(ossLicenses[index].version),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: ossLicenses[index].name,
                applicationVersion: ossLicenses[index].version,
                applicationLegalese: ossLicenses[index].license,
                applicationIcon: const SizedBox(),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Divider(),
          );
        },
      ),
    );
  }
}
