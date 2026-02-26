import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        Widget trailing;
        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            trailing = ElevatedButton(
              onPressed: controller.startDownload,
              child: Text('Download'),
            );
            break;
          case DownloadStatus.downloading:
            trailing = Column(
              children: [
                SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(value: controller.progress),
                ),
                Text(
                  "${(controller.progress * 100).toInt()}% "
                  
                  "${(controller.progress * controller.ressource.size).toInt()} MB/${(controller.ressource.size)} MB",
                ),
              ],
            );
            break;
          case DownloadStatus.downloaded:
            trailing = Icon(Icons.check_circle, color: Colors.green);
            break;
        }
        return Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.ressource.name),
                    Text("${(controller.ressource.size)} MB")
                  ],
                ),
                trailing,
              ],
            ),
          ),
        );
      },
    );
  }
}
