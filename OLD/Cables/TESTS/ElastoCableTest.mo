within CablesLib.OLD.Cables.TESTS;
model ElastoCableTest
  Modelica.Mechanics.Translational.Components.Fixed
                   fixed
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Components.Rod
                 rod1(L=2)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Translational.Components.Rod
                 rod2(L=2)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper
                          springDamper1(
    c=10,
    s_rel0=1,
    s_rel(fixed=false, start=1),
    d=1.5)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Translational.Components.SpringDamper
                          springDamper2(
    c=10,
    s_rel0=1,
    s_rel(fixed=false, start=1),
    d=1.5) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Mechanics.Translational.Components.Mass
                  mass1(
    s(fixed=true, start=2),
    L=0,
    m=1,
    v(fixed=true))
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Mechanics.Translational.Components.ElastoGap
                       elastoGap1(
    c=10,
    s_rel(fixed=false, start=1.5),
    s_rel0=1.5,
    d=1.5)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Mechanics.Translational.Components.ElastoGap
                       elastoGap2(
    c=10,
    s_rel(fixed=false, start=1.5),
    s_rel0=1.5,
    d=1.5)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Mechanics.Translational.Components.Mass
                  mass2(
    s(fixed=true, start=2),
    L=0,
    m=1,
    v(fixed=true))
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
equation
  connect(rod1.flange_b,fixed. flange) annotation (Line(
      points={{-20,0},{0,0}}, color={0,127,0}));
  connect(fixed.flange,rod2. flange_a) annotation (Line(
      points={{0,0},{20,0}}, color={0,127,0}));
  connect(springDamper1.flange_a,rod1. flange_a) annotation (Line(
      points={{-40,30},{-50,30},{-50,0},{-40,0}}, color={0,127,0}));
  connect(springDamper2.flange_b,rod2. flange_b) annotation (Line(
      points={{40,30},{50,30},{50,0},{40,0}}, color={0,127,0}));
  connect(springDamper1.flange_b,mass1. flange_a) annotation (Line(
      points={{-20,30},{-10,30}}, color={0,127,0}));
  connect(mass1.flange_b,springDamper2. flange_a) annotation (Line(
      points={{10,30},{20,30}}, color={0,127,0}));
  connect(rod1.flange_a,elastoGap1. flange_a) annotation (Line(
      points={{-40,0},{-50,0},{-50,-30},{-40,-30}}, color={0,127,0}));
  connect(rod2.flange_b,elastoGap2. flange_b) annotation (Line(
      points={{40,0},{50,0},{50,-30},{40,-30}}, color={0,127,0}));
  connect(elastoGap1.flange_b,mass2. flange_a) annotation (Line(
      points={{-20,-30},{-10,-30}}, color={0,127,0}));
  connect(mass2.flange_b,elastoGap2. flange_a) annotation (Line(
      points={{10,-30},{20,-30}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ElastoCableTest;
