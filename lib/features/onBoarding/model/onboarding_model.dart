class OnboardingModel {
  final String title;
  final String description;
  final String imageAsset;

  OnboardingModel({required this.title, required this.imageAsset, required this.description});
}

class OnboardingData {
  static final List<OnboardingModel> pages = [
    OnboardingModel(
      title: "اكتشف أفضل السيارات المعروضة للمزاد",
      imageAsset: "assets/images/onboarding1.png",
      description: "تصفّح مئات السيارات المعروضة من تجار معتمدين، مع تفاصيل كاملة وسجل الحالة قبل ما تبدأ المزايدة.",
    ),
    OnboardingModel(
      title: "زايد بخطوة واحدة وتابع السعر لحظيًّا",
      imageAsset: "assets/images/onboarding2.png",
      description: "قدّم عرضك فورًا وتابع حركة المزايدات لحظة بلحظة مع نظام إشعارات سريع.",
    ),
    OnboardingModel(
      title: "اربح سيارتك واستلمها بكل سهولة وأمان",
      imageAsset: "assets/images/onboarding3.png",
      description: "بعد الفوز، ادفع عبر طرق آمنة واحصل على تقرير كامل، وابدأ إجراءات الاستلام من المكان المحدد.",
    ),
  ];
}