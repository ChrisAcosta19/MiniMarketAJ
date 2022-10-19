package DVMarket;

public aspect SalidaProductos {
	pointcut callborrarItem(): call(* Compra.borrar*(..));
	after(): callborrarItem(){
		try {
			
		} catch(Exception e) {
			
		}
	}
}
