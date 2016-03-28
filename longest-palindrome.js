longestPalindrome = function(s){
  array = s.replace(/\ /g,"").split("");
  object = {};

  // Count each letter
  for (i = 0; i < array.length; i ++) {
    object[array[i]] = (typeof object[array[i]] === "undefined")? 1 : object[array[i]] + 1;
  }

  var palindromeLength = 0;
  var propertiesCount = 0;
  var validLettersCount = 0;
  for (var property in object) {
    propertiesCount ++;
    if (object[property] > 1) {
      validLettersCount ++;
      palindromeLength += Math.floor(object[property] / 2) * 2;
    }
  }

  return (validLettersCount < propertiesCount)? palindromeLength + 1 : palindromeLength;
}