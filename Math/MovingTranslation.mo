within CablesLib.Math;
model MovingTranslation "Moving translation of frame_b with respect to frame_a"
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.SIunits.Conversions.to_unit1;

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(transformation(extent={{84,-16},{116,16}})));

  parameter Boolean animation=true "= true, if animation shall be enabled";
  Modelica.Blocks.Interfaces.RealInput r[3](start={0,0,0}, unit="m") "Vector from frame_a to frame_b resolved in frame_a"  annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
  parameter Types.ShapeType shapeType="cylinder" "Type of shape" annotation (
     Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter Modelica.SIunits.Position r_shape[3]={0,0,0} "Vector from frame_a to shape origin, resolved in frame_a" annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  Types.Axis lengthDirection = to_unit1(r - r_shape)
    "Vector in length direction of shape, resolved in frame_a" annotation (
      Evaluate=true, Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter Types.Axis widthDirection={0,1,0}
    "Vector in width direction of shape, resolved in frame_a" annotation (
      Evaluate=true, Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  Modelica.SIunits.Length length=Modelica.Math.Vectors.length(r - r_shape) "Length of shape" annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter Modelica.SIunits.Distance width=1/world.defaultWidthFraction "Width of shape" annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter Modelica.SIunits.Distance height=width "Height of shape" annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter Types.ShapeExtra extra=0.0
    "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)"
    annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
    "Color of shape" annotation (Dialog(
      colorSelector=true,
      tab="Animation",
      group="if animation = true",
      enable=animation));
  input Types.SpecularCoefficient specularCoefficient=world.defaultSpecularCoefficient
    "Reflection of ambient light (= 0: light is completely absorbed)"
    annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));

protected
  outer Modelica.Mechanics.MultiBody.World world;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(
    shapeType=shapeType,
    color=color,
    specularCoefficient=specularCoefficient,
    r_shape=r_shape,
    lengthDirection=lengthDirection,
    widthDirection=widthDirection,
    length=length,
    width=width,
    height=height,
    extra=extra,
    r=frame_a.r_0,
    R=frame_a.R) if world.enableAnimation and animation;
equation
  Connections.branch(frame_a.R, frame_b.R);
  assert(cardinality(frame_a) > 0 or cardinality(frame_b) > 0,
    "Neither connector frame_a nor frame_b of FixedTranslation object is connected");

  frame_b.r_0 = frame_a.r_0 + Modelica.Mechanics.MultiBody.Frames.resolve1(frame_a.R, r);
  frame_b.R = frame_a.R;

  /* Force and torque balance */
  zeros(3) = frame_a.f + frame_b.f;
  zeros(3) = frame_a.t + frame_b.t + cross(r, frame_b.f);
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-99,5},{101,-5}},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,85},{150,45}},
          textString="%name",
          lineColor={0,0,255}),
        Text(
          extent={{-89,38},{-53,13}},
          lineColor={128,128,128},
          textString="a"),
        Text(
          extent={{57,39},{93,14}},
          lineColor={128,128,128},
          textString="b")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,5},{100,-5}},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-95,20},{-58,20}},
          color={128,128,128},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-94,18},{-94,50}},
          color={128,128,128},
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-72,35},{-58,24}},
          lineColor={128,128,128},
          textString="x"),
        Text(
          extent={{-113,57},{-98,45}},
          lineColor={128,128,128},
          textString="y"),
        Line(points={{-100,-4},{-100,-69}}, color={128,128,128}),
        Line(points={{-100,-63},{90,-63}}, color={128,128,128}),
        Polygon(
          points={{88,-59},{88,-68},{100,-63},{88,-59}},
          fillPattern=FillPattern.Solid),
        Line(points={{100,-3},{100,-68}}, color={128,128,128}),
        Line(
          points={{69,20},{106,20}},
          color={128,128,128},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{70,18},{70,50}},
          color={128,128,128},
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{92,35},{106,24}},
          lineColor={128,128,128},
          textString="x"),
        Text(
          extent={{51,57},{66,45}},
          lineColor={128,128,128},
          textString="y")}),
    Documentation(info="<html>
<p>
Component for a <strong>fixed translation</strong> of frame_b with respect
to frame_a, i.e., the relationship between connectors frame_a and frame_b
remains constant and frame_a is always <strong>parallel</strong> to frame_b.
</p>
<p>
By default, this component is visualized by a cylinder connecting
frame_a and frame_b, as shown in the figure below. Note, that the
two visualized frames are not part of the component animation and that
the animation may be switched off via parameter animation = <strong>false</strong>.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/FixedTranslation.png\" alt=\"Parts.FixedTranslation\">
</p>
</html>"));
end MovingTranslation;
