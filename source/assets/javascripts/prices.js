const tableWrapper = document.querySelector(".table-wrapper");
const switchInputs = document.querySelectorAll(".switch-wrapper input");
const prices = tableWrapper.querySelectorAll(".price");
const descriptions = tableWrapper.querySelectorAll(".description");
const toggleClass = "hide";

for (const switchInput of switchInputs) {
  switchInput.addEventListener("input", function () {
    for (const price of prices) {
      price.classList.add(toggleClass);
    }
    const activePrices = tableWrapper.querySelectorAll(
      `.price.${switchInput.id}`
    );
    for (const activePrice of activePrices) {
      activePrice.classList.remove(toggleClass);
    }
    for (const description of descriptions) {
      description.classList.add(toggleClass);
    }
    const activeDescriptions = tableWrapper.querySelectorAll(
      `.description.${switchInput.id}`
    );
    for (const activeDescription of activeDescriptions) {
      activeDescription.classList.remove(toggleClass);
    }
  });
}
