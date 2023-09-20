import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/bloc/advertising_bloc.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/widgets/advertising_widgets/advertising_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdvertisingView extends StatelessWidget {
  const AdvertisingView({super.key});

  @override
  Widget build(BuildContext context) {
    final advertising = BlocProvider.of<AdvertisingBloc>(context)
      ..add(GetLastAdvertsings(page: 1));
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<AdvertisingBloc, AdvertisingState>(
      builder: (contex, adverTisingtate) {
        switch (adverTisingtate.runtimeType) {
          case AdvertisingAllLoadign:
            return const Center(
              child: Text("no andamos loco"),
            );
          case AdvertisingAllSucces:
            return Column(
              children: [
                AdvertisingSlider(),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _buildHeaderText(colors),
                      ),
                      Expanded(
                          child:
                              _buildListAdvertisding(adverTisingtate, colors))
                    ]))
              ],
            );
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  _buildHeaderText(ColorScheme colors) => Text("Ultimas Novedades",
      style: TextStyle(
          color: colors.onInverseSurface,
          fontWeight: FontWeight.bold,
          fontSize: 25));
  Widget _buildListAdvertisding(AdvertisingState state, ColorScheme colors) {
    return ListView.builder(
      itemCount: state.lastAdvertising!.length,
      itemBuilder: (context, index) =>
          _buildaCardToList(state.lastAdvertising![index], colors, context),
    );
  }

  Widget _buildaCardToList(
      AdvertisingModel state, ColorScheme colors, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10, top: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: Color(0x5E7F7CC9),
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          Positioned(
              top: -8,
              left: 20,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    state.image,
                    width: 130,
                  ))),
          Positioned(
              left: 155,
              top: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${state.title.substring(0, 17)} ...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: colors.onInverseSurface),
                  ),
                  Text(
                    state.date,
                    style: TextStyle(color: colors.onSecondary),
                  )
                ],
              )),
          Positioned(
              right: -5,
              top: 28,
              child: InkWell(
                onTap: () => context.go('/advertisingDetail/${state.id}'),
                child: Icon(Icons.arrow_circle_right,
                    color: colors.onInverseSurface, size: 40),
              ))
        ],
      ),
    );
  }
}
