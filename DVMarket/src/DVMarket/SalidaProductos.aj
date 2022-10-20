package DVMarket;

import java.io.*;

public aspect SalidaProductos {
	pointcut callborrarItem(Compra c, Item i): call(void Compra.borrarItem(Item)) && target(c) && args(i);
	
	after(Compra c, Item i) returning: callborrarItem(c, i){
		try (BufferedWriter br = new BufferedWriter(new FileWriter("market.log",true))) {
			String linea = "eliminarProducto;"+i.getNombre()+";"+Tiempo.fechaDeHoy()+";"+Tiempo.horaExacta();
			br.write(linea);
			br.newLine();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
