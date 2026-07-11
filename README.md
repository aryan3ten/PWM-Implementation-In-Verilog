# PWM Controller in Verilog

## This project is a basic bare implementation of a PWM Controller in Vivado. This was undertaken to better understand how PWM control is implemented in microcontrollers.

### **The Setup**
The project was made using Vivado. Two main implementations were implemented, one is a basic implementation and the other is an enhancement of the same.

### **Overview Of PWM**
PWM (Pulse Width Modulation) is a method of mimicing an analog signal by changing the duty cycle ("ON" Time of the signal). 
It's useful for controlling the average power or amplitude delivered by an electrical signal. The average value of voltage fed 
to the load is controlled by switching the supply between 0-100%.


### **Applications Of PWM**
* `Servo Motors` - PWM signal is used to control the rotational speed of servo motors
* `Telecommunications` - PWM is a form of signal modulation where the widths of the pulses correspond to specifc data values. Pulses of various lengths (the information) will be sent at regular intervals.
* `Power Delivery` - It's used to control the amount of power delievered to a load without incurring the losses that would result from linear power delivery by resistive means. High frequency PWM power control systems are easily realisable with semiconductor switches. Very power efficient. Even variable speed computer fan controllers use PWM!!
* `Light Dimmers` - Light dimmers for home use PWM control
  
