const toggleInput = (event) => {
  const primary = document.querySelector(`#${event.target.value.toLowerCase().replace(" ", "-")}`);
  document.querySelectorAll(".secondary-input").forEach((input) => {
    input.classList.add("d-none")
  })
  if (event.target.checked) primary.classList.remove("d-none")
}

const initFormProposal = () => {
  const cat1 = document.querySelector('.proposal_primary_category')
  cat1.addEventListener("change", toggleInput)
}

export { initFormProposal };
