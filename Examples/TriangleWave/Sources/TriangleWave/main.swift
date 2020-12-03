import SwiftIO
import MadMCP4725

let i2c = I2C(Id.I2C0, speed: .fast)
let dac = MadMCP4725(i2c)

var voltage = 0.0
var upDirection = true

while true {
    dac.setOutputVoltage(voltage)
    //print("voltage: \(dac.getOutputVoltage())")

    if upDirection {
        voltage += 0.01
        if voltage > 3.3 {
            voltage = 3.3
            upDirection = false
        }
    } else {
        voltage -= 0.01
        if voltage < 0 {
            voltage = 0
            upDirection = true
        }
    }

    //sleep(ms: 10)
}