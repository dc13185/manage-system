package com.ms.system.util;

import java.io.File;


public class FileUtils {


	

	public static int deleteFile(String storePath) {
		StringBuffer path=new StringBuffer();
		path.append(storePath);
		return new File(path.toString()).delete()?1:0;
	}

	public static void deleteDir(String storePath) {
		StringBuffer path=new StringBuffer();
		path.append(storePath);
		deleteFileByDir(new File(path.toString()));
	}
	
	private static void deleteFileByDir(File file){
		if(file.isDirectory()){
			File[] files = new File(file.getPath()).listFiles();
			for (File f : files) {
				if(f.isDirectory()){
					deleteFileByDir(f);
				}else{
					f.delete();
				}
			}
		}
		file.delete();
	}
	










}
