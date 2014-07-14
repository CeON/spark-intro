import com.google.common.base.Splitter
import collection.JavaConversions._
import org.apache.spark.{SparkConf, SparkContext}

/*** SimpleApp.scala ***/

object SimpleApp {
  def main(args: Array[String]) {
    val file = "file:///etc/passwd" // Should be some file on your system
    val sc = new SparkContext(new SparkConf().setAppName("Spark Count"))
    val data = sc.textFile(file, 2)
    val sizes = data.map(Splitter.on(":").omitEmptyStrings().split).map(_.size).cache()
    val min = sizes.reduce(math.min)
    val max = sizes.reduce(math.max)
    println(s"Min value: $min. Max value: $max.")
  }
}

