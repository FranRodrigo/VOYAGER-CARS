import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "pickup", "return", "price" ]
  static values = { price: Number }


  connect() {
    console.log(this.priceValue)
  }

  getData() {
    console.log(this.targets)
  }

  price() {
    return this.priceValue;
  }

  calcPrice() {
    const pickupDay = this.pickupTarget.value
    const returnDay = this.returnTarget.value

    if (!pickupDay || !returnDay) return

    const difference = Date.parse(returnDay) - Date.parse(pickupDay)

    const rentDays = difference / 24 / 60 / 60 / 1000
    const price = this.price();
    this.priceTarget.innerText = rentDays * price + ' € for ' + rentDays + ' days';
  }
}
