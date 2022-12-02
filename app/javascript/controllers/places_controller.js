import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "field", "map" ]

  connect() {
    if(typeof(google) != "undefined"){
      this.initMap()
    }
  }

  initMap(){
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(39.5, -98.35),
      zoom: 4
    })

    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    this.autocomplete.bindTo('bounds', this.map)
    this.autocomplete.setFields(['address_component', 'geometry', 'icon', 'name'])
    this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

    // this.marker = new google.maps.Marker({
    //   map: this.map,
    //   anchorPoint: new google.maps.point(0, -29)
    // })
  }

  placeChanged(){
    let place = this.autocomplete.getPlace()
    if(!place.geometry){
      console.log(`No details available for input: ${place.name}`)
      return
    }

    if(place.geometry.viewport){
      this.map.fitBounds(place.geometry.viewport)
    }else{
      this.map.setCenter(place.geometry.location)
      this.map.setZoom(17)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true)

    // this.latitudeTarget.value = place.geometry.location.lat()
    // this.longitudeTarget.value = place.geometry.location.lng()
  }


}
