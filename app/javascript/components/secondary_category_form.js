const setSecondaryOptions = (event) => {
  document.querySelector("#proposal_secondary_category").value = event.target.value
}



const toggleInput = (event) => {
  const primary = document.querySelector(`#${event.target.value.toLowerCase().replace(" ", "-")}`);
  document.querySelectorAll(".secondary-input").forEach((input) => {
    input.classList.add("d-none");
  })
  if (event.target.checked) {
    primary.classList.remove("d-none")
  }
}

const initFormProposal = () => {
  const cat1 = document.querySelector('.proposal_primary_category')
  cat1.addEventListener("change", toggleInput)
}


const initSecondaryOptions = () => {
  const inputs = document.querySelectorAll(".secondary_options_secondary input")
  inputs.forEach((input) => {
    input.addEventListener("click", setSecondaryOptions)
  })
}


export { initFormProposal };
export { initSecondaryOptions };
