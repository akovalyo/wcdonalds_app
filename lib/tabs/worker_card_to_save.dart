import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'workers_tab_worker_tile.dart';
import '../theme/theme.dart';
import '../io/io.dart';
import '../widgets/app_circular_progress_indicator.dart';
import '../models/platform.dart';
import '../models/app_state.dart';
import '../widgets/hyperlink.dart';

class WorkerCardToSave extends StatefulWidget {
  final WorkersTabWorkerTile workerTile;
  final String id;

  const WorkerCardToSave({
    Key? key,
    required this.workerTile,
    required this.id,
  }) : super(key: key);

  @override
  State<WorkerCardToSave> createState() => _WorkerCardToSaveState();
}

class _WorkerCardToSaveState extends State<WorkerCardToSave> {
  final GlobalKey _key = GlobalKey();
  bool _isLoading = false;

  void saveCard(String platform) async {
    setState(() {
      _isLoading = true;
    });

    String successMessage = 'File saved';
    if (platform == PlatformInfo.android) {
      successMessage += ' to "Wcdonalds" folder';
    } else if (platform == PlatformInfo.macOs) {
      successMessage += ' to the Photos Library';
    }

    try {
      await saveNftCard(
        _key,
        'WcdonaldsWorker#${widget.id}',
        platform,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(successMessage),
          backgroundColor: Colors.green.withOpacity(0.7),
        ),
      );
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.contains('Exception')) {
        errorMessage = errorMessage.split('Exception:').last;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
    }
    Navigator.of(context).pop();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = context.read<AppState>();

    return AlertDialog(
      content: SizedBox(
        height: AppTheme.getMaxWidgetHeight(context, 470),
        width: AppTheme.getMaxWidgetWidth(context),
        child: Stack(
          children: [
            if (_isLoading)
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                    width: 40,
                    height: 40,
                    child: const AppCircularProgressIndicator()),
              ),
            ListView(
              children: [
                RepaintBoundary(
                  key: _key,
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Theme.of(context).colorScheme.primary,
                      color: Color.fromARGB(255, 219, 92, 64),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 425,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/images/logo_y.png'),
                              height: 30,
                            ),
                            Image(
                              image: AssetImage('assets/images/wcdonalds.png'),
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        widget.workerTile,
                      ],
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hyperlink(
                        title: 'Close',
                        fontSize: 20,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hyperlink(
                        title: 'Save',
                        fontSize: 20,
                        onTap: () {
                          saveCard(appState.platform);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
