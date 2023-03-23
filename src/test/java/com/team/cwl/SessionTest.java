package com.team.cwl;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SessionTest extends MyTestCase{

	@Autowired
	private SqlSession session;
	@Test
	public void test() {
		assertNotNull(session.getConnection());
	}

}
