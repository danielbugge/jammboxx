//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

import "bootstrap";
import { deletePlaceholder }  from '../components/delete_placeholders';
import { deletePlaceholderFilter }  from '../components/delete_placeholders';
import { putPlaceholder }  from '../components/put_placeholder';
import { slideBanner }  from '../components/slider';
import { putPlaceholderFilter }  from '../components/put_placeholder';

deletePlaceholder();
deletePlaceholderFilter();
putPlaceholder();
slideBanner();
putPlaceholderFilter();
