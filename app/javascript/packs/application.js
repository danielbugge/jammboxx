//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

import "bootstrap";
import { deletePlaceholder }  from '../components/delete_placeholders';
import { putPlaceholder }  from '../components/put_placeholder';
import { addSearchResults }  from '../components/search_results';

deletePlaceholder();
putPlaceholder();
addSearchResults();
