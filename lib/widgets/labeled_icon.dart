import 'package:flutter/widgets.dart';

/// The [LabeledIcon] class is a base class that extends [StatelessWidget].
/// It defines properties for an [icon], a [gap], a [label], and an [axis].
/// The constructor [LabeledIcon] initializes these properties and
/// allows for the [axis] to default to [Axis.horizontal] if not specified.
base class LabeledIcon extends StatelessWidget {
  final Widget icon;
  final double gap;
  final Widget label;
  final Axis axis;

  const LabeledIcon({
    super.key,
    required this.icon,
    required this.gap,
    required this.label,
    this.axis = Axis.horizontal,
  });

  const factory LabeledIcon.vertical({
    required Widget icon,
    required Widget label,
    required double gap,
  }) = VerticalLabeledIcon;

  const factory LabeledIcon.horizontal({
    required Widget icon,
    required Widget label,
    required double gap,
  }) = HorizontalLabeledIcon;

  @override
  Widget build(BuildContext context) => switch (axis) {
        Axis.horizontal =>
          LabeledIcon.horizontal(icon: icon, label: label, gap: gap),
        Axis.vertical =>
          LabeledIcon.vertical(icon: icon, label: label, gap: gap),
      };
}

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

/// The [HorizontalLabeledIcon] class is responsible for displaying an [icon]
/// and a [label] horizontally with a specified [gap] between them.
final class HorizontalLabeledIcon extends LabeledIcon {
  const HorizontalLabeledIcon({
    super.key,
    required super.icon,
    required super.label,
    required super.gap,
  }) : super(axis: Axis.horizontal);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            width: gap,
          ),
          label,
        ],
      );
}
