import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

// https://flatpickr.js.org/localization/
const flatpickerInit = () => {
  
  flatpickr(".datetimepicker", { 
    enableTime: true,
    "locale": French,
    altInput: true,
    altFormat: "j F, Y",
    minDate: "today",
    mode: "multiple",
    dateFormat: "Y-m-d"
  });
  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "10:00",
    mode: "range",
    time_24hr: true,
    minTime: "10:00",
  });
}  

export { flatpickerInit };
