within CablesLib.OLD.Cables;
model CableMass_easy
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;

  parameter Modelica.SIunits.TranslationalSpringConstant stiffness = 1e6;
  parameter Modelica.SIunits.TranslationalDampingConstant damping = 1e5;
  parameter Modelica.SIunits.LinearDensity linDensity = 0.025;
  parameter Modelica.SIunits.Length unstretchedLength = 1;
  parameter Modelica.SIunits.Pressure maxTensileStrength = 900e6;
  parameter Modelica.SIunits.Pressure maxElongation = 0.3;

  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sd(
    c=stiffness,
    s_unstretched=unstretchedLength/2,
    d=damping) annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    r_CM={0,0,0},
    m=unstretchedLength*linDensity,
    r_0(fixed=false),
    v_0(fixed=true),
    w_0_fixed=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,2})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sd1(
    c=stiffness,
    s_unstretched=unstretchedLength/2,
    d=damping) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(displayUnit="1") = {0,1,0}) annotation (Placement(transformation(extent={{4,-26},{24,-46}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange=true, n(displayUnit="1") = {0,0,1}) annotation (Placement(transformation(extent={{-24,-26},{-4,-46}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=1000, d=10) annotation (Placement(transformation(extent={{-22,-78},{-2,-58}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c=100, d=10) annotation (Placement(transformation(extent={{8,-78},{28,-58}})));
  Modelica.Mechanics.MultiBody.Parts.Body body1(
    r_CM={0,0,0},
    m=unstretchedLength*linDensity,
    r_0(fixed=false),
    v_0(fixed=true),
    w_0_fixed=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={142,-56})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sd3(
    c=stiffness,
    s_unstretched=unstretchedLength/2,
    d=damping) annotation (Placement(transformation(extent={{182,-68},{202,-48}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(useAxisFlange=true, n(displayUnit="1") = {0,1,0}) annotation (Placement(transformation(extent={{146,-84},{166,-104}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(useAxisFlange=true, n(displayUnit="1") = {0,0,1}) annotation (Placement(transformation(extent={{118,-84},{138,-104}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(c=1000, d=10) annotation (Placement(transformation(extent={{120,-136},{140,-116}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper3(c=100, d=10) annotation (Placement(transformation(extent={{150,-136},{170,-116}})));
initial equation
    body.r_0 = (frame_a.r_0 + frame_b.r_0)/2;
equation

  connect(sd.frame_a, frame_a) annotation (Line(
      points={{-64,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_a, sd.frame_b) annotation (Line(
      points={{-24,-36},{-26,-36},{-26,0},{-44,0}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_b, revolute.frame_a) annotation (Line(
      points={{-4,-36},{4,-36}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_b, sd1.frame_a) annotation (Line(
      points={{24,-36},{28,-36},{28,0},{40,0}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.support, springDamper.flange_a) annotation (Line(points={{-20,-46},{-22,-46},{-22,-68}}, color={0,0,0}));
  connect(springDamper.flange_b, revolute1.axis) annotation (Line(points={{-2,-68},{-8,-68},{-8,-46},{-14,-46}}, color={0,0,0}));
  connect(revolute.support, springDamper1.flange_a) annotation (Line(points={{8,-46},{8,-68}}, color={0,0,0}));
  connect(springDamper1.flange_b, revolute.axis) annotation (Line(points={{28,-68},{22,-68},{22,-46},{14,-46}}, color={0,0,0}));
  connect(body.frame_a, revolute1.frame_b) annotation (Line(
      points={{-4.44089e-16,-8},{-4.44089e-16,-36},{-4,-36}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute3.frame_b, revolute2.frame_a) annotation (Line(
      points={{138,-94},{146,-94}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute2.frame_b, sd3.frame_a) annotation (Line(
      points={{166,-94},{170,-94},{170,-58},{182,-58}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute3.support, springDamper2.flange_a) annotation (Line(points={{122,-104},{120,-104},{120,-126}}, color={0,0,0}));
  connect(springDamper2.flange_b, revolute3.axis) annotation (Line(points={{140,-126},{134,-126},{134,-104},{128,-104}}, color={0,0,0}));
  connect(revolute2.support, springDamper3.flange_a) annotation (Line(points={{150,-104},{150,-126}}, color={0,0,0}));
  connect(springDamper3.flange_b, revolute2.axis) annotation (Line(points={{170,-126},{164,-126},{164,-104},{156,-104}}, color={0,0,0}));
  connect(body1.frame_a, revolute3.frame_b) annotation (Line(
      points={{142,-66},{142,-94},{138,-94}},
      color={95,95,95},
      thickness=0.5));
  connect(sd1.frame_b, revolute3.frame_a) annotation (Line(
      points={{60,0},{90,0},{90,-94},{118,-94}},
      color={95,95,95},
      thickness=0.5));
  connect(sd3.frame_b, frame_b) annotation (Line(
      points={{202,-58},{152,-58},{152,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Line(points={{-100,-2},{-66,-32},{-44,-46},{-4,-60},{26,-60},{56,-48},{82,-28},{102,0}}, color={28,108,200})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableMass_easy;
