import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/bloc/advertising_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'card_slider.dart';

class AdvertisingSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final advertising = BlocProvider.of<AdvertisingBloc>(context)
      ..add(GetLastAdvertsings(page: 1));
    return BlocBuilder<AdvertisingBloc, AdvertisingState>(
      builder: (context, state) => SizedBox(
        height: 210,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.8,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    activeColor: colors.primary, color: colors.inversePrimary)),
            autoplay: true,
            itemCount: state.lastAdvertising?.length ?? 0,
            itemBuilder: (context, index) => CardSlider(
                advertising: state.lastAdvertising?[index], colors: colors),
          ),
        ),
      ),
    );
  }
}
