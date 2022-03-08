import 'package:flutter/material.dart';

import '../widgets/expandable_container.dart';
import '../widgets/text_paragraph.dart';
import '../pages/tokenomics_page/tokenomics_page.dart';
import '../theme/theme.dart';
import '../models/url_launcher.dart';

class JsonHandler {
  static Widget convertIntoExpandableContainer({
    required BuildContext context,
    required String title,
    required List body,
    String? color,
    TextAlign? textAlign,
    required double expandedHeight,
    required double collapsedHeight,
  }) {
    final List<Widget> widgets = [];

    for (var element in body) {
      element.forEach((key, value) {
        if (key == 'textParagraph' || key == 'textParagraphBold') {
          widgets.add(TextParagraph(
            value,
            textAlign: textAlign,
            bold: key == 'textParagraphBold' ? true : false,
          ));
        } else if (key == 'richText') {
          widgets.add(convertIntoRichTextWidget(context, value));
        } else if (key == 'image') {
          // TODO
        } else if (key == 'headline') {
          // TODO
        } else if (key == 'box') {
          widgets.add(SizedBox(height: value.toDouble()));
        } else if (key == 'link') {
          widgets.add(TextButton(
              onPressed: () async {
                final result = await UrlLauncher.openInBrowser(value);
                if (!result) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Can not open the url'),
                      backgroundColor:
                          Theme.of(context).errorColor.withOpacity(0.7),
                    ),
                  );
                }
              },
              child: TextParagraph(value)));
        } else if (key == "widget") {
          if (value == "workersWage") {
            widgets.add(TokenomicsPage.workersWage(context));
          }
        }
      });
    }

    return ExpandableContainer(
      titleWidget: TextParagraph(
        title,
        textAlign: textAlign,
        bold: true,
      ),
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      color: color != null
          ? convertIntoColor(color)
          : const Color.fromRGBO(158, 158, 158, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  static RichText convertIntoRichTextWidget(
      BuildContext context, List richText) {
    List<InlineSpan> richTextWidgets = [];
    for (var e in richText) {
      e.forEach((key, value) {
        if (key == "bold") {
          richTextWidgets.add(
            TextSpan(
              text: value,
              style: AppTheme.richTextBody1Black(
                context,
                bold: true,
              ),
            ),
          );
        } else if (key == "normal") {
          richTextWidgets.add(
            TextSpan(
              text: value,
              style: AppTheme.richTextBody1Black(
                context,
              ),
            ),
          );
        }
      });
    }
    return RichText(
      text: TextSpan(
        children: richTextWidgets,
      ),
    );
  }

  static Color convertIntoColor(String colorValues) {
    List<int> intValues = [];
    colorValues.split(',').forEach((e) {
      intValues.add(int.parse(e));
    });
    return Color.fromARGB(
        intValues[0], intValues[1], intValues[2], intValues[3]);
  }
}
