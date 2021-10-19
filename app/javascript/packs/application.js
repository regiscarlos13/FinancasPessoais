require("@rails/ujs").start()
//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//require( 'datatables.net-bs4' )(  );
//require( 'datatables.net-responsive-bs4' )();

import $ from 'jquery'
global.$ = $
global.jQuery = $


import 'bootstrap';
import '@fortawesome/fontawesome-free/js/all'

require('data-confirm-modal')

import '../js/flash_mensages'

import '../js/i18n_confirm_modal'


import './application.scss'

import "controllers"

 