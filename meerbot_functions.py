from gpiozero import Motor
from gpiozero import LED
from time import sleep

def stop_motors():
    motor1.stop()
    motor2.stop()

def forward():
    motor1.forward()
    motor2.forward()
    #sleep(1)

def backward():
    motor1.backward()
    motor2.backward()
    #sleep(1)

def right():
    motor1.forward()
    #sleep(1)

def left():
    motor2.forward()
    #sleep(1)

def blue_led_on():
    led_blue_22.on()

def blue_led_off():
    led_blue_22.off()

def right_circle():
    motor1.forward()
    motor2.forward(0.75)

def lights():
    for i in range(10):
        led_blue_22.on()
        sleep(0.5)
        led_blue_22.off()
        led_red_18.on()
        sleep(0.5)
        led_red_18.off()

def trick():

    for i in range(3):

        led_blue_22.on()
        motor1.forward()
        motor2.forward()
        sleep(1)
        led_blue_22.off()

        motor2.stop()
        motor1.forward()
        sleep(1)


        led_red_18.on()
        motor1.backward()
        motor2.backward()
        sleep(1)
        led_red_18.off()







motor1 = Motor(forward=25, backward=23)
motor2 = Motor(forward=13, backward=19)
led_red_18=LED(18)
led_blue_22=LED(22)


#sleep(3)
#for i in range(3):
#    led_blue_22.on()
#    motor1.forward()
#    motor2.forward()
#    sleep(1)
#    led_blue_22.off()


#    motor2.stop()
#    motor1.forward()
#    sleep(1)


#   led_red_18.on()
#    motor1.backward()
#    motor2.backward()
#    sleep(1)
#    led_red_18.off()

#motor1.backward()
#motor2.backward()
#sleep(5)
