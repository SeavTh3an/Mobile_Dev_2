import 'dart:async';

// Step 1: Create a dedicated DownloadProgress class
class DownloadProgress {
  final int progress;
  final DateTime timestamp;

  DownloadProgress(this.progress, this.timestamp);
}

// Step 2: Change the stream to send DownloadProgress objects
class DownloadService {
  final StreamController<DownloadProgress> _controller = StreamController();

  Stream<DownloadProgress> get stream => _controller.stream;

  // Step 3: Send current time along with progress
  void startDownload() async {
    for (int i = 0; i <= 100; i += 10) {
      await Future.delayed(Duration(milliseconds: 300));

      // Step 7: Simulate an error every 10 iterations
      if (i == 50) {
        _controller.addError("⚠️ Simulated error at progress $i%");
        continue;
      }

      _controller.add(DownloadProgress(i, DateTime.now()));
    }
    _controller.close();
  }
}

void main() {
  final service = DownloadService();
  DateTime? firstTimestamp;

  // Step 4: Listen to the stream
  service.stream.listen(
    (data) {
      // Step 5: Keep the first timestamp to estimate remaining time
      firstTimestamp ??= data.timestamp;

      final elapsed = data.timestamp.difference(firstTimestamp!).inMilliseconds;
      final percentDone = data.progress;

      int remainingMs = 0;
      if (percentDone > 0) {
        final msPerPercent = elapsed / percentDone;
        remainingMs = ((100 - percentDone) * msPerPercent).round();
      }

      // Step 6: Print progress + remaining time
      print("Progress: ${percentDone}% | Remaining: ${remainingMs}ms");
    },
    onError: (error) => print("Error: $error"),
    onDone: () => print(" Download complete!"),
  );

  service.startDownload();
}
