import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/location_viewmodel/location_viewmodel.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  static const routeName = '/LocationView';
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<LocationViewModel>(
      
      builder: (ctx, model, ch) => Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Location View'),
        ),
      
        body: SafeArea(
          child: ch!,
          ),
        ),
        child: Center(
        child: Text('Location View'),
      ),
    );
  }
}
