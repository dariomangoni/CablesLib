within CablesLib.Math;
block RealVectorExpression "Set output signal to a time varying Real expression"

  Modelica.Blocks.Interfaces.RealOutput out[:]={0,0,0} "Value of Real output" annotation (Dialog(group="---------- Time varying output signal ----------"), Placement(transformation(extent={{100,-10},{120,10}})));

  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,40},{100,-40}},
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Text(
          extent={{-96,15},{96,-15}},
          textString="%out"),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255})}), Documentation(info="<html>
<p>Same as <a href=\"Modelica.Blocks.Sources.RealExpression\">MSL RealExpression</a> but with a vector output.</p>
</html>"));

end RealVectorExpression;
