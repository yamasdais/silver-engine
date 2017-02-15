object Hello extends App {
  val you: Option[String] = args match {
    case Array() => None
    case _ => Some(args(0))
  }
  //  if (args.isEmpty) None
  //  else Some(args(0))
  println(s"""Hello, ${you.getOrElse("World")}!""")

  // option for
  you.foreach{
    o => println(s"""Hey, ${o}!!""")
  }

  // for expression
  var cnt = 0;
  for (
    targ <- args
    if !targ.equals("boo")
  ) {
    if (cnt != 0) println(s"""Hi, ${targ}!""")
    cnt = cnt + 1
  }
}
