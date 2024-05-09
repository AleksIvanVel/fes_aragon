package com.example.calculadorapesodolar;

import android.os.Bundle;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import android.widget.EditText;
import android.widget.Button;
import android.view.View;

public class ConversorActivity extends AppCompatActivity {

    private EditText campoDolar;
    private EditText campoPesos;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_conversor);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        campoDolar = (EditText) findViewById(R.id.dolar);
        campoPesos = (EditText) findViewById(R.id.pesos);

        Button dolarAPesos = (Button) findViewById(R.id.dolar2pesos);
        Button pesosADolar = (Button) findViewById(R.id.pesos2dolar);

        dolarAPesos.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                try{
                    campoDolar.setText(""+Double.parseDouble(campoDolar.getText().toString())*19.92);
                }catch (Exception e){
                    campoPesos.setText(getResources().getString(R.string.valorInvalido));
                }
            }
        });
        pesosADolar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                try{
                    campoPesos.setText(""+Double.parseDouble(campoPesos.getText().toString())*0.05);
                }catch (Exception e){
                    campoPesos.setText(getResources().getString(R.string.valorInvalido));
                }

            }
        });

    }
}