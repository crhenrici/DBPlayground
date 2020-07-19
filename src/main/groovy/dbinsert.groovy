import groovy.sql.Sql

def config = new ConfigSlurper().parse(new File('../resources/dbconfig.groovy').toURL())
println config

Map dbConnParams = [
        url: "jdbc:mariadb://${config.db.host}/testdb",
        user: "${config.db.user}",
        password: "${config.db.pw}",
        driver: 'org.mariadb.jdbc.Driver']
def sql = Sql.newInstance(dbConnParams)
sql.executeInsert("INSERT INTO test_table (testdesc) VALUES ('Test');")
sql.close()