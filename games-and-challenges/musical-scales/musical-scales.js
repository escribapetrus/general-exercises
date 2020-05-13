const   chromatic = ['a','a#','b','c','c#','d','d#','e','f','f#','g','g#'],
        patterns = {
            major: [0,2,4,5,7,9,11],
            minor: [0,2,3,5,7,8,10],
            major_harmonic: [0,2,4,5,7,8,11],
            minor_harmonic: [0,2,3,5,7,8,11],
            major_pentatonic: [0,2,4,7,9],
            minor_pentatonic: [0,3,5,7,10]
        };

function reorderScale(arr,idx) {
    let ini = arr.slice(0,idx);
    let end = arr.slice(idx,arr.length)
    return end.concat(ini)
};
function getScale(arr,pat){
    return arr.filter(note => pat.includes(arr.indexOf(note)))
};

var button = document.querySelector('button'),
    result = document.querySelector('.result')
button.addEventListener('click', () => {
    let key = document.querySelector('input:checked').value,
        pattern = document.querySelector('option:checked').value;
    if (key && pattern) {
        let scale = (getScale(reorderScale(chromatic,chromatic.indexOf(key)),patterns[pattern]));
        addElement(result,scale)
    }
})

function addElement (location,content) {
    location.innerHTML = content
}
