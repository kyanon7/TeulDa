package com.teulda.user.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Search;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data wiring
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",//pageSize?
																	"classpath:config/context-aspect.xml",//접점(포인트컷)
																	"classpath:config/context-mybatis.xml",//마이바티스
																	"classpath:config/context-transaction.xml" })//트랜잭션,접점(포인트컷)
//건들x
public class ReportServiceTest {
	

}
