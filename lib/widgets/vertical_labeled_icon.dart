import 'package:flutter/widgets.dart';
import 'package:flutter_utility_belt/widgets/labeled_icon.dart';

/// It is responsible for displaying an [icon] and a [label] vertically with a
/// specified [gap] between them.
final class VerticalLabeledIcon extends LabeledIcon {
  const VerticalLabeledIcon({
    super.key,
    required super.icon,
    required super.label,
    required super.gap,
  }) : super(axis: Axis.vertical);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            height: gap,
          ),
          label,
        ],
      );
}
