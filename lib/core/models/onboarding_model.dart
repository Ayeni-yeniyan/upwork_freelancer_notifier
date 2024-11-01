class OnboardingModel {
  final String title;
  final String subtitle;
  final String icon;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
    title: 'Your Privacy Matters!',
    subtitle: 'We care about your privacy like we do our own. '
        'We do not store/track your information from your upwork profile.',
    icon: 'icon',
  ),
  OnboardingModel(
    title: 'Use Two-Factor Authentication',
    subtitle:
        'Your credentials could be used for malicious attacks on your account. '
        'Use Two-Factor Authentication to keep your account safe.',
    icon: 'icon',
  ),
  OnboardingModel(
    title: 'How does notifyMe work?',
    subtitle: 'We get the jobs on your upwork page and notify you accordingly. '
        'Simple, sweet and efficient...',
    icon: 'icon',
  ),
  OnboardingModel(
    title: 'Why we use Ads',
    subtitle: 'Ads keep us free and consistantly improving. '
        'And we DEFINITELY want to improve the process and experience! '
        'If you really want to go ads free,\nGO PRO.',
    icon: 'icon',
  ),
  OnboardingModel(
    title: 'How do I get started?',
    subtitle: 'Simply sign in directly to the upwork webview where '
        'your session and account is directly vetted and handled by upwork without any intermidiary. '
        'Ensure to click on Remember me to keep your session alive on upwork and that\'s it, you are all set.',
    icon: 'icon',
  ),
];
