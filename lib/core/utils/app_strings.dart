/// كل نصوص التطبيق (عربي).
///
/// لما تيجي تعمل الإنجليزي (AR/EN) انقلها لملفات ARB مع flutter gen-l10n.
class AppStrings {
  AppStrings._();

  // ── عام ───────────────────────────────────────────────────
  static const String appName = 'سكة حديد مصر';
  static const String next = 'التالي';
  static const String skip = 'تخطي';
  static const String back = 'رجوع';
  static const String confirm = 'تأكيد';
  static const String cancel = 'إلغاء';
  static const String viewAll = 'عرض الكل';
  static const String search = 'بحث';
  static const String backToHome = 'الرجوع للرئيسية';
  static const String scanAnother = 'مسح تذكرة تانية';

  // ── البداية (Onboarding) ──────────────────────────────────
  static const String onboardingTitle1 = 'احجز تذكرتك في دقايق';
  static const String onboardingBody1 =
      'ابحث، اختار كرسيك، وفعّل تذكرتك من شباك المحطة.';
  static const String start = 'ابدأ الآن';

  // ── تسجيل الدخول والحساب ──────────────────────────────────
  static const String login = 'تسجيل الدخول';
  static const String loginWithBiometric = 'الدخول بالبصمة';
  static const String signup = 'إنشاء حساب';
  static const String signupNow = 'سجّل دلوقتي';
  static const String email = 'البريد الإلكتروني';
  static const String password = 'كلمة السر';
  static const String fullName = 'الاسم بالكامل';
  static const String mobile = 'رقم الموبايل';
  static const String nationalId = 'الرقم القومي';
  static const String agreeTerms = 'أوافق على الشروط والأحكام';

  // حساب الأجانب
  static const String foreignerAccount = 'حساب للأجانب';
  static const String foreigner = 'أجنبي · Foreigner';
  static const String egyptian = 'مصري';
  static const String fullNamePassport = 'الاسم زي ما في الجواز · Full name';
  static const String nationality = 'الجنسية · Nationality';
  static const String selectNationality = 'اختار الجنسية · Select';
  static const String passportNumber = 'رقم الجواز · Passport number';
  static const String passportNote =
      'هنستخدم رقم الجواز في التذكرة، وهتعرضه عند الركوب.';

  // تأكيد الموبايل (OTP)
  static const String verifyMobile = 'تأكيد رقم الموبايل';
  static const String enterCode = 'أدخل كود التأكيد';
  static const String resendCode = 'إعادة إرسال الكود';
  static const String changeMobile = 'تغيير رقم الموبايل';
  static String codeSentToMobile(String lastDigits) =>
      'بعتنالك كود من 6 أرقام على رقم موبايلك المنتهي بـ $lastDigits';
  static String resendAfter(String time) => 'ممكن تطلب كود جديد بعد $time';

  // نسيت كلمة السر
  static const String forgotPassword = 'نسيت كلمة السر؟';
  static const String forgotPasswordHint =
      'اكتب بريدك الإلكتروني وهنبعتلك كود لاستعادة حسابك.';
  static const String sendCode = 'إرسال الكود';
  static const String backToLogin = 'الرجوع لتسجيل الدخول';
  static const String resetPassword = 'استعادة كلمة السر';
  static const String codeSentToEmail =
      'بعتنالك كود من 6 أرقام على بريدك الإلكتروني';
  static const String changeEmail = 'تغيير البريد الإلكتروني';
  static const String newPassword = 'كلمة سر جديدة';
  static const String chooseNewPassword = 'اختار كلمة سر جديدة';
  static const String passwordRules = 'لازم تكون 8 حروف على الأقل وفيها رقم.';
  static const String newPasswordLabel = 'كلمة السر الجديدة';
  static const String confirmPassword = 'تأكيد كلمة السر';
  static const String passwordStrong = 'قوية';
  static const String savePassword = 'حفظ كلمة السر';

