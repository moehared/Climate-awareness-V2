import 'package:app/common/utils/show_overlay.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:app/ui/widgets/overlay-widget/build_overlay.dart';
import 'package:flutter/material.dart';

class QuickCarbonViewModel extends BaseViewModel {
  final _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final _navService = locator<NavigationService>();
  final _layerLink = LayerLink();
  OverlayEntry? _entry;
  TextEditingController get textController => _textController;
  FocusNode get textFocusNode => _textFocusNode;

  get layerLink => _layerLink;

  void quickCarbonEstimate() {}

  void refineEstimate() {
    _navService.navigateTo(QuestionaireView.routeName);
  }

  void initState(ctx) {
    _textFocusNode.addListener(() => _focusNodeListener(ctx));
    _textFocusNode.removeListener(() => _dispose());
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showOverlay(ctx));
  }

  void _focusNodeListener(ctx) {
    _textFocusNode.hasFocus ? _showOverlay(ctx) : _hideOverlay();
  }

  _showOverlay(BuildContext ctx) {
    _entry = showOverlayWidget(
      ctx: ctx,
      layerLink: _layerLink,
      offset: Offset(0, 40),
      child: BuildOverlayWidget(hideOverlay: _hideOverlay),
    );
  }

  void _hideOverlay() {
    _textFocusNode.unfocus();
    _entry?.remove();
    _entry = null;
  }

  void _dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
  }
}
