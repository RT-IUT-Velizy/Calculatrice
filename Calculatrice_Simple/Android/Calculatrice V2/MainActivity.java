package com.example.helloworld;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    private TextView message;
    private Button bouton;
    private EditText saisir;


    public int reagir (View v){
        final String calcul= saisir.getText().toString();
        if (!calcul.isEmpty()){
            /*
            char num1 = calcul.charAt(0);
            char num2 = calcul.charAt(2);
            char op = calcul.charAt(1);
            int a = Character.getNumericValue(num1);
            int b = Character.getNumericValue(num2);
             */
            if (calcul.contains("+")){
                String[] valeurs = calcul.split("\\+");
                String num1 = valeurs[0];
                String num2 = valeurs[1];
                int a = Integer.parseInt(num1);
                int b = Integer.parseInt(num2);
                int res = a + b;
                message.setText("Le résultat est "+ String.valueOf(res) );
            } else if(calcul.contains("-")){
                String[] valeurs = calcul.split("-");
                String num1 = valeurs[0];
                String num2 = valeurs[1];
                int a = Integer.parseInt(num1);
                int b = Integer.parseInt(num2);
                int res = a - b;
                message.setText("Le résultat est "+ String.valueOf(res) );
            } else if (calcul.contains("/")){
                String[] valeurs = calcul.split("/");
                String num1 = valeurs[0];
                String num2 = valeurs[1];
                int a = Integer.parseInt(num1);
                int b = Integer.parseInt(num2);
                int res = a / b;
                message.setText("Le résultat est "+ String.valueOf(res) );
            } else if (calcul.contains("*")){
                String[] valeurs = calcul.split("\\*");
                String num1 = valeurs[0];
                String num2 = valeurs[1];
                int a = Integer.parseInt(num1);
                int b = Integer.parseInt(num2);
                int res = a * b;
                message.setText("Le résultat est "+ String.valueOf(res) );
            }


        }
        return 0;
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        message = (TextView) findViewById(R.id.messageID);
        bouton = (Button) findViewById(R.id.boutonID);
        saisir = (EditText) findViewById(R.id.saisirID);
    }

}
