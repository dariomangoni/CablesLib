within CablesLib.CablesFlange;
model Pulley3D
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
      fixed=false,
      start=0),                                       stateSelect = StateSelect.avoid,
    w(fixed=false, start=0))  annotation (Placement(transformation(extent={{-184,28},{-164,48}})));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(locked(fixed=true, start=true)) if
                                                                              enableFriction
                                                                           annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Mechanics.Rotational.Components.Disc disc if not enableFriction
                                                     annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(
    useSupportR=true,
    useSupportT=false,
    ratio=1/radius)                                                     annotation (Placement(transformation(extent={{-48,28},{-28,48}})));

  CrtVehicle.Mechanics.MultiBody.Joints.MovingTranslation movingTranslation_a annotation (Placement(transformation(extent={{-30,10},{-50,-10}})));
  CrtVehicle.Mechanics.MultiBody.Joints.MovingTranslation movingTranslation_b annotation (Placement(transformation(extent={{30,10},{50,-10}})));
  Real force_b[3], force_a[3], e_force_b[2], e_force_a[2], phi_a(start=0), phi_b(start=0);
  Math.RealVectorExpression pos_a_expr(out={-radius,0,0}) annotation (Placement(transformation(extent={{-96,-56},{-76,-36}})));
  Math.RealVectorExpression pos_b_expr(out={radius*cos(phi_b),0,radius*sin(phi_b)}) annotation (Placement(transformation(extent={{-14,-56},{6,-36}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n = {0,1,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={68,28})));
equation
  // assuming rolling axis is {0,1,0}
  force_b = Frames.resolveRelative(frame_b.f, frame_b.R, support.R);
  e_force_b = Modelica.Math.Vectors.normalize({force_b[1], force_b[3]});
  force_a = Frames.resolveRelative(frame_a.f, frame_a.R, support.R);
  e_force_a = Modelica.Math.Vectors.normalize({force_a[1], force_a[3]});
  phi_b = atan2(-e_force_b[1], -e_force_b[2]);
  phi_a = atan2(e_force_a[1], e_force_a[2]);

  connect(flange_a, mass.flange_a) annotation (Line(points={{-100,80},{-10,80}}, color={0,127,0}));
  connect(mass.flange_b, flange_b) annotation (Line(points={{10,80},{100,80}}, color={0,127,0}));
  connect(disc.flange_a,inertia1. flange_b) annotation (Line(points={{-100,20},{-122,20},{-122,38},{-164,38}},    color={0,0,0}));
  connect(idealGearR2T.flangeR,disc. flange_b) annotation (Line(points={{-48,38},{-54,38},{-54,20},{-80,20}},     color={0,0,0}));
  connect(bearingFriction.flange_a, inertia1.flange_b) annotation (Line(points={{-100,50},{-122,50},{-122,38},{-164,38}},
                                                                                                     color={0,0,0}));
  connect(bearingFriction.flange_b, idealGearR2T.flangeR) annotation (Line(points={{-80,50},{-54,50},{-54,38},{-48,38}},
                                                                                                       color={0,0,0}));
  connect(idealGearR2T.flangeT, mass.flange_b) annotation (Line(points={{-28,38},{10,38},{10,80}}, color={0,127,0}));
  connect(movingTranslation_b.frame_b, frame_b) annotation (Line(
      points={{50,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(movingTranslation_b.frame_a, support) annotation (Line(
      points={{30,0},{0,0},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(movingTranslation_a.frame_a, support) annotation (Line(
      points={{-30,0},{0,0},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(movingTranslation_a.frame_b, frame_a) annotation (Line(
      points={{-50,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(pos_a_expr.out, movingTranslation_a.r) annotation (Line(points={{-75,-46},{-40,-46},{-40,-10}}, color={0,0,127}));
  connect(pos_b_expr.out, movingTranslation_b.r) annotation (Line(points={{7,-46},{40,-46},{40,-10}}, color={0,0,127}));
  connect(mounting1D.frame_a, support) annotation (Line(
      points={{68,38},{68,100},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(mounting1D.flange_b, idealGearR2T.supportR) annotation (Line(points={{58,28},{6,28},{6,28},{-48,28}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Line(points = {{0, 100}, {0, 0}}, color = {28, 108, 200}), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {28, 108, 200}, fillPattern = FillPattern.Solid, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = -45, origin = {-6, -88},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255}), Rectangle(extent = {{-132, -8}, {-118, 74}}, lineColor = {128, 128, 128}, rotation = 45, origin = {182, 90},
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, fillColor = {255, 255, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley3D;
