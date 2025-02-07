import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class HelloWorldTest {

    @Test
    public void testGetGreeting() {
        HelloWorld helloWorld = new HelloWorld();
        String greeting = helloWorld.getGreeting();
        assertEquals("Hello, World!", greeting);
    }
}
