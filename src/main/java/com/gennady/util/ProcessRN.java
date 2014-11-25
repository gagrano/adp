/**
 * 
 */
package com.gennady.util;

import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 * @author Gennady
 *
 */
public class ProcessRN {
	public static boolean createCSVOutput(String fileName, String folder, ArrayList<ArrayList<Object>> alist) throws Exception {
		boolean result = true;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(System.currentTimeMillis());
		String fullFileName = folder+"/"+fileName;
		FileWriter fw = new FileWriter(fullFileName);
        for (ArrayList<Object> row: alist) {
        	for (int i=0; i< row.size(); i++) {
        		fw.write(row.get(i).toString());
        		if (i< row.size()-1) fw.write(",");
        	}
        	fw.write("\n\r");
        }
        fw.close();
        System.out.println("Created file: "+fullFileName);
        return result;
	}

}
