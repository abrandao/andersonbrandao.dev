require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../components/welcome_script';
import '../stylesheets/welcome/welcome';

require.context('../images', true)