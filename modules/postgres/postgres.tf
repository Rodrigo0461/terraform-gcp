resource "google_sql_database_instance" "master" {
  name             = "instance-postgres"
  database_version = "POSTGRES_11"
  region           = "us-central1"

  settings {
    # type of machine of DB.
    tier = "db-f1-micro"
  }
}

#### Create Postgres DDBB
resource "google_sql_database" "bd" {
  name      = "test_db"
  instance  = "master-instance"
}

#### Create Credentials Users
resource "google_sql_user" "user" {
  name     = "user_test"
  instance = "instance-postgres"
  password = "passw0rd123456"
}