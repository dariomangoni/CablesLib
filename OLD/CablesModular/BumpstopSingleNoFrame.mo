within CablesLib.OLD.CablesModular;
model BumpstopSingleNoFrame
  import Modelica.Mechanics.MultiBody.Types;
  import SI = Modelica.SIunits;

  parameter SI.Distance s_small=1e-10 "Prevent zero-division if distance between frame_a and frame_b is zero" annotation (Dialog(tab="Advanced"));
  parameter Boolean fixedRotationAtFrame_a=false "=true, if rotation Modelica.Mechanics.MultiBody.Frames.nullRotation() is fixed (to directly connect line forces)" annotation (Evaluate=true, choices(checkBox=true),Dialog(tab="Advanced", group="If enabled, can give wrong results, see MultiBody.UsersGuide.Tutorial.ConnectionOfLineForces"));
  parameter Boolean fixedRotationAtFrame_b=false "=true, if rotation frame_b.R is fixed (to directly connect line forces)" annotation (Evaluate=true, choices(checkBox=true),Dialog(tab="Advanced", group="If enabled, can give wrong results, see MultiBody.UsersGuide.Tutorial.ConnectionOfLineForces"));

  SI.Distance length "Distance between the origin of frame_a and the origin of frame_b";
  SI.Position s "(Guarded) distance between the origin of frame_a and the origin of frame_b (>= s_small))";
  SI.Position r_rel_0[3] "Position vector from frame_a to frame_b resolved in world frame";
  Real e_rel_0[3](each final unit="1") "Unit vector in direction from frame_a to frame_b, resolved in world frame";

  SI.Force f "Line force acting on frame_a and on frame_b (positive, if acting on frame_b and directed from frame_a to frame_b)";

  parameter Boolean animation = true "= true, if animation shall be enabled";
  parameter SI.TranslationalSpringConstant c(final min = 0) "Spring constant";
  parameter SI.Length s_unstretched = 0 "Unstretched spring length";
  parameter SI.TranslationalDampingConstant d(final min = 0) = 0 "Damping constant";
  parameter Modelica.SIunits.Distance smax = 0.5;
  parameter Modelica.SIunits.Distance smin = 0.01;
  parameter Real n = 1;
  parameter Modelica.SIunits.TranslationalSpringConstant c_limit = 10000;
  parameter Modelica.SIunits.TranslationalDampingConstant d_limit = 1000;
  parameter SI.Distance length_a = world.defaultForceLength "Length of damper cylinder at frame_a side" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input SI.Diameter diameter_a = world.defaultForceWidth "Diameter of damper cylinder at frame_a side" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input SI.Diameter diameter_b = 0.6 * diameter_a "Diameter of damper cylinder at frame_b side" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input Types.Color color_a = {100, 100, 100} "Color of damper cylinder at frame_a" annotation (
    Dialog(colorSelector = true, tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input Types.Color color_b = {155, 155, 155} "Color of damper cylinder at frame_b" annotation (
    Dialog(colorSelector = true, tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input SI.Distance width = world.defaultForceWidth "Width of spring" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input SI.Distance coilWidth = width / 10 "Width of spring coil" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  parameter Integer numberOfWindings = 5 "Number of spring windings" annotation (
    Dialog(tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  input Modelica.Mechanics.MultiBody.Types.Color color = Modelica.Mechanics.MultiBody.Types.Defaults.SpringColor "Color of spring" annotation (
    Dialog(colorSelector = true, tab = "Animation", group="---------- if animation = true ----------", enable = animation));
  SI.Velocity v "Relative velocity (= der(s))";
  //protected
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape_a(shapeType = "cylinder", color = color_a, specularCoefficient = specularCoefficient, length = noEvent(min(length_a, s)), width = diameter_a, height = diameter_a, lengthDirection = e_rel_0, widthDirection = {0, 1, 0}, r = cable_a.pos, R = Modelica.Mechanics.MultiBody.Frames.nullRotation()) if world.enableAnimation and animation;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape_b(shapeType = "cylinder", color = color_b, specularCoefficient = specularCoefficient, length = noEvent(max(s - length_a, 0)), width = diameter_b, height = diameter_b, lengthDirection = e_rel_0, widthDirection = {0, 1, 0}, r_shape = e_rel_0 * noEvent(min(length_a, s)), r = cable_a.pos, R = Modelica.Mechanics.MultiBody.Frames.nullRotation()) if world.enableAnimation and animation;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(shapeType = "spring", color = color, specularCoefficient = specularCoefficient, length = s, width = width, height = coilWidth * 2, lengthDirection = e_rel_0, widthDirection = {0, 1, 0}, extra = numberOfWindings, r = cable_a.pos, R = Modelica.Mechanics.MultiBody.Frames.nullRotation()) if world.enableAnimation and animation;
  //protected
  Boolean contact "=true, if contact, otherwise no contact";
  //protected
  Modelica.SIunits.Force f_c "Spring force";
  Modelica.SIunits.Force f_d2 "Linear damping force";
  Modelica.SIunits.Force f_d "Linear damping force which is limited by spring force (|f_d| <= |f_c|)";
  Interfaces.Cable_a cable_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.Cable_b cable_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));
protected
  outer Modelica.Mechanics.MultiBody.World world;
equation

  cable_a.len = cable_b.len;

//   assert(cardinality(frame_a) > 0, "Connector frame_a of component is not connected");
//   assert(cardinality(frame_b) > 0, "Connector frame_b of component is not connected");

   assert(noEvent(length > s_small), "
The distance between the origin of frame_a and the origin of frame_b
of a line force component became smaller as parameter s_small
(= a small number, defined in the \"Advanced\" menu). The distance is
set to s_small, although it is smaller, to avoid a division by zero
when computing the direction of the line force. Possible reasons
for this situation:
- At initial time the distance may already be zero: Change the initial
  positions of the bodies connected by this element.
- Hardware stops are not modeled or are modeled not stiff enough.
  Include stops, e.g., stiff springs, or increase the stiffness
  if already present.
- Another error in your model may lead to unrealistically large forces
  and torques that would in reality destroy the stops.
- The flange_b connector might be defined by a pre-defined motion,
  e.g., with Modelica.Mechanics.Translational.Position and the
  predefined flange_b.s is zero or negative.
");

  // Determine relative position vector between the two frames
  r_rel_0 = cable_b.pos - cable_a.pos;
  length = Modelica.Math.Vectors.length(r_rel_0);
  s = Modelica.Mechanics.MultiBody.Frames.Internal.maxWithoutEvent(length, s_small);
  e_rel_0 = r_rel_0/s;

  // Determine forces and torques at cable_a and cable_b
  cable_a.f = -e_rel_0*f;
  cable_b.f = -cable_a.f;

  v = der(s);
  // Modify contact force, so that it is only "pulling" and not "pushing" and that it is continuous
  contact = s > smin;
  f_c = smooth(1, noEvent(if contact then c_limit * abs(s - smin) ^ n else 0));
  f_d2 = if contact then d_limit * v else 0;
  f_d = smooth(0, noEvent(if contact then if f_d2 < f_c then f_c else if f_d2 > (-f_c) then -f_c else f_d2 else 0));
  f = f_c + f_d;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end BumpstopSingleNoFrame;
