import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class VariantBaseSelector extends StatefulWidget {
  @override
  _VariantBaseSelectorState createState() => _VariantBaseSelectorState();
}

class _VariantBaseSelectorState extends State<VariantBaseSelector> {
  String selectedBase = 'Standered';

  Widget buildSizeOption({
    required String label,
    String? price,
  }) {
    bool isSelected = selectedBase == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBase = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[600] : ColorUtils.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment:
          price == null ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: label,
              fontSize: 16,
              textColor: ColorUtils.black,
              fontWeight: FontWeight.w600,
            ),
            if (price != null)
              MyText(
                text: price,
                fontSize: 16,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.bold,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSizeOption(label: 'Standered'),
        VerticalSpace(height: 10),
        buildSizeOption(label: 'Paper Thin', price: '\$3.00'),
        VerticalSpace(height: 10),
        buildSizeOption(label: 'Thick', price: '\$3.00'),
      ],
    );
  }
}
