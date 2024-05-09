package com.example.prog_if_consumo;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.view.View;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    private EditText montoCompra;
    private TextView tv1, tv2, tv3, tv4, tv5;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        montoCompra=(EditText)findViewById(R.id.montoCompra);
        tv1=(android.widget.TextView)findViewById(R.id.montoC);
        tv2=(android.widget.TextView)findViewById(R.id.descuento);
        tv3=(android.widget.TextView)findViewById(R.id.costoNeto);
        tv4=(android.widget.TextView)findViewById(R.id.impuesto);
        tv5=(android.widget.TextView)findViewById(R.id.importeNeto);
    }
    public void calcular_descuento(View view) {
        double dscto,vventa,impuestos,vfactura;
        String consumo = montoCompra.getText().toString();
        double cantconsumo=Double.parseDouble(consumo);
        String porcentaje;

        //calcular descuento
        if(cantconsumo > 30){
            dscto = cantconsumo * 0.20;
            porcentaje="20%";
        }else{
            dscto = cantconsumo * 0.10;
            porcentaje = "10%";
        }

        // calcular valor venta
        vventa = cantconsumo * dscto;

        // calcular impuesto
        impuestos = vventa * 0.18;

        // calcular valor factura
        vfactura = vventa + impuestos;

        // mostrar resultados
        String resu="", resu1="", resu2="", resu3="", resu4="";
        resu = "El monto total de la compra es: "+cantconsumo+" \n";
        resu1 = "El descuento respectivo es: "+porcentaje+"\t: "+dscto+" \n";
        resu2 = "El valor de venta a pagar es: "+vventa+" \n";
        resu3= "El impuesto del 18% es: "+impuestos+" \n";
        resu4 = "El monto a facturar es: "+vfactura+" \n";

        tv1.setText(resu);
        tv2.setText(resu1);
        tv3.setText(resu2);
        tv4.setText(resu3);
        tv5.setText(resu4);
    }
}