
const toggleSlot = (event) => {
  const slots = document.querySelectorAll('.slot');
  slots.forEach(slot => {
    slot.style.backgroundColor = "#B31B34";
  })
  event.currentTarget.style.backgroundColor = "#FFDD67";
  const true_date = event.currentTarget.querySelector("#true_date")
  const input_to_change = true_date.closest(".calendar_toggle_input").querySelector(".new_booking_start_time")
  input_to_change.value = event.currentTarget.querySelector("#true_date").innerText;
  console.log(input_to_change.value);
}


const bindSlot = (slot) => {
  console.log("hello2");
  slot.addEventListener("click", toggleSlot);
}


const initFormBooking = () => {
  console.log("hello1");
  const slots = document.querySelectorAll('.slot');
  slots.forEach(bindSlot)
}

export { initFormBooking };

