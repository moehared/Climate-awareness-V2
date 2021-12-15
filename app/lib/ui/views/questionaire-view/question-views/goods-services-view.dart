import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/goods-services-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/rounded-long-button.dart';
import 'package:app/ui/widgets/button-widget/simple_or_advance_button.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/spacing_widget/verticle_space.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

class GoodsServicesView extends StatelessWidget {
  const GoodsServicesView({
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);
  final Function() next;
  final Function() prev;

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<GoodsServicesViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: LabelTitleWidget(
                  title: 'HOW MUCH DO YOU SPEND ON EACH OF THE FOLLOWING?'),
            ),
            const BuildSpacing(),
            BuildSimpleOrAdvanceWidget(
              onAdvanceClick: () {},
              onSimpleClick: () {},
            ),
            const BuildSpacing(),
            BuildTitleAndHelpButton(
              label: 'Goods',
              rightIconButton: () {},
            ),
            BuildSliderWidget(
              value: model.goodsValue,
              onChange: (val) => model.onGoodsChange(val),
              max: 3920,
              step: 3920,
              label: '\$${model.goodsValue.toStringAsFixed(0)} /Month',
            ),
            const BuildSpacing(),
            BuildTitleAndHelpButton(
              label: 'Services',
              rightIconButton: () {},
            ),
            BuildSliderWidget(
              value: model.servicesValue,
              onChange: (val) => model.onServiceChange(val),
              max: 7215,
              step: 7215,
              label: '\$${model.servicesValue.toStringAsFixed(0)} /Month',
            ),
            const BuildSpacing(space: 15),
            BuildRichText(
              label:
                  'Greenhouse gas emission factors from the Comprehensive Environmental Data Archive for Economic and Environmental Systems Analysis ',
              linkLabel: '(CEDA 3.0 Climate).',
              onTap: model.onTextLink,
            ),
            BuildSpacing(space: 30),
            BuildRoundedLongButton(
              title: 'Continue',
              onPress: model.onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
