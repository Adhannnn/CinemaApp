# cinema_application

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

This is Ilham. Here are some of the necessary components.
# All NECESSARY COMPONENTS.

#### Colors
Color.fromARGB(255, 14, 37, 34) //black
Color.fromARGB(255, 255, 253, 247) //soft cream
Color.fromARGB(255, 255, 196, 64) //orange

#### Orange Button (Text)
SizedBox(
    height: 42,
    width: 42,
    child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 14, 37, 34), //black
                width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
                BoxShadow(
                    offset: Offset(1, 2),
                    color: Colors.black.withOpacity(1), 
                ),
            ],
        ),
        child: IconButton(
            onPressed: () {
                Navigator.pop(context);
            },
            icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color.fromARGB(255, 14, 37, 34),
                size: 20, // Ukuran ikon tetap
            ),
        )
    )
),

### Orange Button Without Shadow (Icon)
ElevatedButton(
    onPressed: () {
        Navigator.pop(context);
    },
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 196, 64),
        foregroundColor: Color.fromARGB(255, 14, 37, 34),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
            color: Color.fromARGB(255, 14, 37, 34),
        ),
        ),
        padding: EdgeInsets.zero, // Pastikan padding tidak mengubah dimensi
    ),
    child: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Color.fromARGB(255, 14, 37, 34),
        size: 20, // Ukuran ikon tetap
    ),
),

### Orange Button with Shadow
Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 196, 64),
        border: Border.all(
            color: const Color.fromARGB(255, 14, 37, 34),
            width: 1.2,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
            BoxShadow(
                offset: const Offset(1, 2),
                color: Colors.black.withOpacity(1),
            ),
        ],
    ),
    child: IconButton(
        onPressed: () {
            Navigator.pop(context);
        },
        icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color.fromARGB(255, 14, 37, 34),
            size: 18,
        ),
    ),
),
