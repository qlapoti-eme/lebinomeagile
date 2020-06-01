import flatpickr from "flatpickr";

const flatpickerInit = () => {
  flatpickr(".datepicker", {});
  flatpickr(".datetimepicker", { enableTime: true });
}  

export { flatpickerInit };
