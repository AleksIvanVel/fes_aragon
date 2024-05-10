package com.example.programa_subsidioestatal;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    private EditText et1, et2;
    private TextView tv1, tv2, tv3, tv4;
    private RadioButton rb1;
    @SuppressLint("MissingInflatedId")
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

        et1 = (EditText) findViewById(R.id.txtNumHijos);
        et2 = (EditText) findViewById(R.id.txtNumHijosEdadEsc);

        rb1 = (RadioButton) findViewById(R.id.radioButton);

        tv1 = (TextView) findViewById(R.id.lblTotalHijos);
        tv2 = (TextView) findViewById(R.id.lblHijosEscolares);
        tv3 = (TextView) findViewById(R.id.lblViudez);
        tv4 = (TextView) findViewById(R.id.lblSubsidioTotal);
    }

    public void procesar_subsidio(View view){

        //Variables locales
        int nhijos, hijosEsc;
        double sub1, sub2, sub3, subsidio;

        //Leer el numero de hijos y numero de hijos escolares
        String numhijos = et1.getText().toString();
        nhijos = Integer.parseInt(numhijos);

        String numhijosesc = et2.getText().toString();
        hijosEsc = Integer.parseInt(numhijosesc);

        //Calcular subsidio por numero de hijos
        if(nhijos <= 2)
            sub1 = 1700;
        else if (nhijos <= 5)
            sub1 = 1900;
        else
            sub1 = 1200;

        //Calular subsidio por hijos en edad escolar
        sub2 = hijosEsc * 200;

        //calcular subsidio por viudez
        sub3 = 0;
        if (rb1.isChecked() == true) //si esta seleccionado
            sub3 = 800;

        //Caluclar subsidio total
        subsidio = sub1 + sub2 + sub3;

        //Imprimimos subsidios

        String resu="", resu1="", resu2="", resu3="";

        resu = "El monto del Subsidio por numero de Hijos: "+sub1+" \n";
        resu1 = "El Subsidio por hijos en edad Escolar: "+sub2+" \n";
        resu2 = "El Subsidio por Viudez es: "+sub3+" \n";
        resu3 = "El monto del Subsidio total acumulado es: "+subsidio+" \n";

        //imprimir los resultados encontrados
        tv1.setText(resu);
        tv2.setText(resu1);
        tv3.setText(resu2);
        tv4.setText(resu3);

    }
}