import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionInfo extends StatefulWidget {
  const VersionInfo({
    super.key,
  });

  @override
  State<VersionInfo> createState() => _VersionInfoState();
}

class _VersionInfoState extends State<VersionInfo> {
  String version = '';

  @override
  void initState() {
    super.initState();
    fetchVersion();
  }

  fetchVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Build by Kalash and Garvit with ❣️',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        Text(
          'v$version',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
