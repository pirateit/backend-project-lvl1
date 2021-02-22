import std.stdio;
import std.conv;
import std.string;
import std.array;

void main(string[] array) {

    // Если пользователь ничего не передал в аргументы, то просим исправить
    if (array.length <= 1) {
        return writeln("Please, use syntax: sort (numbers)\nExample: sort 5 154 7 1 25 97");
    }

    // Преобразование строк в числа
    int[] arrayNum;
    foreach (num; array) {
        // Если пользователь ввёл буквы вместо чисел, то пропускаем их
        try {
            to!int(num);
        }
        catch (ConvException e) {
            continue;
        }
        arrayNum ~= to!int(num);
    }

    // Наверное, стандартный шаблон "пузырьковой сортировки"
    foreach (k, j; arrayNum) {
        bool isSort = true;
        for (int i = 0; i < arrayNum.length - 1 - k; i += 1) {
            if (arrayNum[i] > arrayNum[i + 1]) {
                isSort = false;
                immutable int temp = arrayNum[i + 1];
                arrayNum[i + 1] = arrayNum[i];
                arrayNum[i] = temp;
            }
        }
        if (isSort == true)
            break;
    }

    // Обратное преобразование чисел в строки
    string[] result;
    foreach (num; arrayNum) {
        result ~= to!string(num);
    }

    // Вывод результата со склейкой через запятую
    writeln("Your result is: ", result.join(", "));
}
