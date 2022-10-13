object ScrabbleScore {

    val scoreMap = mapOf(
        'b' to 3,
        'c' to 3,
        'd' to 2,
        'f' to 4,
        'g' to 2,
        'h' to 4,
        'j' to 8,
        'k' to 5,
        'm' to 3,
        'p' to 3,
        'q' to 10,
        'v' to 4,
        'w' to 4,
        'x' to 8,
        'y' to 4,
        'z' to 10
    )

    fun scoreLetter(c: Char): Int = scoreMap[c.lowercaseChar()] ?: 1

    fun scoreWord(word: String): Int {
      return word.map { c -> scoreLetter(c) }.sum()
    }
}
