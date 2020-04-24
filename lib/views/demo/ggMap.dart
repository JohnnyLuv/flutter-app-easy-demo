import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class GGMap extends StatefulWidget {
  GGMap({Key key}) : super(key: key);

  @override
  _GGMapState createState() => _GGMapState();
}

class _GGMapState extends State<GGMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ggMap')),
      body: Container(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              /* urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              additionalOptions: {
                'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
                'id': 'mapbox.streets',
              }, */
              urlTemplate: 'http://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
              subdomains: [
                "1",
                "2",
                "3",
                "4"
              ],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(51.5, -0.09),
                  builder: (ctx) => Container(
                    child: FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
          mapController: MapController(),
        ),
      ),
    );
  }
}
