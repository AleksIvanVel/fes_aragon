package com.example.aplicacion_2

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class SaludoActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        lateinit var txtSaludo : TextView

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_saludo)
        //Obtenemos una referencia a los controles de la interfaz
        txtSaludo = findViewById(R.id.txtSaludo)
        //Recuperamos la información pasada en el intent
        val saludo = intent.getStringExtra("NOMBRE")
        //Construimos el mensaje a mostrar
        txtSaludo.text = "Hola $saludo"
    }

}