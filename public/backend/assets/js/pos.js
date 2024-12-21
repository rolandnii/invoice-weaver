
document.addEventListener('DOMContentLoaded', function () {



})

function downloadPOS(event){
    event.preventDefault();
    let url = event.target.getAttribute('href');

    window.open(url,'Download POS','width=600,height=700,scrollbars=yes,resizable=no,menubar=no,location=no,status=no,toolbar=no')
}

