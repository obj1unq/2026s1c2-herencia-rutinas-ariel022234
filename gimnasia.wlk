class Rutina {
    var property tiempo = 0
    var property descanso = 0
    var property intensidad = 0 
    

    method quemaDeCalorias() {
      return 100 * (self.tiempo() - self.descanso()) * self.intensidad()
    } 
}

class Running inherits Rutina {
  override method descanso() {
    if (tiempo > 20) {
        return 5
    }
    else {
        return 2
    }
  }
}

class Maraton inherits Running {
  override method quemaDeCalorias() {
    return super() * 2
  }
}

class Remo inherits Rutina {
  override method intensidad() {
    return 1.3
  }

  override method descanso() {
    return tiempo / 5 
  }
}

class RemoCompeticion inherits Remo  {
  override method intensidad() {
    return 1.7
  }

  override method descanso() {
    return 2.max(super() - 3)
  }
  
}

class Persona {
  var property peso =  0 
  var property rutina = null
  
  

  method pesoPerdido() {
      const quemaDeCaloriasR = rutina.quemaDeCalorias() 
      return  quemaDeCaloriasR / self.kilosPorCaloria()
  }

  method kilosPorCaloria()

  method tiempoPractica() 

  method tiempoRutina() {
    rutina.tiempo(self.tiempoPractica())
  }

  method practicarRutina() {
    peso = peso - self.pesoPerdido()
  }


}

class PersonaSedentaria inherits Persona {
  var property tiempoElegido = 0

  
  override method kilosPorCaloria() {
    return 7000
  }

  override method tiempoPractica() {
      return tiempoElegido
  }
  

  override method practicarRutina() {
    self.tiempoRutina()
    if (peso > 50) {
      super()
    }
  }
 
 }

 class PersonaAtleta inherits Persona {

   override method kilosPorCaloria() {
    return 8000
  }

  override method tiempoPractica() {
    return 90
  }
  
  override method pesoPerdido() {
    return super() - 1
  }

  override method practicarRutina() {
    self.tiempoRutina()
    const caloriasQueConsumiria = rutina.quemaDeCalorias()
    if (caloriasQueConsumiria > 10000) {
        super()
    }
  }

  
 }

 class Club {
   const property predios = []

   method agregarPredio(unPredio) {
        predios.add(unPredio)
    }

    //Este method me va a comparar cada predio con la suma de todas sus rutinas para x persona
    method elMejorPredioPara(persona) {
      return predios.max({predio => predio.todasLasRutinasPara(persona)})
    }
    //Este method me va a dar solo los predios que cumplas la condicion dada
    method prediosTranquisPara(persona) {
      return predios.filter({predio => predio.tieneRutinaTranquiPara(persona)})
    }
    //Este mehtod va a transformar la lista de predios en una lista de rutinas de cada predio 
    //Con la condicion de que cada una de esas rutinas sean las mas exigentes de cada predio para x persona
    method rutinasMasExigentePara(persona) {
      return predios.map({predio => predio.rutinaQueMasQuemaPara(persona)})
    }


 }

 class Predio {
   const property rutinas = [] 

  //Este method va a sumar la quema de calorias de todas las rutinas para x persona
   method todasLasRutinasPara(persona) {
     return rutinas.sum({rutina => rutina.tiempo(persona.tiempoPractica())
                                   rutina.quemaDeCalorias()})
   }
  //Este method va a determinar si existe una rutina que cumpla con la condicion dada
   method tieneRutinaTranquiPara(persona) {
     return rutinas.any({rutina => rutina.tiempo(persona.tiempoPractica())
                                   rutina.quemaDeCalorias() < 500}) 
   }
  //Este method me va a devolver la rutina que mas quema de calorias tiene de la lista de rutinas
   method rutinaQueMasQuemaPara(persona) {
     return rutinas.max({rutina => rutina.tiempo(persona.tiempoPractica())
                                   rutina.quemaDeCalorias()})
   }
 }


 object clubBarrial inherits Club {
   
 }