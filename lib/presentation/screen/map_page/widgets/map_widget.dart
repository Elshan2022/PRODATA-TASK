import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/dimesdions/dimensions.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_state.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/view_model/map_page_viewModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.viewModel});

  final MapPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.markers.isEmpty) {
          return _progress(context);
        }


        final markersToDisplay = state.markers.toList();

        return SizedBox(
          height: context.height,
          width: context.width,
          child: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            markers: state.markers,
            initialCameraPosition: CameraPosition(
              target: markersToDisplay.first.position,
              zoom: 16,
              bearing: 192.8334901395799,
              tilt: 59.440717697143555,
            ),
            onMapCreated: (GoogleMapController controller) {
              viewModel.controller.complete(controller);
            },
          ),
        );
      },
    );
  }

  Container _progress(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.dynamicHeight(0.5),
        left: context.dynamicWidth(0.48),
      ),
      child: const CircularProgressIndicator(),
    );
  }
}
