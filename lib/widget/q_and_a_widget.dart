import 'package:flutter/material.dart';

class QAndAWidget extends StatefulWidget {
  final String? question;
  final Function? changeAnswer;
  final int? index;
  final bool? value;
  const QAndAWidget(
      {this.value, this.question, this.changeAnswer, this.index, Key? key})
      : super(key: key);

  @override
  State<QAndAWidget> createState() => _QAndAWidgetState();
}

class _QAndAWidgetState extends State<QAndAWidget> {
  bool? groupValue;
  bool once = false;

  @override
  Widget build(BuildContext context) {
    if (widget.value != null && !once) {
      once = true;
      groupValue = widget.value;
    }
    return widget.question != null && widget.question!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Q: ${widget.question}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value as bool;
                          });
                          if (widget.changeAnswer != null &&
                              widget.index != null) {
                            widget.changeAnswer!(
                              widget.index,
                              groupValue,
                            );
                          }
                        }),
                    Text(
                      'Yes',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Radio(
                        value: false,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value as bool;
                          });
                          if (widget.changeAnswer != null &&
                              widget.index != null) {
                            widget.changeAnswer!(
                              widget.index,
                              groupValue,
                            );
                          }
                        }),
                    Text(
                      'No',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }
}
