class Rutina {
    var property tiempo = 0
    var property descanso = 0
    var property intensidad = 0 

    method quemaDeCalorias() {
      return 100 * (tiempo - descanso) * intensidad
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