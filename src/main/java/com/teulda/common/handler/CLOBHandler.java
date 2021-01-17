package com.teulda.common.handler;

import java.io.StringReader;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

//오라클에서 Long타입을 사용했을 때 MyBatis에서 Long타입을 제대로 가져오지 못해서 발생하는 에러 잡기 위한 Handler
//참고 Blog : https://ming9mon.tistory.com/68
public class CLOBHandler implements TypeHandler<Object> {

	@Override
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		String s = (String) parameter;
		StringReader reader = new StringReader(s);
		ps.setCharacterStream(i, reader, s.length());
	}

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getString(columnName);
	}

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getString(columnIndex);
	}

	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}