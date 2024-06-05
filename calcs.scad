// Constants
g = 9.807; // Acceleration due to gravity (m/s^2)
Rc = 12.1579; // Combustion gas constant for FFFFg black powder (m/K)
T = 1739; // Combustion gas temperature (K)
R = 287.05; // Specific gas constant for dry air (J/(kg*K))
T0 = 288.15; // Standard temperature (K)
P0 = 101325; // Standard pressure at sea level (Pa)

// Convert units if necessary
function convert_to_meters(value, unit) =
    unit == "mm" ? value / 1000 :
    unit == "in" ? value * 0.0254 : value;

function convert_to_pascals(value, unit) =
    unit == "psi" ? value * 6894.76 : value;

function convert_to_newtons(value, unit) =
    unit == "lbf" ? value * 4.44822 : value;

function convert_to_grams(value, unit) =
    unit == "oz" ? value * 28.3495 : value;

// Pressure Differential Calculation
function pressure_at_altitude(altitude, unit = "m") =
    let (h = convert_to_meters(altitude, unit)) 
    P0 * pow((1 - 2.25577e-5 * h), 5.25588);

function pressure_differential(start_altitude, end_altitude, unit = "m") =
    pressure_at_altitude(start_altitude, unit) - pressure_at_altitude(end_altitude, unit);

// Minimum Supporting Force Calculation
function min_supporting_force(diameter, pressure_diff, friction_force = 0, diameter_unit = "mm", pressure_unit = "Pa") =
    let (d = convert_to_meters(diameter, diameter_unit),
         p = convert_to_pascals(pressure_diff, pressure_unit)) 
    (p * (PI * (d / 2)^2)) + friction_force;

// Shear Strength Calculation
function shear_strength_psi(material_strength, diameter, type = "minor", diameter_unit = "in") =
    let (d = diameter,
         area = type == "minor" ? (PI * (d / 2)^2) : (type == "pitch" ? (PI * (d / 2)^2) : 0)) 
    material_strength * area;

// Number of Shear Screws Calculation
function num_shear_screws(min_force, screw_shear_strength) =
    ceil(min_force / screw_shear_strength);

// Ejection Force Calculation
function ejection_force(num_screws, max_shear_strength, min_force, seal_factor=0) =
    num_screws * max_shear_strength - seal_factor * min_force;

// Function to get screw diameters
function get_screw_diameters(screw_size) =
    screw_size == "M2" ? [0.05942, 0.06851] :
    screw_size == "2-56" ? [0.06410, 0.07440] :
    screw_size == "4-40" ? [0.08130, 0.09576] :
    screw_size == "M3" ? [0.09396, 0.10532] :
    screw_size == "6-32" ? [0.09970, 0.11770] : [0, 0]; // default if unknown size

// Pressure Calculation
function calculate_pressure(F, D, force_unit = "N", diameter_unit = "m") =
    let (force = convert_to_newtons(F, force_unit),
         diameter = convert_to_meters(D, diameter_unit)) 
    force / (PI * (diameter / 2)^2);

// Black Powder Mass Calculation
function calculate_black_powder_mass(P, V, pressure_unit = "Pa", volume_unit = "m^3") =
    let (pressure = convert_to_pascals(P, pressure_unit),
         volume = convert_to_meters(V, volume_unit)) 
    (pressure * volume) / (Rc * T * g) * 1000; // *1000 to convert to grams from kg

// Example Usage
// Rocket Parameters
start_altitude = 0; // sea level in meters
end_altitude = 3657.6; // 12000 feet in meters
tube_diameter = 5.5 * 25.4; // 6 inches in mm
// friction_force = 22.24; // 5 lbf in Newtons
friction_force = 0; // No friction force
seal_factor = 0.25; // 25% seal factor

// Shear Pin Parameters
screw_size = "M3"; // Example screw size
// Nylon 6/6 shear strengths can range from 9600 to 10500 psi
material_strength_min = 9600; // psi
material_strength_max = 10500; // psi
fos = 2; // Factor of safety

// Get screw diameters
screw_diameters = get_screw_diameters(screw_size);
screw_diameter_minor = screw_diameters[0];
screw_diameter_pitch = screw_diameters[1];

// Calculations
pressure_diff = pressure_differential(start_altitude, end_altitude, "m");
min_force =  fos * min_supporting_force(tube_diameter, pressure_diff, friction_force, "mm", "Pa");
screw_min_shear_strength_lbs = shear_strength_psi(material_strength_min, screw_diameter_minor, "minor", "in");
screw_min_shear_strength = convert_to_newtons(screw_min_shear_strength_lbs, "lbf");
screw_max_shear_strength_lbs = shear_strength_psi(material_strength_max, screw_diameter_pitch, "pitch", "in");
screw_max_shear_strength = convert_to_newtons(screw_max_shear_strength_lbs, "lbf");
num_screws = num_shear_screws(min_force, screw_min_shear_strength) + 1;
ejection_force_needed = ejection_force(num_screws, screw_max_shear_strength, min_force, seal_factor);

echo(str("Pressure Differential (Pa): ", pressure_diff));
echo(str("Minimum Supporting Force (N): ", min_force));
echo(str("Shear Strength per Screw (Min, N): ", screw_min_shear_strength));
echo(str("Shear Strength per Screw (Max, N): ", screw_max_shear_strength));
echo(str("Number of Shear Screws Needed: ", num_screws));
echo(str("Ejection Force Needed (N): ", ejection_force_needed));

// Constants
internal_dia = 133.5; // mm
internal_len = 280 - 15 - 2 * 14; // mm

// Calculate volume in cubic meters
internal_volume = (PI * (convert_to_meters(internal_dia, "mm") / 2)^2) * convert_to_meters(internal_len, "mm");

ejection_pressure = calculate_pressure(ejection_force_needed, internal_dia, "N", "mm");
powder_mass = calculate_black_powder_mass(ejection_pressure, internal_volume, "Pa", "m^3");

echo(str("Ejection Pressure (Pa): ", ejection_pressure));
echo(str("Black Powder Mass (g): ", powder_mass));

bucf = 1.5; // Back up charge factor multiplier

echo(str("Black Powder Mass (g) with a BUCF: ", powder_mass*bucf));

// Source: https://www.tbullock.com/bpsg.html
// Constants
grains_per_cubic_inch = 235;
cubic_inches_to_cubic_cm = 16.3871;
grains_to_grams = 1 / 15.432;

// Grains per cubic centimeter
grains_per_cubic_cm = grains_per_cubic_inch / cubic_inches_to_cubic_cm;

// Grams per cubic centimeter
grams_per_cubic_cm = grains_per_cubic_cm * grains_to_grams;

// Echo the result
echo(str("Grams per cubic centimeter: ", grams_per_cubic_cm));

// Calculate the volume of the black powder
powder_volume = powder_mass / grams_per_cubic_cm;
echo(str("Volume of black powder (cm^3): ", powder_volume));

powder_vol_tolerance = 0.1; // 10% tolerance
powder_volume_sized = powder_volume * (1 + powder_vol_tolerance);

// Given constraint, 2 is the recommended height to diameter ratio for packing of fireworks
height_to_diameter_ratio = 2;

// Calculate the diameter and height of the cylinder, DOESNT INCLUDE FOAM PACKING YET
diameter = pow((4 * powder_volume_sized) / (PI * height_to_diameter_ratio), 1 / 3);
height = height_to_diameter_ratio * diameter;

// Echo the results
echo(str("Diameter of the cylinder (cm): ", diameter));
echo(str("Height of the cylinder (cm): ", height));