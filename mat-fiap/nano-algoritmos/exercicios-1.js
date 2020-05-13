// EX. 1 - DIVISORES

function divisores(x){
    let nums = [...Array(x).keys()].map((i) => (i+1));
    res = nums.filter((i) => (x % i == 0));
    return res
}
console.log(divisores(12))

// EX. 2 - SALARIO
function salario(x){
    let salMes = (x * 4.5);
    let salGrat = (salMes * 1.1);
    let salFin = salGrat + (salGrat / 6);
    return salFin
}
console.log(salario(1000))

// EX. 3 - SOMAMEDIA
function somamedia(x,y,z){
    let soma = (x,y,z) => (x+y+z)
    let media = (x,y,z) => ((soma(x,y,z))/3)
    return [soma(x,y,z),media(x,y,z)]
}
console.log(somamedia(144, 13,15))

// EX. 4 - SUBTRACAO
const subtracao = (x,y) => (x - y)
console.log(subtracao(545,2324))