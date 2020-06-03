
const toggleInput = (event) => {
  console.log(event.target.parentNode.parentNode)
  const start_time = event.target.parentNode.parentNode.querySelector('.d-none.new_booking_start_time');
  start_time.value = event.target.value
  console.log(start_time);
}

const initFormBooking = () => {
  const slot = document.querySelector('.slots_start_time');
  console.log(slot)
  if (slot){
    slot.addEventListener("change", toggleInput)
  }
}

export { initFormBooking };

