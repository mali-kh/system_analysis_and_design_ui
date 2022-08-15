import 'package:flutter/material.dart';

import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';

class FileBottomSheetItem extends StatelessWidget {
  final MediaQueryData mq;
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool hasDivider;

  const FileBottomSheetItem({
    Key? key,
    required this.mq,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
    this.trailing,
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 21,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                if (trailing != null) trailing!
              ],
            ),
          ),
          if (hasDivider)
            Padding(
              padding: EdgeInsets.only(
                left: mq.size.width * 0.1,
              ),
              child: Divider(
                color: Colors.black,
              ),
            )
        ],
      ),
    );
  }
}
