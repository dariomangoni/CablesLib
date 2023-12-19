within CablesLib.OLD.Cables.TESTS;
model MassVariableTest
  parameter Real linDensity= 0.025;
  CablesLib.CablesFlange.MassVariable massVariable(L=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(f_constant=10) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=1,
    duration=10,
    offset=1) annotation (Placement(transformation(extent={{-74,28},{-54,48}})));
  Modelica.Blocks.Sources.RealExpression massCableExpr(y=massVariable.s)            annotation (Placement(transformation(extent={{-138,78},{-68,98}})));
  CablesLib.OLD.Cables.SpringVariable springVariable annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain gain(k=linDensity) annotation (Placement(transformation(extent={{-36,58},{-16,78}})));
equation
  connect(massVariable.flange_a, constantForce.flange) annotation (Line(points={{-10,0},{-60,0}}, color={0,127,0}));
  connect(massVariable.flange_b, springVariable.flange_a) annotation (Line(points={{10,0},{40,0}}, color={0,127,0}));
  connect(massCableExpr.y, gain.u) annotation (Line(points={{-64.5,88},{-50,88},{-50,68},{-38,68}}, color={0,0,127}));
  connect(gain.y, massVariable.m) annotation (Line(points={{-15,68},{0,68},{0,10}}, color={0,0,127}));
  connect(massCableExpr.y, springVariable.c) annotation (Line(points={{-64.5,88},{50,88},{50,10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MassVariableTest;
