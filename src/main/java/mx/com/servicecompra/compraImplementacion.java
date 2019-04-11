package mx.com.servicecompra;

import javax.jws.WebService;

/**
 *
 * @author Josafat, Maximiliano y Francisco
 */
@WebService(endpointInterface = "mx.com.service.compraServicio")
public class compraImplementacion implements compraServicio {

    @Override
    public String processor(String data) {
        return WagesValProCom.processor(data);
    }

}