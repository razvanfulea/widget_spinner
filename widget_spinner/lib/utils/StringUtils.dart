
class StringUtils {

  static String clearClassName(String className){
    return className.replaceAll(RegExp(r'Page'), '');
  }

}