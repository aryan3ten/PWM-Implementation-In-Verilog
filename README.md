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

### **The Mathematics & Characterisitics Of PWM**
* **Duty Cycle (d)** - It's the percentage of time the signal is high, over the time period of the total signal [d=(Ton/Ttotal)x100]
The **Average Voltage** that we get is d*Vcc.
* **Resolution** - Minimum incremental steps of the duty cycle. Specified by the number of bits R. Minimum step will be [1/2<sup>R</sup>].
If R = 8bits, the minimum incremental step is 1/256, so the possible values are 0%, 0.39%, 0.78%,.....99.6%,100%. [At multiples of 1/256]
* **Switching Frequency** - Frequency of the PWM Wave is f<sub>PWM</sub> = 1/t<sub>PWM</sub>




  
