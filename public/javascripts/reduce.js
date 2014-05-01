function reduce(numerator,denominator){
  var gcd = function gcd(a,b){
    return b ? gcd(b, a%b) : a;
  };
  gcd = gcd(numerator,denominator);
  num=numerator/gcd
  den=denominator/gcd
 
  if(den<0){num=-num;den=-den}
  
  return [num, den];
}