  // ── الرئيسية ──────────────────────────────────────────────
  static String greeting(String name) => 'أهلًا يا $name';
  static const String onTime = 'في الميعاد';
  static const String whereTo = 'رايح فين؟';
  static const String from = 'من';
  static const String to = 'إلى';
  static const String oneWay = 'ذهاب';
  static const String bookTicket = 'حجز تذكرة';
  static const String quickBook = 'حجز سريع';
  static const String stations = 'المحطات';
  static const String trackTrain = 'تتبع قطر';
  static const String myTicketsShort = 'تذاكري';
  static const String frequentTrips = 'رحلات بتكررها';
  static String startsIn(String time) => 'يبدأ بعد $time';
  static String nextTrip(String train) => 'رحلتك الجاية · قطار $train';
  static String delayedBy(String minutes) => 'متأخر $minutes د';

  // التاب بار
  static const String tabHome = 'الرئيسية';
  static const String tabTrips = 'رحلاتي';
  static const String tabTrack = 'تتبع';
  static const String tabAccount = 'حسابي';

  // ── اختيار المحطة والتاريخ ─────────────────────────────────
  static const String selectStation = 'اختار المحطة';
  static const String searchStation = 'ابحث عن محطة...';
  static const String popularStations = 'محطات بتبحث عنها';
  static const String areaAll = 'الكل';
  static const String areaCairo = 'القاهرة';
  static const String areaUpperEgypt = 'الصعيد';
  static const String areaDelta = 'الدلتا';
  static const String selectDate = 'اختار التاريخ';
  static const String oneWayOnly = 'ذهاب فقط';
  static const String roundTrip = 'ذهاب وعودة';
  static const String confirmDate = 'تأكيد التاريخ';

  // ── نتائج البحث واختيار الكرسي ─────────────────────────────
  static const String chooseSeat = 'اختيار الكرسي';
  static const String selectSeatTitle = 'اختار كرسيك';
  static const String confirmBooking = 'تأكيد الحجز';
  static const String addPassenger = 'إضافة راكب';
  static const String savedPassengers = 'الركاب المحفوظين';
  static String seatsLeft(int n) => 'متبقي $n كرسي';
  static String carAndSeat(String car, String seat) => 'عربة $car · كرسي $seat';
  static String trainNumber(String n) => 'قطر $n';

  // ── تنبيه شروط التفعيل ────────────────────────────────────
  static const String activationTitle = 'لازم تفعّل تذكرتك من المحطة';
  static const String departureTime = 'ميعاد القطر';
  static const String activationDeadline = 'آخر ميعاد للتفعيل';
  static const String arriveAtStation = 'الوصول للمحطة';
  static const String activationRule1 =
      'كون موجود في المحطة قبل ميعاد القطر بساعة على الأقل.';
  static const String activationRule2 =
      'فعّل التذكرة من شباك المحطة عن طريق مسح الـ QR.';
  static const String activationRule3 =
      'لو التذكرة ماتفعلتش قبل الميعاد بـ 30 دقيقة، هتتلغي فورًا.';
  static const String activationFineNote =
      'هتتحسب عليك غرامة بقيمة ثمن التذكرة (1/8)، وبتتدفع مع تذكرتك الجاية في الشباك.';
  static const String understoodAndAgree = 'فهمت الشروط وموافق';
  static const String agreeAndContinue = 'أوافق وأكمل الحجز';

  // ── تأكيد الحجز والتذكرة ──────────────────────────────────
  static const String bookingConfirmed = 'تم الحجز بنجاح';
  static String activateBeforeNote(String time) =>
      'فعّل تذكرتك من الشباك قبل $time وإلا هتتلغي';
  static const String beAtStationBefore =
      'كون في المحطة قبل القطر بساعة لتفعيل تذكرتك';
  static String activationDeadlineNote(String time) =>
      'آخر ميعاد للتفعيل $time. لو ماتفعلتش هتتلغي ويتحسب عليك غرامة 1/8 ثمن التذكرة.';
  static const String status = 'الحالة';
  static const String pendingActivation = 'بانتظار التفعيل';
  static const String activated = 'مفعّلة';
  static const String viewTicket = 'عرض التذكرة';
  static const String saveOnPhone = 'حفظ في الموبايل';
  static const String bookingDate = 'تاريخ الحجز';
  static const String ticketStatus = 'حالة التذكرة';
  static const String bookingNumber = 'رقم الحجز';

