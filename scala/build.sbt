scalaVersion := "2.11.8"

val scalazVersion = "7.2.8"

libraryDependencies ++= Seq(
  "org.scalaz" %% "scalaz-core" % scalazVersion,
  "org.scalaz" %% "scalaz-effect" % scalazVersion,
//  "org.scalaz" %% "scalaz-typelevel" % scalazVersion,
  "org.scalaz" %% "scalaz-scalacheck-binding" % scalazVersion
)

//libraryDependencies += "org.scalaz" %% "scalaz-core" % scalazVersion

scalacOptions += "-feature"

initialCommands in console := "import scalaz._, Scalaz._"
