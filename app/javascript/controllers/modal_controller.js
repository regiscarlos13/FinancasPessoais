// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {

	initialize() {
		const select_ano = document.cookie 

 		if (window.location.pathname !== "/anos/new") {
			if (select_ano.indexOf('selected_year') == -1) {
				$('#ano_modal').modal({backdrop: 'static', keyboard: false})
			}
		
		}


	}
	connect() {
	}
}
