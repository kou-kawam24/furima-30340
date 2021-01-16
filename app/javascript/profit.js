function profit (){
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('input', () => {
      const inputValue = itemPrice.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const saleProfit = document.getElementById("profit");
      addTaxDom.innerHTML = Math.floor(`${inputValue * 0.1}`);
      saleProfit.innerHTML = Math.floor(`${inputValue - (inputValue * 0.1)}`);
    });
}
window.addEventListener('load', profit);