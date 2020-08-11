package DBPlayground.springbootjdbc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

@SpringBootApplication
public class DBSpringBoot implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(DBSpringBoot.class);

    public static void main(String[] args) {
        SpringApplication.run(DBSpringBoot.class, args);
    }

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... args) throws Exception {
            insert();
            update();
            select();
    }

    private void update() {
        String updateSQL = "UPDATE test_table SET testdesc = 'some new test in java spring boot' WHERE testId = 4;";
        jdbcTemplate.execute(updateSQL);
    }

    private void select() {
        String selectSQL = "SELECT * FROM test_table";
        jdbcTemplate.query(selectSQL, new
                RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                System.out.println(rs.getInt(1));
                System.out.println(rs.getString("testdesc"));
            }
        });
    }

    private void insert() {
        String insertSQL = "INSERT INTO test_table (testdesc) VALUES ('Some new Test in Java Spring Boot');";
        jdbcTemplate.execute(insertSQL);
    }


}
