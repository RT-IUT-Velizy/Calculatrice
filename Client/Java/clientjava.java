import java.io.DataInput;
        import java.io.DataInputStream;
        import java.io.DataOutputStream;
        import java.io.IOException;
        import java.net.Socket;
        import java.net.UnknownHostException;
        import java.util.Scanner;
public class main {

    public static void main(String[] args) {
        Socket sockfd;
        DataOutputStream enSortie;
        DataInputStream enEntree;
        int portno = 5001;
        byte[] buffer ;

        try {
            sockfd = new Socket("127.0.0.1",portno);
            enSortie = new DataOutputStream(sockfd.getOutputStream());
            System.out.printf("Entrez une operation : ");
            Scanner clavier = new Scanner(System.in);
            String str = clavier.nextLine();
            buffer = str.getBytes();
            enSortie.write(buffer,0,buffer.length);

            enEntree = new DataInputStream(sockfd.getInputStream());
            buffer = new byte[256];
            int n = enEntree.read(buffer,0,255);
            String message = new String(buffer,0,n);
            System.out.println("resultat = "+ message);

            clavier.close();
            sockfd.close();

        } catch (UnknownHostException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}



