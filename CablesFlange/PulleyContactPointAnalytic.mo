within CablesLib.CablesFlange;
model PulleyContactPointAnalytic
  import Modelica.Mechanics.MultiBody.Frames;
  parameter Real radius = 0.02;
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  parameter Boolean flip_side = false;
  parameter Boolean exact = true;
  Modelica.Mechanics.MultiBody.Joints.Revolute revPulley(useAxisFlange=true, n = {0,1,0},
    phi(fixed=false),
    w(fixed=true))                                                                                         annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation radiusArm(r={radius,0,0}) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  Modelica.Mechanics.Rotational.Sources.Position rotAngle(useSupport=true, exact=exact)
                                                                                       annotation (Placement(transformation(extent={{-52,30},{-32,50}})));
  Real forceB_s[3];
  Real e_forceB_s[2];
  Modelica.Blocks.Sources.RealExpression realExpression(y=atan2(-flip_sign*e_forceB_s[1], -flip_sign*e_forceB_s[2]))
                                                        annotation (Placement(transformation(extent={{-290,30},{-146,48}})));
protected
  Real flip_sign = if flip_side then -1 else +1;
equation
  forceB_s = Frames.resolve2(frame_a.R, Frames.resolve1(radiusArm.frame_b.R, radiusArm.frame_b.f));
  e_forceB_s = Modelica.Math.Vectors.normalize({forceB_s[1],forceB_s[3]});
  connect(revPulley.frame_b, radiusArm.frame_a) annotation (Line(
      points={{-10,0},{4,0}},
      color={95,95,95},
      thickness=0.5));
  connect(rotAngle.support, revPulley.support) annotation (Line(points={{-42,30},{-42,22},{-26,22},{-26,10}},
                                                                                            color={0,0,0}));
  connect(revPulley.axis, rotAngle.flange) annotation (Line(points={{-20,10},{-20,40},{-32,40}},        color={0,0,0}));
  connect(radiusArm.frame_b, frame_b) annotation (Line(
      points={{24,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_a, revPulley.frame_a) annotation (Line(
      points={{-100,0},{-30,0}},
      color={95,95,95},
      thickness=0.5));
  connect(realExpression.y, rotAngle.phi_ref) annotation (Line(points={{-138.8,39},{-95.4,39},{-95.4,40},{-54,40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(points={{-100,0},{-68,0}}, color={28,108,200}),
        Ellipse(extent={{-68,12},{-42,-14}}, lineColor={28,108,200}),
        Line(points={{-46,10},{2,62}}, color={28,108,200}),
        Ellipse(extent={{-2,84},{24,58}}, lineColor={28,108,200}),
        Line(points={{22,64},{94,10},{102,-2},{102,0}}, color={28,108,200})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end PulleyContactPointAnalytic;
