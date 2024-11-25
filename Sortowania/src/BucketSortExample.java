import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class BucketSortExample {
    public static void BucketSort( int[] arr) {
        int number_of_buckets = arr.length;
        List<Integer>[] buckets = new List[number_of_buckets];
        int k = (int) Math.ceil(Math.log(arr.length) / Math.log(2)); // k= log2(lenght)

        // bukcets lista list int
        for (int i = 0; i < arr.length; i++) {
            buckets[i] = new ArrayList<>();
        }
        // przypisanie do kubłków
        for (int i = 0; i < (arr.length); i++) {
            int bucketIndex = msbits(arr[i], k);  // Uzyskujemy numer kubełka na podstawie msbits
            buckets[bucketIndex].add(arr[i]);
        }
        // sortowanie w kubkach
        for (int i=0; i<buckets.length-1; i++) {

            Collections.sort(buckets[i]);
        }
        // scalenie
        int index = 0;
        for (int i = 0; i < arr.length; i++) {
            for (int num : buckets[i]) {
                arr[index++] = num;
            }
        }
    }
    public static int msbits(int x, int k) { // x - liczba, k - ile bitów chcemy wyciągnąć
        int shiftAmount= Integer.bitCount(x)-k;
        int shifted_x= x >> shiftAmount;
        int mask =(1<<k)-1;
        return shifted_x & mask;
    }
    public static void main(String[] args) {
        int[] myArray = {1, 22, 3,21,5,19,16,8,11,10};
        BucketSort(myArray);
        for (int i: myArray){
            System.out.print(i + " ");
        }
    }
}

