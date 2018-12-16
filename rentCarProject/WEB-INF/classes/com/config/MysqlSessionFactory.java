package com.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MysqlSessionFactory {
    private static SqlSessionFactory sqlSessionFactory =null;   //변수를 static 스코프 안에서 사용하기 위해서 얘도 static
    static {  //딱 한번 실행하고 말려고 static
        String resource = "com/config/Configuration.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sqlSessionFactory =
         new SqlSessionFactoryBuilder().build(inputStream);
    }// end static

    public static SqlSession getSession() {
        return sqlSessionFactory.openSession();
    }
}//end class
