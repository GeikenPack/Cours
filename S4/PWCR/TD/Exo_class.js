const ROLE = {
    DEV : "DEV",
    MGR : "MGR",
    CDP : "CDP"
}

class Collegue {
    constructor(id, nom, role=ROLE.DEV)
    {
        this.id = id
        this.nom = nom
        this.role = role
    }

    tostring()
    {
        return "Collegue "+this.nom+" ("+this.id+") est "+this.role
    }
}

class Equipe {
    constructor(membres = [])
    {
        this.membres = membres
    }

    tostring()
    {
        let message = "Equipe: \n"
        this.membres.forEach(element => {
            message += element.toString() + "\n"
        });
        return message
    }

    ajout(m)
    {
        this.membres.push(m)
    }

    rechercherParRole(role){
        const tabRole = []
        this.membres.forEach(element => {
            if (element.role === role){
                tabRole.push(element)
            }
        });
        return new Equipe(tabRole)
    }
}