package com.example.clientjava;

import androidx.appcompat.app.AppCompatActivity;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.EditText;



public class MainActivity extends AppCompatActivity {
    private TextView message;
    private Button bouton;
    private EditText saisir;
    
    
    
    
    public int reagir (View v){
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        
        
        String calcul= saisir.getText().toString();
        
        
        Socket sockfd;
        DataOutputStream enSortie;
        DataInputStream enEntree;
        int portno = 5001;
        byte[] buffer;
        
        try {
            
            
            sockfd = new Socket("10.0.2.2", portno);
            
            enSortie = new DataOutputStream(sockfd.getOutputStream());
            //System.out.printf("Entrez une operation : ");
            //Scanner clavier = new Scanner(System.in);
            //String str = clavier.nextLine();
            buffer = calcul.getBytes();
            enSortie.write(buffer, 0, buffer.length);
            
            enEntree = new DataInputStream(sockfd.getInputStream());
            buffer = new byte[256];
            int n = enEntree.read(buffer, 0, 255);
            String result = new String(buffer, 0, n);
            System.out.println("resultat = " + result);
            
            message.setText("Le résultat est "+ result );
            
            sockfd.close();
            
        } catch (UnknownHostException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
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

