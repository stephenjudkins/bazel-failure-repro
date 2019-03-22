
import com.google.common.hash.BloomFilter;
import com.google.common.hash.Funnel;
import com.google.common.hash.PrimitiveSink;

public class JavaSource {

    public static class TestFunnel implements Funnel<String> {

        private static final long serialVersionUID = -5814744004508116956L;

        public void funnel(String from, PrimitiveSink into) {
            into.putString(from, null);
        }
    }

    public static final Funnel<String> addressFunnel = new TestFunnel();

    public static BloomFilter<String> newInstance(int expectedInsertions) {
        return BloomFilter.create(addressFunnel, expectedInsertions);
    }
}
