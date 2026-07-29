abstract class Shapes {
   abstract public void noOfSides();
}

class Rectangle extends Shapes {
   public void noOfSides() {
      System.out.println("rectangle has 4sides");
   }
}

class Triangle extends Shapes {
   public void noOfSides() {
      System.out.println("Triangle has 3 sides");
   }
}

class Hexagon extends Shapes {
   public void noOfSides() {
      System.out.println("Hexagon has 6 sides");
   }
}

class Shape {
   public static void main(String[] argv) {
      Shapes myshape;
      myshape = new Rectangle();
      myshape.noOfSides();
      myshape = new Triangle();
      myshape.noOfSides();
      myshape = new Hexagon();
      myshape.noOfSides();
   }
}
