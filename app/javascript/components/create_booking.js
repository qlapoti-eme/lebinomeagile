
// const toggleInput = (event) => {
//   console.log(event.target.parentNode.parentNode)
//
//   start_time.value = event.target.value
//   console.log(start_time);
// }

// const initFormBooking = () => {
//   const slot = document.querySelector('.slots_start_time');
//   console.log(slot)
//   if (slot){
//     slot.addEventListener("change", toggleInput)
//   }
// }
const slots = document.querySelectorAll('.slot');

const toggleSlot = (event) => {
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
  slot.addEventListener("click", toggleSlot);
}


const initFormBooking = () => {
  slots.forEach(bindSlot)
}

export { initFormBooking };

