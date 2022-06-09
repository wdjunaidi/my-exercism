import java.time.*
import java.time.temporal.*

class Gigasecond(initialTime: LocalDateTime) {

    constructor(localDate : LocalDate): this(LocalDateTime.of(localDate, LocalTime.MIN))

    val date: LocalDateTime = initialTime.plus(1_000_000_000, ChronoUnit.SECONDS)
}
