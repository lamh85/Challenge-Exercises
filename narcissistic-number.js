// For example, take 153 (3 digits):
// 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

function narcissistic( value ) {
  var stringedInput = (value).toString();
  var newArray = stringedInput.split("").map(function(element){
    return Math.pow(parseInt(element), stringedInput.length);
  });

  return newArray.reduce(function(a, b){
    return a + b;
  });
}