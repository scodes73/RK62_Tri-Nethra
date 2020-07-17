import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/services/location/map_picker.dart';
import 'package:tri_nethra/services/location/picker_bloc.dart';
import 'package:tri_nethra/services/location/search_box.dart';

class MapPickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Picker'),
        backgroundColor: Colors.orange,
      ),
      body: ChangeNotifierProvider<PickerBloc>(
        create: (context) => PickerBloc.getInstance(),
        child: MapPickerBody(),
      ),
    );
  }
}

class MapPickerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PickerBloc>(
      builder: (context, bloc, child) => Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                MapPicker(bloc),
                SearchBox(bloc),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PickerBloc pickerBloc = Provider.of<PickerBloc>(context);
    return Container(
      height: 90,
      width: double.infinity,
      color: Colors.orange,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.5,
        child: RaisedButton(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            Navigator.pop(context, pickerBloc.currentLocation);
          },
          child: Text(
            "Select the pin",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
