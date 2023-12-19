within CablesLib.OLD.CablesUPS;
model ReelForce
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{90,60},{110,80}}), iconTransformation(extent={{90,60},{110,80}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-120,50},{-80,90}})));
  Modelica.Blocks.Continuous.PID PID(
    k=0.1,
    Ti=0.1,
    Td=1,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    y_start=0) annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce annotation (Placement(transformation(extent={{40,10},{60,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=Modelica.Math.Vectors.norm(cutForce.force)) annotation (Placement(transformation(extent={{-94,40},{-74,60}})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(extent={{22,28},{42,48}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={64,68})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.1,
    s(fixed=true),
    v(fixed=true)) annotation (Placement(transformation(extent={{48,26},{68,46}})));
  Modelica.Blocks.Math.Sign sign1 annotation (Placement(transformation(extent={{-134,-6},{-114,14}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-44,60},{-24,80}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-128,-32},{-108,-12}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{-36,-20},{-16,0}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{-60,-66},{-40,-46}})));
  Modelica.Blocks.Sources.Constant const1(k=2) annotation (Placement(transformation(extent={{-118,-72},{-98,-52}})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(extent={{16,60},{36,80}})));
equation
  connect(cutForce.frame_b, frame_b) annotation (Line(
      points={{60,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce.frame_a, frame_a) annotation (Line(
      points={{40,0},{0,0},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(force.flange, mass.flange_a) annotation (Line(points={{42,38},{44,38},{44,36},{48,36}}, color={0,127,0}));
  connect(positionSensor.s, y) annotation (Line(points={{75,68},{82,68},{82,70},{100,70}}, color={0,0,127}));
  connect(positionSensor.flange, mass.flange_b) annotation (Line(points={{54,68},{54,36},{68,36}}, color={0,127,0}));
  connect(PID.u, feedback.y) annotation (Line(points={{-12,70},{-25,70}}, color={0,0,127}));
  connect(realExpression.y, feedback.u2) annotation (Line(points={{-73,50},{-34,50},{-34,62}}, color={0,0,127}));
  connect(sign1.y, add.u1) annotation (Line(points={{-113,4},{-100,4},{-100,-6},{-96,-6}}, color={0,0,127}));
  connect(const.y, add.u2) annotation (Line(points={{-107,-22},{-102,-22},{-102,-18},{-96,-18}}, color={0,0,127}));
  connect(const1.y, division.u2) annotation (Line(points={{-97,-62},{-62,-62}}, color={0,0,127}));
  connect(division.u1, add.y) annotation (Line(points={{-62,-50},{-62,-12},{-73,-12}}, color={0,0,127}));
  connect(product.u2, division.y) annotation (Line(points={{-38,-16},{-38,-36},{-38,-56},{-39,-56}}, color={0,0,127}));
  connect(sign1.u, u) annotation (Line(points={{-136,4},{-156,4},{-156,70},{-100,70}}, color={0,0,127}));
  connect(product.u1, u) annotation (Line(points={{-38,-4},{-38,33},{-100,33},{-100,70}}, color={0,0,127}));
  connect(product.y, feedback.u1) annotation (Line(points={{-15,-10},{-16,-10},{-16,56},{-60,56},{-60,70},{-42,70}}, color={0,0,127}));
  connect(PID.y, gain.u) annotation (Line(points={{11,70},{14,70}}, color={0,0,127}));
  connect(gain.y, force.f) annotation (Line(points={{37,70},{28,70},{28,38},{20,38}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ReelForce;
