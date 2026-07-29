class Employee {
    protected String Name;
    protected int Age;
    protected double ph;
    protected String address;
    protected float salary;

    Employee(String Name, int Age, double ph, String address, float salary) {
        this.Name = Name;
        this.Age = Age;
        this.ph = ph;
        this.address = address;
        this.salary = salary;
    }

    public void printemployee() {
        System.out.println("name:" + Name);
        System.out.println("age:" + Age);
        System.out.println("ph no:" + ph);
        System.out.println("address:" + address);
        System.out.println("salary" + salary);
    }
}

class Officer extends Employee {
    private String specilisation;

    Officer(String Name, int Age, double ph, String address, float salary,String specilisation) {

        super(Name, Age, ph, address, salary);
        this.specilisation = specilisation;
    }

    public void printdata() {
        printemployee();
        System.out.println("specilisation" + specilisation);
    }
}

class Manager extends Employee {
    String department;

    Manager(String Name, int Age, double ph, String address,float salary, String department) {
        super(Name, Age, ph, address, salary);
        this.department = department;
    }

    public void printdetails() {
        printemployee();
        System.out.println("department:" + department);
    }
}

class employee {
    public static void main(String[] args) {
        Officer O1 = new Officer("Ajay", 24, 947653832, "xxxx", 20000, "ph.d");
        O1.printdata();
        Manager M1 = new Manager("sree", 22, 568974435, "tdnt", 19000, "civil");
        M1.printdetails();
    }
}
