import 'package:flutter/material.dart';

class InvitationCodeLabelWidget extends StatelessWidget {
  final String label;
  const InvitationCodeLabelWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                  '\u2022',
                  textAlign: TextAlign.start,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge),

              const SizedBox(
                width: 9,
              ),

              Expanded(
                child: Text(
                    label,
                    textAlign: TextAlign.start,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge),
              ),


            ],
          )
        ],
      ),
    );
  }
}
