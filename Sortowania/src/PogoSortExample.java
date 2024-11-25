import java.util.Random;
public class PogoSortExample {
    public static boolean isSorted(int[] array) {
      for (int i = 1; i < array.length; i++) {
          if (array[i] < array[i - 1]) {
              return false;
          }

      }return true;
    }



    public static void shuffleArray(int[] array) {
        Random rand = new Random();
        for (int i = 1; i < array.length; i++) {
            int elem_to_swap = rand.nextInt(i + 1);
            int temp = array[i];
            array[i] = array[elem_to_swap];
            array[elem_to_swap] = temp;
        }
    }
    public static void pogoSort(int[] array){
        while (true){
            if (isSorted(array)){
                break;
            }else{
                shuffleArray(array);
            };
        }
    }

    public static void main(String[] args) {
        // krótkie testy
        int[] myArray = {1, 2, 3,4,5,6,7,8,9,10};
        shuffleArray(myArray);

        for (int num : myArray) {
            System.out.print(num + " ");

        }
        System.out.println();
        long startTime = System.currentTimeMillis();
        pogoSort(myArray);
        long endTime = System.currentTimeMillis();
        long elapsedTime = endTime - startTime;
        System.out.println("Pogosort: " + elapsedTime + " ms");
        for (int num : myArray) {
            System.out.print(num + " ");
        }



    }
}

