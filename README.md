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

### **The Architecture Of pwm_basic**
<img width="932" height="328" alt="image" src="https://github.com/user-attachments/assets/00327899-4fb6-46c2-8e1e-25ea818cc8f4" />

There are two main components of this design, the **Up Counter** and the **Comparator**.
Let's assume that the counter is of 8 bits, i.e. it can count from 0-255. Now if duty is 128 (the input), the comparator will output 1 till the comparator's output is less than 128. When the counter reaches 128, the comparator outputs a 0. The input duty controls the duty cycle.
At 128 it will output 0, so the duty cycle we get is [(128/256)*100], which comes out to be 50% duty cycle.

### **pwm_basic Implementation**
<img width="1582" height="770" alt="image" src="https://github.com/user-attachments/assets/64910165-a75c-42b3-86c9-e5abfc71993e" />

### **pwm_basic Schematic**
<img width="1026" height="298" alt="image" src="https://github.com/user-attachments/assets/a8f0d82e-2dfa-4a0b-bb08-06b777da8ec9" />

### **pwm_basic Simulation & Analysis**
<img width="1725" height="665" alt="image" src="https://github.com/user-attachments/assets/021764e5-4206-47c9-bfca-ebceeb2c80f2" />

In this simulation, I used 64 as the input d to the dut (desgin under test) via my testbench. Doing some quick mathematics, the duty cycle comes out to be ((64/256)*100) = 25%. We can also confirm this analytically via the waveform. The signal is ON for 2.56us and the total time period is 10.24us. Again doing some quick mathematics, the duty cycle comes out to be ((2.56/10.24)*100) = 25%. 

### **A Word Of Caution**

A very important thing to keep in mind which I missed initially (which led to a lot of brain racking) is to adjust the simulation time according to the clock you are providing. In my case, I am used a 25Mhz clock, which is a 40ns time period clock. My counter counts upto 256. For every count, it takes 40ns (1 clock edge), so for 256, it will take (256*40 = 10,240ns). So keep in mind that to see your waveform, the simulation time needs to be atleast (R<sub>BITS</sub>*T<sub>CLK</sub>).

### **Revisting The Mathematics Of PWM**

### **The Architecture Of pwm_enhanced**

### **pwm_enhanced Implementation**

### **pwm_enhanced Schematic**
<img width="1533" height="413" alt="image" src="https://github.com/user-attachments/assets/c0b2c64f-cde2-4ed9-8eea-2d034b6f293b" />


### **pwm_enhanced Simulation & Analysis**


















  
