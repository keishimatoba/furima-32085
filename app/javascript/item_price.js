window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
 
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  
  
    const saleProfit = document.getElementById("profit"); 
      const value_result = inputValue * 0.1
      saleProfit.innerHTML = (Math.floor(inputValue - value_result));      
    })
});

// 金額を入力した数値をpriceInputという変数に格納する
