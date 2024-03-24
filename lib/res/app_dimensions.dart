abstract class AppDimensions {
  double textTitleSize();

  double textSubTitleSize();

  double padding();

  double logoSize();
}

class AppDesktopDimensions extends AppDimensions {
  @override
  double padding() => 256;

  @override
  double textTitleSize() => 54;

  @override
  double textSubTitleSize() => 34;

  @override
  double logoSize() => 222;
}

class AppMobileDimensions extends AppDimensions {
  @override
  double padding() => 16;

  @override
  double textTitleSize() => 15;

  @override
  double textSubTitleSize() => 14;

  @override
  double logoSize() => 48;
}

class AppTabletDimensions extends AppDimensions {
  @override
  double padding() => 64;

  @override
  double textTitleSize() => 34;

  @override
  double textSubTitleSize() => 22;

  @override
  double logoSize() => 128;
}
