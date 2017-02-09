val you: Option[String] =
  if (args.length == 0) None
  else Some(args(0))
println("Hello, " + you.getOrElse("World") + "!")
for (
  targ <- args
) {
  println("Hello, " + targ + "!")
}
