import 'package:get/get.dart';
import 'package:overshare2/features/profile/user_profile/models/user_profile_model.dart';
import 'package:overshare2/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  // Observable variables
  var profile = Rxn<UserProfileModel>(); // Holds the user profile
  var isLoading = false.obs; // Loading state

  // Fetch the profile based on the currently logged-in user's email
  Future<void> fetchUserProfileByEmail() async {
    isLoading.value = true; // Set loading to true
    UserProfileModel? fetchedProfile =
        await _repository.fetchUserProfileByEmail();
    if (fetchedProfile != null) {
      profile.value = fetchedProfile;
    }
    isLoading.value = false; // Set loading to false
  }
}
