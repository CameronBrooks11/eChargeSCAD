# eChargeSCAD

OpenSCAD script for the calculation and generation of ejection charges, read the [disclaimer](DISCLAIMER.md) before getting started.

## Description

**Important:** This script only provides an estimate of the amount of powder required. Too much or too little may result in a failed recovery or damage to your rocket. **ALWAYS** ground test your rocket before flying.

Ejection occurs when the chamber containing the recovery system is pressurized with sufficient force to eject the recovery system from the chamber. The force required can vary according to several factors:

- Diameter and volume of the body tube
- Mass of the nose and recovery system
- Ejection method, for example, piston systems require less pressure
- Presence of shear pins used to prevent drag separation
- Fit of the recovery system in the body tube

As such, this calculator will only give you a starting estimate. Too little powder will result in a failed ejection and a failed recovery. Too much powder may result in damage to the rocket or recovery system, which may also result in a failed recovery. It is **ALWAYS** necessary to do a ground test before flying your rocket.

When calculating the volume of the body tube, it is rarely necessary to include the full length. For example, the shoulder of the nose or electronics bay may consume some volume. Adjust your length specification accordingly.

There are some rules of thumb that can be applied based on years of experience from multiple rocket builders. Of primary concern here is the force applied to the ejectable portion, typically the nose cone or electronics bay. Ejection forces at this interface should be between 150 and 200 lbf (~667 to 890 N). The pressure required can then be calculated based on the volume of the chamber. This pressure will be less for larger diameters and more for smaller diameters. There are presets in the calculator to set these forces (low and high settings).

Ground testing should start at the low end of the recommended range to prevent damage to your rocket. Increase the amount as required to ensure safe recovery.

## Usage

Set parameters in the script.

## Calculations 
### Black Powder Calculation

Pressure is set by desired force, or force can be set by specifying the desired pressure. This is based on the force applied to the area at the end of the volume to be pressurized.*See the next section for how to use the shear screw calculation function for determining the required ejection force and minimum shear pin / screw specifications to withstand flight*.

$P = \frac{F}{\pi \left( \frac{D}{2} \right)^2}$

where

- $F$ = desired force
- $D$ = body tube diameter

Once the desired pressure is known, the amount of black powder can be calculated using

$m = \frac{PV}{R_c T g}$

where

- $P$ = the pressure calculated in the previous equation
- $V$ = the volume of the chamber to be pressurized
- $R_c = 12.1579\, \frac{m}{K}$, combustion gas constant for FFFFg black powder
- $T = 1739\, K$, combustion gas temperature
- $g = 9.807\, \frac{m}{s^2}$, acceleration due to gravity



### Units

Calculations are done using metric units, but will display in your preferred units. Values can also be entered using any supported units by including the units with the value (e.g., 5 oz, or 23.2 g).

## References

1. [FreeCAD Rocket- Rocket Ejection Charge Calculator](https://wiki.freecad.org/Rocket_Ejection_Charge_Calculator)
1. [VernK Ejection Charge Sizing](http://vernk.com/EjectionChargeSizing.htm)
2. [Insane Rocketry - Black Powder](https://www.insanerocketry.com/blackpowder.html)
3. [Rocketry Calculator - BP Estimator](https://rocketrycalculator.com/rocketry-calculator/bp-estimator)
4. [Rockethead - Black Powder Calculator](http://www.rockethead.net/black_powder_calculator.htm)
5. [HARA - How to Size Ejection Charge](http://hararocketry.org/hara/resources/how-to-size-ejection-charge)
