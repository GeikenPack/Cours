class Compteur {
    constructor(val = 0) {
        this.score = val
        this.nbCoups = 0
    }

    ajout(val){
        this.score += new Number(val)
        this.nbCoups++
    }
}