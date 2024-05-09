package com.example.aplicacion_1;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;


public class SaludoActivity extends AppCompatActivity{
    @SuppressLint("SetTextI18n")

    private TextView saludo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_saludo);

        //Localizar los controles
        TextView saludo = (TextView) findViewById(R.id.txtSaludo);

        //Recuperamos la información pasada en el intent
        Bundle bundle = this.getIntent().getExtras();

        //Construimos el mensaje a mostrar
        assert bundle != null;
        saludo.setText("Hola " + bundle.getString("NOMBRE") + bundle.getString("AP_PATERNO") + bundle.getString("AP_MATERNO") );
    }
}
