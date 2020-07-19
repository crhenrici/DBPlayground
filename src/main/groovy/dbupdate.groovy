import groovy.sql.Sql

def config = new ConfigSlurper().parse(new File('../resources/dbconfig.groovy').toURL())
println config

Map dbConnParams = [
        url: "jdbc:mariadb://${config.db.host}/testdb",
        user: "${config.db.user}",
        password: "${config.db.pw}",
        driver: 'org.mariadb.jdbc.Driver']
def sql = Sql.newInstance(dbConnParams)
sql.executeUpdate("UPDATE test_table SET testdesc = 'some test' WHERE testId = 2;")
sql.close()