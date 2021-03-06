class ChecksumAccumulator {
  private var sum = 0;
  def add(b: Byte): Unit = sum += b;
  def checksum(): Int = ~(sum & 0xff) + 1;
}

import scala.collection.mutable;

// companion object のサンプル
// クラス定義と同じソースファイルに実装しなければならない
// 自動生成クラス(synthetic class)のインスタンスとなる
object ChecksumAccumulator {
  private val cache = mutable.Map.empty[String, Int];
  def calculate(s: String): Int =
    if (cache.contains(s)) {
      cache(s)
    } else {
      val acc = new ChecksumAccumulator
      for (c <- s)
        acc.add(c.toByte)
      val cs = acc.checksum()
      cache += (s -> cs)
      cs
    }
}
