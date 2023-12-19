within CablesLib.CablesFlange;
model Pulley
  parameter Modelica.SIunits.Radius radius = 0.05;
  parameter Modelica.SIunits.Mass m = 0.05;
  parameter Modelica.SIunits.MomentOfInertia inertia = 0.5*m*radius^2;
  parameter Boolean enableFriction = true;
  parameter Real rollingAxis[3] = {0,1,0};

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (
    Placement(transformation(extent = {{84, -16}, {116, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b support annotation (
    Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {0, 100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-110,70},{-90,90}}), visible=not fix_a));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{90,70},{110,90}}), visible=not fix_b));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(fixed=true)) annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    J=inertia,
    phi(fixed=false, start=0),
    w(fixed=false, start=0)) annotation (Placement(transformation(extent={{-184,28},{-164,48}})));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction if enableFriction annotation (Placement(transformation(extent={{-80,28},{-60,48}})));
  Modelica.Mechanics.Rotational.Components.Disc disc if not enableFriction annotation (Placement(transformation(extent={{-80,6},{-60,26}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(
    useSupportR=true,
    useSupportT=false,
    ratio=1/radius)                                                     annotation (Placement(transformation(extent={{-48,28},{-28,48}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n=rollingAxis)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={76,20})));
equation
  connect(frame_a, support) annotation (Line(
      points={{-100,0},{0,0},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_b, support) annotation (Line(
      points={{100,0},{0,0},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(flange_a, mass.flange_a) annotation (Line(points={{-100,80},{-10,80}}, color={0,127,0}));
  connect(mass.flange_b, flange_b) annotation (Line(points={{10,80},{100,80}}, color={0,127,0}));
  connect(disc.flange_a,inertia1. flange_b) annotation (Line(points={{-80,16},{-122,16},{-122,38},{-164,38}},     color={0,0,0}));
  connect(idealGearR2T.flangeR,disc. flange_b) annotation (Line(points={{-48,38},{-54,38},{-54,16},{-60,16}},     color={0,0,0}));
  connect(bearingFriction.flange_a, inertia1.flange_b) annotation (Line(points={{-80,38},{-164,38}}, color={0,0,0}));
  connect(bearingFriction.flange_b, idealGearR2T.flangeR) annotation (Line(points={{-60,38},{-48,38}}, color={0,0,0}));
  connect(idealGearR2T.flangeT, mass.flange_b) annotation (Line(points={{-28,38},{10,38},{10,80}}, color={0,127,0}));
  connect(mounting1D.frame_a, support) annotation (Line(
      points={{76,30},{76,100},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(mounting1D.flange_b, idealGearR2T.supportR) annotation (Line(points={{66,20},{-48,20},{-48,28}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Line(points = {{0, 100}, {0, 0}}, color = {28, 108, 200}), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Solid, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = -45, origin = {-6, -88},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = 45, origin = {182, 90},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley;
