within CablesLib.OLD.Cables;
model Reel
  parameter Real drumRadius = 0.05;
  parameter Real currDensity = 0.25;
  parameter Modelica.SIunits.TranslationalSpringConstant stiffness = 1e6;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio=1/drumRadius) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  Real curMass;
  CablesFlange.MassVariable massVariable(L=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression massCableExpr(y=massVariable.s)            annotation (Placement(transformation(extent={{-148,80},{-78,100}})));
  SpringVariable springVariable(c=stiffness)
                                annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain gain(k=linDensity) annotation (Placement(transformation(extent={{-46,60},{-26,80}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(flange_a, idealGearR2T.flangeR) annotation (Line(points={{-100,0},{-68,0}}, color={0,0,0}));
  connect(massCableExpr.y, gain.u) annotation (Line(points={{-74.5,90},{-60,90},{-60,70},{-48,70}}, color={0,0,127}));
  connect(gain.y, massVariable.m) annotation (Line(points={{-25,70},{0,70},{0,10}}, color={0,0,127}));
  connect(massVariable.flange_b, springVariable.flange_a) annotation (Line(points={{10,0},{40,0}}, color={0,127,0}));
  connect(springVariable.flange_b, flange_b) annotation (Line(points={{60,0},{100,0}}, color={0,127,0}));
  connect(idealGearR2T.flangeT, massVariable.flange_a) annotation (Line(points={{-48,0},{-10,0}}, color={0,127,0}));
  connect(massCableExpr.y, springVariable.s_rel0) annotation (Line(points={{-74.5,90},{50,90},{50,10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Reel;
