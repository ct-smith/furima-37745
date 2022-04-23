 function calc() {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const tax_rate = 0.1
    const commission = Math.floor(inputValue * tax_rate);
    addTaxPrice.innerHTML = commission
    profit.innerHTML = inputValue - commission;
  })
}

window.addEventListener('load',calc)