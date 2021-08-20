import '../models/category.dart';
import 'appcolors.dart';
import 'iconhelper.dart';
class Utils {
  
  static List<Category> getMockedCategories() {
    return[
      Category(
        color: AppColors.Equipo,
        name: "La Liga",
        imgName: "laliga",
        icon: IconFontHelper.LOGO,
        leaguetag:"PD",
        subCategories: []

      ),
      Category(
        color: AppColors.FRUITS,
        name: "Bundesliga",
        imgName: "bundesliga-logo",
        icon: IconFontHelper.LOGO,
        leaguetag:"BL1",
        subCategories: []

      ),
      Category(
        color: AppColors.SEEDS,
        name: "Premier League",
        imgName: "premierleague",
        icon: IconFontHelper.LOGO,
        leaguetag:"PL",
        subCategories: []

      ),
      Category(
        color: AppColors.SPICES,
        name: "Serie A",
        imgName: "seriea",
        icon: IconFontHelper.LOGO,
        leaguetag:"SA",
        subCategories: []

      )
    ];
  }
}