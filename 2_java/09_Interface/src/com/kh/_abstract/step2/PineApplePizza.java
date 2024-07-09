package com.kh._abstract.step2;

public class PineApplePizza extends Pizza{

	public PineApplePizza(int price, String brand) {
		super(price, brand);
		
	}

	@Override
	public void makePizza() {System.out.println(this.brand +"의 파인애플 피자 가격은 "+ this.price +"원\r\n"
			+ "피자 반죽과 함께 도우를 빚다.\r\n"
			+ "토핑은 파인애플을 포함시킨다.\r\n"
			+ "피자를 180도에서 10분간 구운다.\r\n"
			+ "피자를 8등분으로 자른다.\r\n"
			+ "피자를 포장한다.");
	}

	@Override
	public void info() {System.out.println(brand + "의 파인애플 피자 가격은 " + price + "원");
	}

	@Override
	public void topping() {System.out.println("토핑은 파인애플을 포함시킨다.");
	}

}
