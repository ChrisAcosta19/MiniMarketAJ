package DVMarket;

import java.io.*;

import org.aspectj.lang.reflect.MethodSignature;

public aspect BusquedaSistema {
	pointcut callbuscar(Object o): call(* buscar*(..)) && target(o) ;
	
	before(Object o): callbuscar(o){
		MethodSignature signature = (MethodSignature) thisJoinPoint.getSignature();
	    String methodName = signature.getMethod().getName();
	    
	    try (BufferedWriter br = new BufferedWriter(new FileWriter("consultas.log",true))) {
			String linea = o.getClass()+";"+Tiempo.fechaDeHoy()+";"+Tiempo.horaExacta()+";"+methodName;
			br.write(linea);
			br.newLine();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
