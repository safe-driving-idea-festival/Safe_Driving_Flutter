import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/driving/kakao_map_view_model.dart';

class GoogleMapComponent extends StatefulWidget {
  const GoogleMapComponent({
    super.key,
    required this.latLng,
  });

  final LatLng latLng;

  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.latLng,
        zoom: 20,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId('marker_id'),
          position: widget.latLng,
          infoWindow:  InfoWindow(
            title: context.read<KakaoViewModel>().kakaoMapModel!.placeName,
            snippet: context.read<KakaoViewModel>().kakaoMapModel!.addressName,
          ),
        ),
      },
    );
  }
}