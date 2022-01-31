// -----------------------------------------------------------------------
// -- verifier qu'une valeur est numerique
// -----------------------------------------------------------------------
function check_numeric( champ, nomchamp ) {
    // un champ vide est consideré comme valide et valant 0 (c'est un choix)
    if (champ.value=='') {
        champ.value = 0;
        return true;
    }
    champ.value = champ.value.replace(',','.');
    conv  = parseFloat(champ.value);
    if (champ.value != conv ) {
        alert('Le champ > '+nomchamp+' < doit avoir une valeur numerique');
        champ.select();
        champ.focus();
        return false;
    } else {
        return true;
    }
}
// -----------------------------------------------------------------------
// -- verifier qu'une valeur numerique est dans l'interval [vmin..vmax]
// -----------------------------------------------------------------------
function check_valnum( champ, nomchamp, vmin, vmax ) {
    // la valeur doit avant tout etre numerique
    if ( !check_numeric(champ,nomchamp) ) {
        return false;
    }
    const val = Number(champ.value)
    return (val >=vmin && val <= vmax)
}
// -----------------------------------------------------------------------
// -- verifier qu'un champ a une taille comprise en lmin et lmax
// -----------------------------------------------------------------------
function check_size( champ, nomchamp, lmin, lmax ) {
    return (champ.value.length >= lmin && champ.value.length <= lmax)
}

// -----------------------------------------------------------------------
// -- verifier que l'index d'un champs select soit supérieur de 0
// -----------------------------------------------------------------------
function check_index_not_zero( champ, nomchamp )
{
    return champ.selectedIndex > 0;
}

// -----------------------------------------------------------------------
// -- verifier que la longueur d'un champs soit egal a celle attendu
// -----------------------------------------------------------------------
function check_strict_length( champs, nomchamps, expectedLength )
{
    return champs.value.length === expectedLength
}