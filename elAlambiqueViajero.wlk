object luke {
    var lugaresVisitados = 0
    const recuerdos = []
    var vehiculo = alambiqueVeloz

    method getLugaresVisitados(){
        return lugaresVisitados
    }

    method getRecuerdos(){
        return recuerdos
    }

    method getUltimoRecuerdo(){
        if(not recuerdos.isEmpty()){
            return recuerdos.last()
        }
        return null
    }

    method visitar(unaCiudad){
        if(unaCiudad.cumpleRestriccion(vehiculo)){
            alambiqueVeloz.visitarCiudad(unaCiudad)
            self.traerRecuerdo(unaCiudad)
            lugaresVisitados += 1
        }
    }

    method traerRecuerdo(unaCiudad){
        recuerdos.add(unaCiudad.getRecuerdo())
    }

    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }
}

object alambiqueVeloz {
    var combustible = 50

    method getCombustible(){
        return combustible
    }

    method esVeloz(){
        return combustible <= 25
    }

    method visitarCiudad(unaCiudad){
        if(unaCiudad.getName() == "Paris"){
            combustible -= 30
        }
        else {
            combustible -= 20
        }
    }

    method cargarCombustible(litros){
        combustible += litros
    }
}

object buenosAires {
    const recuerdo = mate
    var presidente = "Batman"

    method getName(){
        return "Buenos Aires"
    }

    method getRecuerdo(){
        return recuerdo
    }

    method getPresidente(){
        return presidente
    }

    method cumpleRestriccion(unVehiculo){
        return unVehiculo.esVeloz() && unVehiculo.getCombustible() >= 20
    }
    method cambiarPresi(){
        if(presidente == "Batman"){
            presidente = "Iron man"
        }
        else {
            presidente = "Batman"
        }
        mate.cambiarYerba(presidente)
    }

}

object mate{
    var tieneYerba = true

    method cambiarYerba(unPresidente){
        if(unPresidente == "Batman"){
            tieneYerba = true
        }
        else{
            tieneYerba = false
        }
    }

    method getYerba(){
        return tieneYerba
    }
}

object paris {
    method getName(){
        return "Paris"
    }

    method cumpleRestriccion(unVehiculo){
        return unVehiculo.getCombustible() >= 30
    }

    method getRecuerdo(){
        return llavero
    }
}

object llavero {

}

object bagdad {
    var objeto = combustibleCrudo
    
    method getRecuerdo(){
        return objeto
    }

    method getName(){
        return "Bagdad"
    }

    method cumpleRestriccion(unVehiculo){
        return unVehiculo.getCombustible() >= 20
    }

    method cambiarObjeto(){
        if (objeto.getName() == "Combustible crudo"){
            objeto = jardinesFlotantes
        }
        else if (objeto.getName() == "Jardines flotantes"){
            objeto = armas
        }
        else {
            objeto = combustibleCrudo
        }
    }
}

object combustibleCrudo {
    method getName(){
        return "Combustible crudo"
    }
}

object jardinesFlotantes {
    method getName(){
        return "Jardines flotantes"
    }
}

object armas {
    method getName(){
        return "Armas de destruccion masiva"
    }
}

object lasVegas {
    var ciudadConmemorada = buenosAires

    method getRecuerdo(){
        return ciudadConmemorada.getRecuerdo()
    }

    method getName(){
        return "Las Vegas"
    }

    method cumpleRestriccion(unVehiculo){
        return ciudadConmemorada.cumpleRestriccion(unVehiculo)
    }

    method cambiarCiudadConmemorada(){
        if(ciudadConmemorada.getName() == "Buenos aires"){
            ciudadConmemorada = paris
        }
        else if (ciudadConmemorada.getName() == "Paris"){
            ciudadConmemorada = bagdad
        }
        else {
            ciudadConmemorada = buenosAires
        }
    }
}