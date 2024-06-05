# Shear Pin/Screw Calculations

From: https://feretich.com/Rocketry/Resources/shearPins.html

## Shear Strength

The important material property for a shear pin is the shear strength of the material from which the pin is made. The shear strength can be found on the websites of the manufacturers and distributors of the material. The specified strength is for new material at 73°F. Shear strength is measured by the push or pull against the side of a fastener until the fastener breaks. If a tensile strength is specified, but a shear strength is not, the shear strength can be approximated as 2/3rds the tensile strength.

Shear strength is usually specified in pounds per square inch (psi). The number is used by multiplying it by the cross-sectional area of the pin (or screw) measured in square inches.

The strength specifications of a material may vary between manufacturers, sometimes greatly. Polystyrene, for example, is available in tensile strengths from 1500 to 7000 psi. Other materials such as Nylon 6/6 have much tighter specifications, 9600 to 10500 psi. If you can't buy a "strength rated" component, you can calculate the shear strength range.

## Material Quality

The published shear strengths only apply to the materials in the condition that they are shipped from the manufacturer. Plastics often absorb moisture, which will weaken them. Exposure to ultraviolet light and sunlight also weakens plastics.

The final product, e.g., "nylon screws," often only vaguely identifies the material from which the product is made. Generic nylon screws could be made from Nylon 6, Nylon 6/6, Nylon 6/12, or a blend of nylons and other materials. Screws purchased from the local hardware store typically do not specify the exact material from which they are made. On the other hand, when ordered from an industrial supplier like McMaster-Carr, not only is the exact material specified, but often a "strength rated" version of the component is available.

## Cross-sectional Area

The cross-sectional area of a round shear pin is simple to compute:

$\text{area} = \pi \times \left( \frac{\text{diameter}}{2} \right)^2 $

The computation for a screw is more complicated. Because of the screw's threads, the diameter of the screw that should be used is less obvious. The narrowest cross-section of a screw, between the threads, is called the screw's "minor diameter." The cross-sectional area at this point is the "minor area." However, if the shear is forced to occur exactly orthogonal to the screw's axis due to a very close fit of the surfaces causing the shear, the shear cross-section will be forced to include part of the larger diameter of the thread. The screw's "pitch area" is a good approximation of this perfectly orthogonal shear cross-section. A good practice is to compute a range of shear forces within which the shear screw will break. Use the minor area to compute the minimum shear force needed to break a shear screw. Use the pitch area to compute the maximum shear force needed to break a shear screw.

## Example Using Nylon 6/6 Shear Screws

We want to choose the shear screws needed to resist a 5.5 psi pressure differential between internal trapped air and the air outside the rocket. This is the pressure differential that would occur if the rocket traveled to 12,000 feet without venting any trapped air. We will assume that the coupler to body tube fit exhibits friction that needs 5 pounds of force to separate. A 5.5-psi pressure differential in a 6-inch diameter rocket results in section separation force of about 155 pounds. (force = 5.5 times the area of a 6-inch circle) Given that 5 pounds are needed to overcome the coupler friction, the shear screws need to withstand 150 pounds of force. Our web search showed Nylon 6/6 shear strengths ranging from 9600 to 10500 psi. We also found that McMaster-Carr stocks Nylon 6/6 screws in 2-56, 4-40, 6-32 UNC sizes; and M2 and M3 metric screw sizes. Using online screw tables to find the pitch diameter and minor diameter for these screws, we calculate the pitch and minor areas. Finally, we compute the minimum shear strength of the screw by multiplying the minor area by the smaller material shear strength value; and compute the maximum shear strength of the screw by multiplying the pitch area by the larger material shear strength value.

| Screw Size | Diameters (in) | Areas (sq in) | Shear Strength (lbs) |
|------------|----------------|---------------|----------------------|
|            | Major | Pitch | Minor | Pitch  | Minor | Min | Max |
| M2         | 0.07874 | 0.06851 | 0.05942 | 0.00369 | 0.00277 | 27 | 39 |
| 2-56       | 0.08600 | 0.07440 | 0.06410 | 0.00435 | 0.00323 | 31 | 46 |
| 4-40       | 0.11200 | 0.09576 | 0.08130 | 0.00720 | 0.00519 | 50 | 76 |
| M3         | 0.11811 | 0.10532 | 0.09396 | 0.00871 | 0.00693 | 67 | 91 |
| 6-32       | 0.13800 | 0.11770 | 0.09970 | 0.01088 | 0.00781 | 75 | 114 |

Using the "minimum shear strength" column, three 4-40 screws are adequate to withstand the pressure differential. The ejection charge would have to generate an additional 3 psi, plus replace any pressure loss due to the trapped air leaking out, to guarantee the screws would shear. To be safe, the ejection charge should be sized to produce the full 8.5 psi needed to shear the screws.

## Other Shear Pin/Screw Issues

Shear pins/screws should be equally positioned around the circumference of the rocket. Never use just one pin, because the coupler may cock and bind.

When using screws, don't tap both the body and the coupler and cause premature shearing. The slight threading mismatch will add stress to the screw. Tapping the body tube only makes removal of the sheared screw easy and does not stress the screw.
