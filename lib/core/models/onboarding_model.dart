import 'package:notifyme/core/models/svgs.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
    title: 'Your Privacy Matters!',
    subtitle: 'We care about your privacy like we do our own.\n'
        'We do not store or track your information from your upwork profile. Beware of apps that do OTHERWISE.',
    image: Images.security,
  ),
  OnboardingModel(
    title: 'Use 2-Factor Authentication',
    subtitle:
        'Your credentials could be used for malicious attacks on your account. '
        'Use Two-Factor Authentication to keep your account safe and sound. '
        'That\'s how much we care about you and your security.\n'
        'STAY SAFE n\' SOUND.',
    image: Images.twofa,
  ),
  OnboardingModel(
    title: 'How does notifyMe work?',
    subtitle: 'We get the jobs on your upwork page and notify you accordingly. '
        'Simple, sweet and efficient...\n'
        'Populate your upwork feed with relevant keywords by regularly searching for jobs that interest you,'
        '\n MADE 4 U BY U',
    image: Images.how,
  ),
  OnboardingModel(
    title: 'Why we use Ads',
    subtitle: 'Ads keep us free and consistantly improving. '
        'And we DEFINITELY want to improve the process and experience! '
        'If you really want to go ads free,\nGO PRO.',
    image: Images.ads,
  ),
  OnboardingModel(
    title: 'How do I get started?',
    subtitle: 'Simply sign in directly to the upwork webview where '
        'your session and account is directly vetted and handled by upwork without any intermidiary. '
        'Ensure to click on "keep me logged in" to keep your session alive on upwork and that\'s it,'
        '\nYOU ARE ALL SET.',
    image: Images.started,
  ),
];
