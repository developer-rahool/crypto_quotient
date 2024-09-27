import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crypto_quotient/const.dart';

class DetailPage extends StatefulWidget {
  Widget? child;
  Function()? copyWidget;
  Function()? sharePressed;
  DetailPage({super.key, this.child, this.copyWidget, this.sharePressed});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      appBar: AppBarWidget(title: "Detail"),
      body: Padding(
        padding: mainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContainer(
              child: Padding(padding: mainPadding, child: widget.child),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: "Copy",
                        onPressed: () {
                          toast(context);
                          widget.copyWidget;
                          Navigator.pop(context);
                        }),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: CustomButton(
                          text: "Share", onPressed: widget.sharePressed)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
