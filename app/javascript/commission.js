function commission() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('input', function() {
    let price = parseInt(priceInput.value, 10);
    if (isNaN(price)) {
      price = 0;
    }
    
    const tax = Math.floor(price * 0.1);
    const profitAmount = Math.floor(price - tax);
    
    addTaxPrice.textContent = `${tax.toLocaleString()}`;
    profit.textContent = `${profitAmount.toLocaleString()}`;
  });
};

window.addEventListener('turbo:load', commission)
window.addEventListener("turbo:render", commission);