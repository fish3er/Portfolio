public class BubbleSortExample {
    public static void bubbleSort(int[] arr) {
       int count = arr.length; // ilość przejść
       while (count > 1) { // prawdopodobnie najmiejsza możliwa ilość przejść alby skoczyć
           for (int i = 0; i < arr.length - 1; i++) { // tylko jedno przejście
               if (arr[i] > arr[i + 1]) {
                   int temp = arr[i];
                   arr[i] = arr[i + 1];
                   arr[i + 1] = temp;
               }


           }
           count--;
       }
    }
    public static void main(String[] args) {
        int[] myArray = {10, 9, 8,7,6,5,4,3,2,1};
        bubbleSort(myArray);
        for (int i : myArray){
            System.out.print(i);
        }
    }
}
