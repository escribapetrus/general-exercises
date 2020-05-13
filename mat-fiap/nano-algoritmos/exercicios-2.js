const lodash = require('lodash')
const print = console.log
//EX. 2
function isComputable(a,b,c){
    let delta = ((b**2)-(4*a*c))
    let computable = (delta >= 0)
    return computable
}

//EX. 5
function twoGreaterOfThree(x,y,z){
    let greater = (a,b) => (a >= b);
    if (greater(y,x) && greater(z,y)) {
        return [z,y]
    } else if (greater(x,y) && greater(z,y)) {
        return [x,z]
    } else {
        return [x,y]
    }
}

// EX. 6
function parOuImpar(x,y){
    let par = (x) => (x % 2 == 0)
    if (par(x) && par(y)) {
        return "ambos pares"
    } else if (!(par(x)) && !(par(y))) {
        return "ambos impares"
    } else {
        return "par e impar"
    }
}

// EX. 7
function maiorMenosMenor(x,y){
    if (x >= y) {
        return (x - y)
    } else {
        return (y - x)
    }
}

// EX. 8
function maiorMenosMenorOuIgual(x,y){
    if (x > y) {
        return (x - y)
    } 
    else if (x < y) {
        return (y - x)
    }
    else{
        return "são iguais"
    }
}

//EX. 9
const plans = [[1,2,3],[2,3,4],[3,4,5],[4,5,6],[7,8,9]]
function findPlan(age,risk){
    let x = age - 1, y = risk - 1;
    return plans[x][y]
}

// EX. 10
function coin_change(money){
    const coins = [.01,.05,.1,.25,.5,1,5];
    let flag, balance;
    //SELECT HIGHEST COIN AVAILABLE
    for (let i = 0; i < coins.length; i++) {
        const el = coins[i];
        if (el == money) {
            return el
        } else {
            flag = el
        }
    }
    balance = money - flag
    result = [flag, coin_change(balance)]

    return lodash.flatten(result)

}
print(coin_change(.25))