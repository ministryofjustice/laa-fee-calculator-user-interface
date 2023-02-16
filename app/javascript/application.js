import { initAll } from 'govuk-frontend'
initAll()

console.log('Hello world')

window.onload = function(){
var feeSelect = document.getElementById("fee-scheme-fee-scheme-field")
feeSelect.onchange = onChangeFunction
}

function onChangeFunction(){
var feeIndex = document.getElementById("fee-scheme-fee-scheme-field").value;
var feeSelected = document.getElementById("fee-scheme-fee-scheme-field")
var chosenOption =feeSelected.querySelectorAll(`option[value="${feeIndex}"]`);
console.log(chosenOption[0].value)





fetch(`/api/fee_scheme/${chosenOption[0].value}`)
  .then((response) => response.json())
  .then((data) => { console.log(data); });
}


