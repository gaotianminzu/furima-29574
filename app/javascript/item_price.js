function itemPrice(){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input",() => {
    const inputPrice = price.value;
    addTax =`${Math.floor(inputPrice * 0.1)}`;
    tax.innerHTML = addTax
    profit.innerHTML = `${Math.floor(inputPrice - addTax)}`
  })


}

window.addEventListener("load", itemPrice )