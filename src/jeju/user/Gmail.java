package jeju.user;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("jeju131316","rhdck2019!!");
    }
}
//출처: https://ndb796.tistory.com/40 [안경잡이개발자]



