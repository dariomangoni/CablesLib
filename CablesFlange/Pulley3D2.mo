within CablesLib.CablesFlange;
model Pulley3D2
  import Modelica.Mechanics.MultiBody.Frames;
  parameter Modelica.SIunits.Radius radius = 0.05;
  parameter Modelica.SIunits.Mass m = 0.05;
  parameter Modelica.SIunits.MomentOfInertia inertia = 0.5*m*radius^2;
  parameter Boolean enableFriction = true;

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (
    Placement(transformation(extent = {{84, -16}, {116, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b support annotation (
    Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {0, 100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation (Placement( visible=true,transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation (Placement( visible=true,transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, stateSelect = StateSelect.prefer,
    s(fixed=false),
    v(fixed=false))                                                            annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    J=inertia,
    phi(
      displayUnit="rad",
      fixed=true,
      start=0),                                       stateSelect = StateSelect.avoid,
    w(fixed=true, start=0))   annotation (Placement(transformation(extent={{-184,28},{-164,48}})));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(locked(fixed=true, start=true)) if
                                                                              enableFriction
                                                                           annotation (Placement(transformation(extent={{-80,28},{-60,48}})));
  Modelica.Mechanics.Rotational.Components.Disc disc if not enableFriction
                                                     annotation (Placement(transformation(extent={{-80,6},{-60,26}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(
    useSupportR=true,
    useSupportT=false,
    ratio=1/radius)                                                     annotation (Placement(transformation(extent={{-48,28},{-28,48}})));

  PulleyContactPointAnalytic pulleyContactPointAnalytic annotation (Placement(transformation(extent={{22,4},{42,24}})));
  PulleyContactPointAnalytic pulleyContactPointAnalytic1(flip_side=true) annotation (Placement(transformation(extent={{36,-24},{56,-4}})));
equation
  // assuming rolling axis is {0,1,0}

  connect(flange_a, mass.flange_a) annotation (Line(points={{-100,80},{-10,80}}, color={0,127,0}));
  connect(mass.flange_b, flange_b) annotation (Line(points={{10,80},{100,80}}, color={0,127,0}));
  connect(disc.flange_a,inertia1. flange_b) annotation (Line(points={{-80,16},{-122,16},{-122,38},{-164,38}},     color={0,0,0}));
  connect(idealGearR2T.flangeR,disc. flange_b) annotation (Line(points={{-48,38},{-54,38},{-54,16},{-60,16}},     color={0,0,0}));
  connect(bearingFriction.flange_a, inertia1.flange_b) annotation (Line(points={{-80,38},{-164,38}}, color={0,0,0}));
  connect(bearingFriction.flange_b, idealGearR2T.flangeR) annotation (Line(points={{-60,38},{-48,38}}, color={0,0,0}));
  connect(idealGearR2T.flangeT, mass.flange_b) annotation (Line(points={{-28,38},{10,38},{10,80}}, color={0,127,0}));
  connect(pulleyContactPointAnalytic.frame_a, support) annotation (Line(
      points={{22,14},{12,14},{12,100},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(pulleyContactPointAnalytic.frame_b, frame_b) annotation (Line(
      points={{42,14},{70,14},{70,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(pulleyContactPointAnalytic1.frame_a, support) annotation (Line(
      points={{36,-14},{18,-14},{18,100},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(pulleyContactPointAnalytic1.frame_b, frame_a) annotation (Line(
      points={{56,-14},{-22,-14},{-22,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Line(points = {{0, 100}, {0, 0}}, color = {28, 108, 200}), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Solid, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = -45, origin = {-6, -88},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = 45, origin = {182, 90},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley3D2;
