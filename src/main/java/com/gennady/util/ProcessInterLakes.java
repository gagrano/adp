/**
 * 
 */
package com.gennady.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * @author Gennady
 *
 */
public class ProcessInterLakes extends ProcessRN {

	/**
	 * 
	 */
	static Logger logger = Logger.getLogger(ProcessInterLakes.class);
	
	public ProcessInterLakes() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String inputFile = "punches.csv";
		String outputDir = "InterLakes";
		if (args != null && args.length == 2) {
			inputFile = args[0];
			outputDir = args[1];
		}

        run(inputFile, outputDir);
	}
	/**
	public void run2(String inputFile) {
		try {
			CSVReader reader = new CSVReader(new FileReader("punches.csv"), '\t');
		    String [] nextLine;
		    while ((nextLine = reader.readNext()) != null) {
		        // nextLine[] is an array of values from the line
		        System.out.println(nextLine[0] + nextLine[1] + "etc...");
		    }
		    reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		 
		
		String csvFile = "C:/documents/resnav/punches.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
	 
		try {
	 
			br = new BufferedReader(new FileReader(csvFile));
			int recNum = 0;
			/**
			Reader reader = new FileReader("C:/documents/resnav/punches.csv");

			CSVReader<String[]> csvPersonReader = CSVReaderBuilder.newDefaultReader(reader);
			List<String[]> punches = csvPersonReader.readAll();
			//while ((line = br.readLine()) != null) {
			        // use comma as separator
			//	String[] punches = line.split(cvsSplitBy);
	            for (int i=0; i < punches.size(); i++) {
	            	String[] record = punches.get(i);
	            	for (int j=0; j < record.length; j++) {
	            		System.out.print("Rec #"+i+", Code "+j+":" + record[j]);
	            	}
	            }
	            System.out.println();
			//}
	            csvPersonReader.close();
	            reader.close();
	           
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	 
		System.out.println("Done");
	  }
	
	public void run1() {
		try {
		//	File file = new File("C:/documents/resnav/punches.xlsx");
		//	FileInputStream fis = new FileInputStream(file);
		//	final Reader reader = new InputStreamReader(fis, "UTF-8");
		//	final CSVParser parser = new CSVParser(reader, CSVFormat.EXCEL.withHeader());

		    Reader in = new FileReader("C:/documents/resnav/punches.xlsx");
		Iterable<CSVRecord> records = CSVFormat.EXCEL.parse(in);
		int recNum = 0;
		for (final CSVRecord record : records) {
	        final String t1 = record.get(0);

		    String t2 = "";
		    System.out.println("Rec #"+recNum+", Code "+t1+":" + t2);
		    recNum++;
		}
		in.close();
		//fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	**/
	public static String run(String inputFile, String outputDir) {
		String result = "FAIL";
		try {
			
			File f = new File(inputFile);
			if (!f.exists()) {
				System.out.println("Such file does not exist: "+inputFile);
				return "Such file does not exist: "+inputFile;
			}
			System.out.println("Start processing file: "+inputFile);
            FileInputStream file = new FileInputStream(f);
 
            //Create Workbook instance holding reference to .xlsx file
            //XSSFWorkbook workbook = new XSSFWorkbook(file);
 
            //Get first/desired sheet from the workbook
            //XSSFSheet sheet = workbook.getSheetAt(0);
            
            Workbook workbook = WorkbookFactory.create(file);
            Sheet sheet = workbook.getSheetAt(0);
            //Iterate through each rows one by one
            Iterator<Row> rowIterator = sheet.iterator();
            ArrayList<ArrayList<Object>> alist = new ArrayList<ArrayList<Object>>();
            ArrayList<Object> rowlist = new ArrayList<Object>();
            rowlist.add("Co Code");
        	rowlist.add("Batch ID");
        	rowlist.add("File #");
        	rowlist.add("Reg Hours");
        	rowlist.add("O/T Hours");
        	rowlist.add("Temp Rate");
        	rowlist.add("");rowlist.add("");rowlist.add("");rowlist.add("");
        	alist.add(rowlist);
            int empIdx =-1, regHrIdx=-1, rateIdx=-1, flsaOtIdx =-1;
            while (rowIterator.hasNext())
            {
                Row row = rowIterator.next();
                //For each row, iterate through all the columns
                int rowNum = row.getRowNum();
                Iterator<Cell> cellIterator = row.cellIterator();
                //System.out.print("Row#"+row.getRowNum()+":");
                rowlist = new ArrayList<Object>();
                if (rowNum == 0) {
	                while (cellIterator.hasNext())
	                {
	                    Cell cell = cellIterator.next();
	                    int index = cell.getColumnIndex();
	                    double dbValue = 0;
	                    String strValue = "";
	                    switch (cell.getCellType())
	                    {
	                        case Cell.CELL_TYPE_NUMERIC:
	                        	dbValue = cell.getNumericCellValue();
	                            //System.out.print("[N"+index+"]"+dbValue + ",");
	                            break;
	                        case Cell.CELL_TYPE_STRING:
	                        	strValue = cell.getStringCellValue();
	                            //System.out.print("[S"+index+"]"+strValue + ",");
	                            break;
	                    }
                    	if ("TIEMPN".equalsIgnoreCase(strValue)) empIdx = index; 
                    	else if ("TIPRAT".equalsIgnoreCase(strValue)) rateIdx = index;
                    	else if ("TIREGH".equalsIgnoreCase(strValue)) regHrIdx = index; 
                    	else if ("TIOTT1".equalsIgnoreCase(strValue)) flsaOtIdx = index;
                    	else continue;	                    	
	                    	                    
	                }   
	                //System.out.println("");
                } else {
                	rowlist.add("RN2");
                	rowlist.add("RN2");
                	int empId = (int) row.getCell(empIdx).getNumericCellValue();
                	rowlist.add(empId+"");
                	Cell c = row.getCell(regHrIdx);
                	if (c.getNumericCellValue() == 0.0) rowlist.add("0");
                	else rowlist.add(c.getNumericCellValue());
                	
                	c = row.getCell(flsaOtIdx);
                	if (c.getNumericCellValue() == 0.0) rowlist.add("0");
                	else rowlist.add(c.getNumericCellValue());
                	
                	c = row.getCell(rateIdx);
                	if (c.getNumericCellValue() == 0.0) rowlist.add("0");
                	else rowlist.add(c.getNumericCellValue());
                	rowlist.add("");rowlist.add("");rowlist.add("");rowlist.add("");
                	alist.add(rowlist);
                }     
            }//while row iterator
            file.close();
            if (createCSVOutput("PRRN2EPI.CSV", outputDir, alist)) 
            	result = "OK";
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }	
		finally {
			
		}
		return result;
	}

}
