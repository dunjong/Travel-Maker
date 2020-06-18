package com.kosmo.travelmaker.web.member;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kosmo.travelmaker.service.MemberDTO;
//validator인터페이스를 상속받았기 때문에 특정 DTO클래스를 (커맨드 객체)의 유효성 검증을 할 수 있는 자격을 갖춘 validator클래스 역할을 함
@Component("validator")
public class SignUpValidator implements Validator{
	//매개변수에 전달된 커맨드객체가 유효성검증을 지원할수있는 커맨드 객체인지 아닌지 판단하는 메소드 만약 
	//이메소드를 통과하지못하면 실제 유효성 검사를 하는 validate메소드가 호출되지않는다
	@Override
	public boolean supports(Class<?> command) {
		//매개변수로 받은  command가 formcommand타입인지 혹은 formcommand의 자식타입인지 판단하는 메소드 supports()메소드는 프레임워크가 호출함 
		//매개변수인 ocmmand는 컨트롤러 클래스가 매개변수로 받은 command객체를 넘겨준다
		//isAssignableFrom():command가 formcommand이거나 formcommand의 자식타입이라면 true 아니면 false 반환
		//return FormCommand.class.isAssignableFrom(command); 자식타입까지 확인
		return MemberDTO.class.equals(command);
	}
	//유효성검사를 하고자하는 커맨드객체가 맞는 경우에만 실행됨. 첫번째 매개변수:커맨드 객체
	//두번째 매개변수:에러정보를 저장할 errors타입(bindingresult타입)
	//-개발자가 컨트롤러 메소드에서 호출한다
	@Override
	public void validate(Object command, Errors errors) {
		//오류시 errors타입에 에러정보 저장 rejectValue(cmd의 속성명,에러코드); - 에러코드(중복 불가능) 임의로 정하면됨
		MemberDTO cmd = (MemberDTO)command;
		if (cmd.getName() == null || cmd.getName().trim().isEmpty()) {
			errors.rejectValue("name","nameError");
		}
		if (cmd.getEn_name() == null || cmd.getEn_name().trim().isEmpty()) {
			errors.rejectValue("en_name","en_nameError");
		}
		if (cmd.getRrn() == null || cmd.getRrn().equals("출생 연도를 선택하세요")) {
			errors.rejectValue("rrn","ageError");
		}
		if (cmd.getGender() == null) {
			errors.rejectValue("gender", "genderError");
		}
		
		
		if (cmd.getPassword() == null) {
			errors.rejectValue("password", "passwordError");
		} 
		else if(cmd.getPassword_check() == null || !cmd.getPassword().equals(cmd.getPassword_check())) {
			errors.rejectValue("password_check", "password_checkError");
		}
		if (cmd.getId() == null || cmd.getId().equals("")) {
			errors.rejectValue("id", "idError");
		}
	}
}
