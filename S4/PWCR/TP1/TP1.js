const imgMail = document.getElementById("mail")
const imgHome = document.getElementById('home')
const imgPap = document.getElementById('pap')
const tabPap = ["images/papillon1.jpg", "images/papillon2.jpg", "images/papillon3.JPG", "images/papillon4.jpg"]
let indicePap = 1

imgMail.onclick = function() {
    imgMail.src = "images/email_click.gif"
}
imgMail.onmouseover = function() {
    imgMail.src = "images/email_over.gif"
}
imgMail.onmouseout = function() {
    imgMail.src = "images/email.gif"
}

imgHome.onclick = function() {
    imgHome.src = "images/home_click.gif"
}
imgHome.onmouseover = function() {
    imgHome.src = "images/home_over.gif"
}
imgHome.onmouseout = function() {
    imgHome.src = "images/home.gif"
}

function clicclac(unObjet) {
    if (unObjet.value != undefined)
    {
        if (unObjet.value=='clac')
        {
            unObjet.value='clic';
        } else {
            unObjet.value='clac';
        }
    }
}

setInterval(function() {
    imgPap.src = tabPap[indicePap]
    indicePap++
        if (indicePap === tabPap.length)
        {
            indicePap = 0
        }
    },
    2000)
