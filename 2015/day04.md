So I wanted to use Java. This is definitively not an elegant solution.
After a Bash and two ruby-solutions, this is not what I'm proud of. Perhaps
I'll find a better way, but here's my running code:

````java
public static int getHashAnswer(String key)
    throws NoSuchAlgorithmException {
  int i;
  for (i = 0; !new String(Hex.encodeHex(
      getMd5().digest((key + Integer.toString(i)).getBytes())))
          .startsWith("00000"); i++) {
  }
  System.out.println(key + Integer.toString(i) + " -> "
      + new String(Hex.encodeHex(getMd5()
          .digest((key + Integer.toString(i)).getBytes()))));
  return i;
}

private static MessageDigest getMd5() throws NoSuchAlgorithmException {
  if (md5 == null)
    md5 = MessageDigest.getInstance("MD5");
  return md5;
}
````

This can be definitely done much more nicely.

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md)
