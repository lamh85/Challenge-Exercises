function findNumber(array) {
  for (i = 1; i <= (array.length + 1); i++ ) {
    if (array.indexOf(i) === -1) {
      return i;
    }
  }
}