  // ── الإلغاء والغرامة ──────────────────────────────────────
  static const String cancelTicket = 'إلغاء التذكرة';
  static const String cancelWarning =
      'الإلغاء بيرجّع الكرسي متاح لغيرك، ومينفعش يتراجع عنه.';
  static const String autoCancelledTitle = 'اتلغت تذكرتك تلقائي';
  static String autoCancelledReason(String time) =>
      'ماتفعلتش قبل الميعاد بـ 30 دقيقة ($time)';
  static const String autoCancelled = 'اتلغت تلقائي';
  static const String fineDue = 'غرامة مستحقة';
  static const String fineDueBody =
      'ثمن التذكرة (1/8)، هتتدفع في شباك المحطة مع تذكرتك الجاية.';
  static const String seatReleased = 'الكرسي رجع متاح لغيرك.';
  static const String bookNewTicket = 'احجز تذكرة جديدة';
  static const String fineBanner =
      'عليك غرامة مستحقة (1/8 ثمن تذكرة اتلغت تلقائي)، هتتدفع مع تذكرتك الجاية.';
  static const String due = 'مستحقة';

  // ── رحلاتي ────────────────────────────────────────────────
  static const String myTrips = 'رحلاتي';
  static const String tripsUpcoming = 'قادمة';
  static const String tripsPast = 'منتهية';
  static const String tripsCancelled = 'ملغية';
  static const String completed = 'اكتملت';
  static const String rateYourTrip = 'قيّم رحلتك';
  static String ratedOutOf(int n) => 'تم التقييم · $n من 5';
  static const String bookReturn = 'احجز العودة';
  static const String notBooked = 'لم تُحجز';

  // ── التتبع والإشعارات ─────────────────────────────────────
  static const String liveTracking = 'تتبع القطر';
  static const String notifications = 'الإشعارات';
  static const String ticketActivated = 'تم تفعيل تذكرتك';
  static const String oneHourLeft = 'فاضل ساعة على قطر 971';
  static const String goToStationReminder =
      'روح شباك المحطة لتفعيل تذكرتك قبل 06:35';

  // ── تقييم الرحلة ──────────────────────────────────────────
  static const String rateTripTitle = 'قيّم رحلتك';
  static String submitRating(int points) => 'إرسال التقييم · +$points نقاط';
  static const String howWasTrip = 'إزاي كانت رحلتك؟';
  static const String whatDidYouLike = 'إيه اللي عجبك؟';
  static const String yourNotes = 'ملاحظاتك (اختياري)';
  static const String notesHint = 'اكتب أي حاجة تحب نعرفها...';

  // ── الحساب والنقاط والإعدادات ──────────────────────────────
  static const String account = 'حسابي';
  static const String loyaltyPoints = 'نقاط الولاء';
  static const String points = 'نقطة';
  static const String redeemPoints = 'استبدل نقاطك';
  static const String earnPoints = 'طرق كسب النقاط';
  static const String redeem = 'استبدل';
  static const String settings = 'الإعدادات';
  static const String language = 'اللغة';
  static const String theme = 'المظهر';
  static const String fontSize = 'حجم الخط';
  static const String security = 'الأمان';
  static const String logout = 'تسجيل الخروج';
  static const String suggestionsComplaints = 'اقتراحات وشكاوى';
  static const String support = 'الدعم';
  static const String liveChat = 'شات مباشر';

  // ── مفيش إنترنت ───────────────────────────────────────────
  static const String offlineTitle = 'مفيش إنترنت';
  static const String offlineBody =
      'تذاكرك المحفوظة لسه متاحة، وتقدر تحاول تاني لما النت يرجع.';
  static const String retryConnection = 'إعادة المحاولة';
  static const String viewSavedTickets = 'عرض التذاكر المحفوظة';

  // ── المساعد الذكي ─────────────────────────────────────────
  static const String assistant = 'المساعد الذكي';
  static const String online = 'متصل الآن';
  static const String talkToAgent = 'تحدث مع موظف';
  static const String typeYourQuestion = 'اكتب سؤالك...';

}