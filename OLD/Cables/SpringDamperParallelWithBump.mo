within CablesLib.OLD.Cables;
model SpringDamperParallelWithBump
  import Modelica.Mechanics.MultiBody.Types;
  import SI = Modelica.SIunits;
  parameter Boolean animation = true "= true, if animation shall be enabled";
  parameter SI.TranslationalSpringConstant c(final min = 0) "Spring constant";
  parameter SI.Length s_unstretched = 0 "Unstretched spring length";
  parameter SI.TranslationalDampingConstant d(final min = 0) = 0 "Damping constant";
  parameter Modelica.SIunits.Distance smax = 0.5;
  parameter Modelica.SIunits.Distance smin = 0.01;
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
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialLineForce;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPort(final T = 293.15);
  SI.Velocity v "Relative velocity (= der(s))";
  //protected
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape_a(shapeType = "cylinder", color = color_a, specularCoefficient = specularCoefficient, length = noEvent(min(length_a, s)), width = diameter_a, height = diameter_a, lengthDirection = e_a, widthDirection = {0, 1, 0}, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape_b(shapeType = "cylinder", color = color_b, specularCoefficient = specularCoefficient, length = noEvent(max(s - length_a, 0)), width = diameter_b, height = diameter_b, lengthDirection = e_a, widthDirection = {0, 1, 0}, r_shape = e_a * noEvent(min(length_a, s)), r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(shapeType = "spring", color = color, specularCoefficient = specularCoefficient, length = s, width = width, height = coilWidth * 2, lengthDirection = e_a, widthDirection = {0, 1, 0}, extra = numberOfWindings, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
  //protected
  Modelica.SIunits.Force f_c "Spring force";
  Modelica.SIunits.Force f_c_limit "Spring force due to bumpstop";
  Modelica.SIunits.Force f_d2_limit "Linear damping force";
  Modelica.SIunits.Force f_d "Damping force";
  Modelica.SIunits.Force f_d_limit "Linear damping force which is limited by spring force (|f_d_limit| <= |f_c + f_d|)";
  Integer contact;
equation
  v = der(s);
  // Modify contact force, so that it is only "pushing" and not
  // "pulling/sticking" and that it is continuous
  f_c = c * (s - s_unstretched);
  f_d = d * v;
  contact = if s <= smin then -1 else if s >= smax then +1 else 0;
  f_c_limit = smooth(1, noEvent(if contact == (-1) then c_limit * (s - smin) else if contact == (+1) then c_limit * (s - smax) else 0));
  f_d2_limit = if contact <> 0 then d_limit * v else 0;
  f_d_limit = smooth(0, noEvent(if contact <> 0 then if f_d2_limit < (-f_c_limit) then -f_c_limit else if f_d2_limit > (+f_c_limit) then +f_c_limit else f_d2_limit else 0));
  f = f_c + f_d + f_c_limit + f_d_limit;
  lossPower = f_d * v;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end SpringDamperParallelWithBump;
