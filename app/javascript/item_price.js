const price = () => {

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const addProfitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = parseFloat(priceInput.value);

  const taxAmount = Math.floor(inputValue * 0.1);
  const profitAmount = Math.floor(inputValue - taxAmount);

  addTaxDom.innerHTML = taxAmount;
  addProfitDom.innerHTML = profitAmount;
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);