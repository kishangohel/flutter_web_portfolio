import 'package:flutter_web_portfolio/features/welcome/data/models/welcome_page_model.dart';
import 'package:flutter_web_portfolio/features/welcome/data/repositories/welcome_repository.dart';

class MockWelcomePageRepository implements IWelcomePageRepository {
  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        // return Future.error('Error retrieving the welcome page data');
        return WelcomePageModel(
          name: 'Kishan',
          title: 'Flutter Developer',
          subTitle: 'Lead|Flutter|Android|Kotlin',
          imagePath:
              'https://media.licdn.com/dms/image/C5603AQEUnX0uAfSF_Q/profile-displayphoto-shrink_800_800/0/1516791716423?e=2147483647&v=beta&t=sOVDjBCWSAhKWdQvzrbK3ukIbNXU2P2oEDaw0lJVrIE',
          greetings: ["hello", "hola", "bonjour", "ciao"],
        );
      },
    );
  }
}
