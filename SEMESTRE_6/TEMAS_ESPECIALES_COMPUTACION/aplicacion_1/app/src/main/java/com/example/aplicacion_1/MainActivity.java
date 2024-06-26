package com.example.aplicacion_1;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;


public class MainActivity extends AppCompatActivity {

    private EditText txtNombre;
    private EditText txtApPaterno;
    private EditText txtApMaterno;
    private Button btnAceptar;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Obtenemos una referencia a los controles de la interfaz
        txtNombre = (EditText) findViewById(R.id.txtNombre);
        txtApPaterno = (EditText) findViewById(R.id.txtApPaterno);
        txtApMaterno = (EditText) findViewById(R.id.txtApMaterno);
        btnAceptar = (Button) findViewById(R.id.btnAceptar);

        //Implementamos el evento click del botón
        btnAceptar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Creamos el Intent
                Intent intent = new Intent(MainActivity.this, SaludoActivity.class);

                //Creamos la información a pasar entre actividades
                Bundle b = new Bundle();
                b.putString("NOMBRE", txtNombre.getText().toString());
                b.putString("AP_PATERNO", txtApPaterno.getText().toString());
                b.putString("AP_MATERNO", txtApMaterno.getText().toString());


                //Añadimos la información al intent
                intent.putExtras(b);

                //Iniciamos la nueva actividad
                startActivity(intent);
            }
        });

    }
}