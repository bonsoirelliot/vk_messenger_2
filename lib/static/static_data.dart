class StaticData {
  static String baseUrl = 'https://api.vk.com/method/';

  static int longPollWait = 25;

  static String longPollUrl({
    required String server,
    required String key,
    required int ts,
  }) {
    return 'https://{$server}?act=a_check&key={$key}&ts={$ts}&wait=$longPollWait&mode=2&version=3';
  }
}
