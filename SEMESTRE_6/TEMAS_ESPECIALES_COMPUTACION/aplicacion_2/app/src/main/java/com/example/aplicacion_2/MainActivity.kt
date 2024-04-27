package com.example.aplicacion_2

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //Obtenemos una referencia a los controles de la interfaz
        txtNombre = this.findViewById(R.id.txtNombre)
        btnAceptar = findViewById(R.id.btnAceptar)

    }
}