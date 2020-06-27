require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/welcome/welcome';
import '../components/welcome_script';

require("trix")
require("@rails/actiontext")

require.context('../images', true)