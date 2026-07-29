
import java.util.Scanner;
class DoublyLL{
	Scanner sc =new Scanner(System.in);
	private Node head;
	class Node{
		private int data;
		Node left;
		Node right;
		public Node(int data) {
			this.data=data;
			this.left=null;
			this.right=null;
		}
	}
	
	public void insertAtEnd(int data) {
		Node temp=new Node(data);
		if(head==null) {
			head=temp;
		}
		else {
			Node ptr=head;
			while(ptr.right!=null) {
				ptr=ptr.right;
			}
			ptr.right=temp;
			temp.left=ptr;
		}
		System.out.println(data +" is inserted successfully");
	}
	
	public void deleteAtFront(int data) {
		if(head==null) {
			System.out.println("List is Empty");
		}
		else {			
			Node ptr=head;
			while(ptr.data!=data) 
				ptr=ptr.right;
			if(ptr.left!=null)
				ptr.left.right=ptr.right;
			if(ptr.right!=null)
				ptr.right.left=ptr.left;
			if(ptr==head)
				head=ptr.right;
			ptr=null;	
		}
	}
	
	public void display() {
		Node temp=head;
		if(head==null) {
			System.out.println("List is Empty");
		}
		else {
			while(temp!=null) {
				System.out.print(temp.data+"\t");
				temp=temp.right;
			}
		}
		System.out.println();
	}
}
public class DoublyLinkedList {
	public static void main(String[] args) {
		DoublyLL dl=new DoublyLL();
		int ch=0;
		while(ch!=4) {
			System.out.println("\nDoubly Linked List Operations\n1.Insertion\n2.Deletion\n3.Display\n4.Exit\nEnter your choice\n");
			Scanner sc =new Scanner(System.in);
			ch=sc.nextInt();
			sc.nextLine();
			switch(ch) {
				case 1:System.out.println("Enter the element");
					int elt=sc.nextInt();
					sc.nextLine();
					dl.insertAtEnd(elt);
					break;
				case 2:System.out.println("Enter the element to be deleted");
					int elt1=sc.nextInt();
					dl.deleteAtFront(elt1);
					break;
				case 3:dl.display();
					break;
				case 4:System.exit(0);
					
				default:System.out.println("Invallid choice");
			}
		}
	}
}
