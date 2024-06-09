package it.unisa.model;
import java.util.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class User {
    private String email;
    private String nome;
    private String cognome;
    private String indirizzo;
    private String citta;
    private String prov;
    private String cap;
    private String password;

    // Getter e setter per email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter e setter per nome
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    // Getter e setter per cognome
    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    // Getter e setter per indirizzo
    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    // Getter e setter per città
    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    // Getter e setter per provincia
    public String getProv() {
        return prov;
    }

    public void setProv(String prov) {
        this.prov = prov;
    }

    // Getter e setter per CAP
    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    // Getter e setter per password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

public interface UserDao {
    boolean checkIfEmailExists(String email);
    boolean registerUser(User user);
    User loginUser(String email, String password);
}

public class UserDaoImpl implements UserDao {
    // Simulazione del database in memoria utilizzando una mappa
    private final Map<String, User> userDatabase;

    public UserDaoImpl() {
        this.userDatabase = new HashMap<>();
    }

    @Override
    public void addUser(User user) {
        userDatabase.put(user.getEmail(), user);
    }

    @Override
    public User getUserByEmail(String email) {
        return userDatabase.get(email);
    }

    @Override
    public List<User> getAllUsers() {
        return new ArrayList<>(userDatabase.values());
    }

    @Override
    public void updateUser(User user) {
        userDatabase.put(user.getEmail(), user);
    }

    @Override
    public void deleteUser(String email) {
        userDatabase.remove(email);
    }
}

public class UserService {
    private UserDao userDao = new UserDaoImpl();

    public String registerUser(User user) {
        String message = "";
        // Controlla se l'email è già presente nel DB
        if (userDao.checkIfEmailExists(user.getEmail())) {
            message = "L'email è già registrata.";
        } else {
            // Cifra la password
            String hashedPassword = hashPassword(user.getPassword());
            user.setPassword(hashedPassword);
            // Registra l'utente nel DB
            if (userDao.registerUser(user)) {
                message = "Registrazione avvenuta con successo.";
            } else {
                message = "Si è verificato un errore durante la registrazione.";
            }
        }
        return message;
    }

    public String loginUser(String email, String password) {
        String message = "";
        // Controlla se l'utente esiste nel DB
        User user = userDao.loginUser(email, password);
        if (user != null) {
            // L'utente è autenticato
            message = "Benvenuto, " + user.getNome();
            // Setta l'utente autenticato nella sessione o come attributo di richiesta
        } else {
            message = "Spiacenti, non sei registrato.";
        }
        return message;
    }

    // Metodo per cifrare la password utilizzando SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
            for (byte b : encodedHash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null; // Gestione dell'eccezione
        }
    }
}

