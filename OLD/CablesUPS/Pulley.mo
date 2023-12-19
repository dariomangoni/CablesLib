within CablesLib.OLD.CablesUPS;
model Pulley
  parameter Real radius = 0.05;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b support annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={0,100})));
  Modelica.Blocks.Interfaces.RealOutput y_b annotation (Placement(transformation(extent={{90,60},{110,80}})));
  Modelica.Blocks.Interfaces.RealOutput y_a annotation (Placement(transformation(extent={{-90,60},{-110,80}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.1,
    s(fixed=true, start=0),
    v(fixed=true)) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce_a annotation (Placement(transformation(extent={{-26,50},{-46,70}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce_b annotation (Placement(transformation(extent={{30,50},{50,70}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=Modelica.Math.Vectors.norm(cutForce_b.force) - Modelica.Math.Vectors.norm(cutForce_a.force)) annotation (Placement(transformation(extent={{-228,-62},{-52,-34}})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(extent={{-10,-58},{10,-38}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(extent={{40,60},{20,80}})));
equation
  connect(cutForce_a.frame_a, support) annotation (Line(
      points={{-26,60},{0,60},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce_a.frame_b, frame_a) annotation (Line(
      points={{-46,60},{-74,60},{-74,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce_b.frame_b, frame_b) annotation (Line(
      points={{50,60},{60,60},{60,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce_b.frame_a, support) annotation (Line(
      points={{30,60},{0,60},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(force.f, realExpression.y) annotation (Line(points={{-12,-48},{-43.2,-48}}, color={0,0,127}));
  connect(force.flange, mass.flange_b) annotation (Line(points={{10,-48},{22,-48},{22,10},{10,10}}, color={0,127,0}));
  connect(positionSensor.flange, mass.flange_a) annotation (Line(points={{-10,30},{-10,10},{-10,10}}, color={0,127,0}));
  connect(positionSensor.s, y_b) annotation (Line(points={{11,30},{68,30},{68,70},{100,70}}, color={0,0,127}));
  connect(y_a, gain.y) annotation (Line(points={{-100,70},{19,70}}, color={0,0,127}));
  connect(gain.u, y_b) annotation (Line(points={{42,70},{100,70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{0,100},{0,0}}, color={28,108,200}),
        Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Sphere,
          fillColor={255,255,255}),
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-132,-8},{-118,74}},
          lineColor={128,128,128},
          rotation=-45,
          origin={-6,-88},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-132,-8},{-118,74}},
          lineColor={128,128,128},
          rotation=45,
          origin={182,90},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={255,255,255})}),                            Diagram(coordinateSystem(preserveAspectRatio=false)));
end Pulley;
