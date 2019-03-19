package com.ms.system.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MatcherUtils {

    /**
    * @Description:
    * @Param: [regex:正则, source:需要返回的匹配字符串]
    * @return: 匹配到的字符串
    * @Author: dong.chao
    * @Date: 2019/3/15
    */
    public static String getMatcher(String regex,String source){
        String result = "";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(source);
        while (matcher.find()) {
            result = matcher.group(0);
        }
        return result;
    }

	
	
}
