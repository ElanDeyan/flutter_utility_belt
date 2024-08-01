import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utility_belt/widgets/labeled_icon.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Widget icon;
  late double gap;
  late Widget label;
  late LabeledIcon horizontalLabeledIconWithRegularConstructor;
  late LabeledIcon verticalLabeledIconWithRegularConstructor;
  late LabeledIcon horizontalLabeledIcon;
  late LabeledIcon verticalLabeledIcon;

  setUp(() {
    icon = const Icon(Icons.favorite);
    gap = 10.0;
    label = const Text('Hello!');
    horizontalLabeledIconWithRegularConstructor = LabeledIcon(
      icon: icon,
      gap: gap,
      label: label,
    );

    verticalLabeledIconWithRegularConstructor = LabeledIcon(
      icon: icon,
      gap: gap,
      label: label,
      axis: Axis.vertical,
    );

    horizontalLabeledIcon =
        LabeledIcon.horizontal(icon: icon, label: label, gap: gap);

    verticalLabeledIcon =
        LabeledIcon.vertical(icon: icon, label: label, gap: gap);
  });

  group('Regular constructor > ', () {
    testWidgets('Horizontal', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => Scaffold(
            body: horizontalLabeledIconWithRegularConstructor,
          ),
        ),
      );

      expect(find.byType(LabeledIcon), findsOneWidget);
      expect(find.byType(HorizontalLabeledIcon), findsOneWidget);
      expect(find.byWidget(icon), findsOneWidget);
      expect(find.byWidget(label), findsOneWidget);

      final labeledIconWidth = (tester.renderObject(
        find.byWidget(horizontalLabeledIconWithRegularConstructor),
      ) as RenderBox)
          .size
          .width;
      final iconWidth =
          (tester.renderObject(find.byWidget(icon)) as RenderBox).size.width;
      final labelWidth =
          (tester.renderObject(find.byWidget(label)) as RenderBox).size.width;

      expect(labeledIconWidth - iconWidth - labelWidth, equals(gap));
    });

    testWidgets('Vertical', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => Scaffold(
            body: verticalLabeledIconWithRegularConstructor,
          ),
        ),
      );

      expect(find.byType(LabeledIcon), findsOneWidget);
      expect(find.byType(VerticalLabeledIcon), findsOneWidget);
      expect(find.byWidget(icon), findsOneWidget);
      expect(find.byWidget(label), findsOneWidget);

      final labeledIconHeight = (tester.renderObject(
        find.byWidget(verticalLabeledIconWithRegularConstructor),
      ) as RenderBox)
          .size
          .height;
      final iconHeight =
          (tester.renderObject(find.byWidget(icon)) as RenderBox).size.height;
      final labelHeight =
          (tester.renderObject(find.byWidget(label)) as RenderBox).size.height;

      expect(labeledIconHeight - iconHeight - labelHeight, equals(gap));
    });
  });

  group('Factories > ', () {
    testWidgets('Horizontal', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => Scaffold(
            body: horizontalLabeledIcon,
          ),
        ),
      );

      expect(find.byType(LabeledIcon), findsNothing);
      expect(find.byType(HorizontalLabeledIcon), findsOneWidget);
      expect(find.byWidget(icon), findsOneWidget);
      expect(find.byWidget(label), findsOneWidget);

      final labeledIconWidth = (tester.renderObject(
        find.byWidget(horizontalLabeledIcon),
      ) as RenderBox)
          .size
          .width;
      final iconWidth =
          (tester.renderObject(find.byWidget(icon)) as RenderBox).size.width;
      final labelWidth =
          (tester.renderObject(find.byWidget(label)) as RenderBox).size.width;

      expect(labeledIconWidth - iconWidth - labelWidth, equals(gap));
    });

    testWidgets('Vertical', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => Scaffold(
            body: verticalLabeledIcon,
          ),
        ),
      );

      expect(find.byType(LabeledIcon), findsNothing);
      expect(find.byType(VerticalLabeledIcon), findsOneWidget);
      expect(find.byWidget(icon), findsOneWidget);
      expect(find.byWidget(label), findsOneWidget);

      final labeledIconHeight = (tester.renderObject(
        find.byWidget(verticalLabeledIcon),
      ) as RenderBox)
          .size
          .height;
      final iconHeight =
          (tester.renderObject(find.byWidget(icon)) as RenderBox).size.height;
      final labelHeight =
          (tester.renderObject(find.byWidget(label)) as RenderBox).size.height;

      expect(labeledIconHeight - iconHeight - labelHeight, equals(gap));
    });
  });
}
