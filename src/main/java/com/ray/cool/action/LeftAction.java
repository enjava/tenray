package com.ray.cool.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.ray.cool.entity.*;
import com.ray.cool.mail.SendEmail;
import com.ray.cool.mail.SendMailCode;
import com.ray.cool.service.*;
import com.ray.cool.utils.SignUtil;
import com.ray.cool.utils.ThUtil;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author en
 * 
 */
@Controller("leftAction")
@Scope("prototype")
public class LeftAction {

	@Resource
	// 获取套餐业务类
	private PackageService packageService;
	@Resource
	// 获取订单业务类
	private OrderService orderService;
	private List<Order> orderList;

	@Resource
	// 获取订单业务类
	private UserService userService;
	private List<User> userList;

	private long selectRadio;
	private String total;

	@Resource
	// 等级业务类
	private LeveService leveService;
	private String leveDes;// 会员等级描述

	private String userName;
	private String userOldPWD;
	private String inputUserPWD;
	private String oldPhoneNumber;
	private String newPhoneNumber;
	private String oldPhoneCode;
	private String newPhoneCode;

	private String newMailCode;// 新email验证码
	private String oldMailCode;// 旧email验证码
	private String newMailAddr;// 新email地址

	private String payPassword;
	private String inputVerifyPay;
	private String oldPayPassword;
	private String newPayPassword;

    private File idBackImg;//身份证背面
    private String idBackImgContentType;
    private String idBackImgFileName;

    private File idFaceImg;//正面头像
    private String idFaceImgContentType;//正面头像
    private String idFaceImgFileName;//正面头像


    private String idFace;//身份证正面
    private String idBack;//身份证背面
    private String idName;//身份证姓名
    private String iDcard;// 身份证

	@Resource
	// 推荐奖励业务类
	private RecommendedAwardService recommendedAwardService;

    public void uploadIdFace()throws Exception{
        User user = ThUtil.sysUser();
        String strResult = Action.ERROR;
        if (user != null) {
            if (idFaceImg != null) {
                //1、保存头像到upload/user
                //获取保存路径的绝对地址
                String filePath = ServletActionContext.getServletContext().getRealPath("upload/idpic");
                String fileName = UUID.randomUUID().toString().replaceAll("-", "") + idFaceImgFileName.substring(idFaceImgFileName.lastIndexOf("."));
                //复制文件
                FileUtils.copyFile(idFaceImg, new File(filePath, fileName));

                //2、设置用户头像路径
                user.setHeadImg("idpic/" + fileName);
            }
        }
    }
	/**
	 * 变更支付密码
	 * 
	 * @throws Exception
	 */
	public void updatePayPasswd() throws Exception {
		User user = ThUtil.sysUser();
		String strResult = Action.ERROR;
		if (user != null && !ThUtil.isEmpty(oldPayPassword) && !ThUtil.isEmpty(inputVerifyPay)
				&& !ThUtil.isEmpty(newPayPassword)) {
			payPassword = user.getPayPassword();
			String update_pay_passwd_code = ThUtil.getSessionStr("update_pay_passwd_code"); // ThUtil.put("update_pay_passwd_code",
			// // code);

			if (!oldPayPassword.equals(payPassword)) {
				ThUtil.response("olderror");
				return;
			}

			if (!inputVerifyPay.equals(update_pay_passwd_code)) {
				ThUtil.response("verifyerror");
				return;
			}

			if (!(newPayPassword.length() < 6)) {
				user.setPayPassword(newPayPassword);
				userService.update(user);
				ThUtil.put("user", user);
				strResult = Action.SUCCESS;
			}
		}
		ThUtil.response(strResult);

	}

	/**
	 * 更改交易密码时,手机验证
	 * 
	 * @throws Exception
	 */
	public void sendUpdatePayPasswdPhoneCode() throws Exception {
		User user = ThUtil.sysUser();
		String strResult = Action.ERROR;
		if (user != null && !ThUtil.isEmpty(oldPayPassword) && !ThUtil.isEmpty(newPayPassword)) {
			String paypass = user.getPayPassword();
			if (!oldPayPassword.equals(paypass)) {
				ThUtil.response("olderror");
				return;
			}

			if (newPayPassword.length() >= 6) {
				String phone = user.getMobile();
				String code = ThUtil.nextStr();
				SignUtil.sendPayPasswd(phone, code);
				// ThUtil.put("new_pay_passwd", newPayPassword);
				ThUtil.put("update_pay_passwd_code", code);
				strResult = Action.SUCCESS;
			} else
				strResult = "pw<6";
		}
		ThUtil.response(strResult);

	}

	/**
	 * 保存支付密码
	 * 
	 * @throws Exception
	 */
	public void savePayPasswd() throws Exception {
		User user = ThUtil.sysUser();
		String strResult = Action.ERROR;
		if (user != null && !ThUtil.isEmpty(inputVerifyPay) && !ThUtil.isEmpty(payPassword)) {
			String verifyPay = (String) ThUtil.getSessionValue("pay_passwd_code");
			String passwdNum = (String) ThUtil.getSessionValue("pay_passwd_number");

			if (inputVerifyPay.equals(verifyPay) && passwdNum.equals(payPassword)) {

				user.setPayPassword(passwdNum);
				userService.update(user);
				ThUtil.put("user", user);
				strResult = Action.SUCCESS;
			}

		}
		ThUtil.response(strResult);

	}

	/**
	 * 新增交易密码,发送手机验证码
	 */
	public void sendPayPasswdPhoneCode() throws Exception {
		User user = ThUtil.sysUser();
		String strResult = Action.ERROR;
		if (user != null && !ThUtil.isEmpty(payPassword)) {
			if (!(payPassword.length() < 6)) {
				String phone = user.getMobile();
				String code = ThUtil.nextStr();
				SignUtil.sendPayPasswd(phone, code);
				ThUtil.put("pay_passwd_code", code);
				ThUtil.put("pay_passwd_number", payPassword);
				strResult = Action.SUCCESS;
			}
		}
		ThUtil.response(strResult);

	}

	/**
	 * 发送邮箱验证码
	 * 
	 * @throws Exception
	 */
	public void sendMailCode() throws Exception {

		User user = ThUtil.sysUser();
		String strResult = "fail";
		if (user != null && !ThUtil.isEmpty(newMailAddr) && ThUtil.isEmail(newMailAddr)) {
			SendMailCode mail = new SendMailCode();
			String code = ThUtil.nextStr();
			mail.setCode(code);

			mail.setToAddr(newMailAddr);

			// 发送验证码邮件
			SendEmail.doSendNormalMail(mail);
			ThUtil.put("newmailcode", code);
			ThUtil.put("newmailaddr", newMailAddr);
			strResult = "success";

		}
		ThUtil.response(strResult);

	}

	/**
	 * 发送原邮箱验证码
	 * 
	 * @throws Exception
	 */
	public void sendOldMailCode() throws Exception {

		User user = ThUtil.sysUser();
		String strResult = "fail";

		if (user != null && !ThUtil.isEmpty(newMailAddr) && ThUtil.isEmail(newMailAddr)) {
			SendMailCode mail = new SendMailCode();
			String code = ThUtil.nextInt() + "";
			mail.setCode(code);
			String addr = user.getEmail();
			mail.setToAddr(addr);

			// 发送验证码邮件
			SendEmail.doSendNormalMail(mail);
			ThUtil.put("oldmailcode", code);
			strResult = Action.SUCCESS;

		}
		ThUtil.response(strResult);

	}

	/**
	 * 发送新邮箱验证码
	 * 
	 * @throws Exception
	 */
	public void sendNewMailCode() throws Exception {

		User user = ThUtil.sysUser();
		String strResult = "fail";

		if (user != null && !ThUtil.isEmpty(newMailAddr) && ThUtil.isEmail(newMailAddr) && !ThUtil.isEmpty(oldMailCode)) {

			String oldCode = (String) ThUtil.getSessionValue("oldmailcode");
			if (oldCode.equals(oldMailCode)) {
				List<User> usr = userService.getByEmail(newPhoneNumber);// 检查邮箱是否被注册
				if (!(usr.size() > 0)) {
					SendMailCode mail = new SendMailCode();
					String code = ThUtil.nextInt() + "";
					mail.setCode(code);
					mail.setToAddr(newMailAddr);

					// 发送验证码邮件
					SendEmail.doSendNormalMail(mail);
					ThUtil.put("newmailcode", code);
					ThUtil.put("newmailaddr", newMailAddr);
					strResult = Action.SUCCESS;
				} else
					strResult = "mailexist";
			} else
				strResult = "oldcodeerror";
		}
		ThUtil.response(strResult);

	}

	/**
	 * 保存邮箱
	 * 
	 * @throws Exception
	 */
	public void saveEmail() throws Exception {
		User user = ThUtil.sysUser();
		String strResult = Action.ERROR;
		if (user != null && !ThUtil.isEmpty(newMailAddr) && ThUtil.isEmail(newMailAddr) && !ThUtil.isEmpty(newMailCode)) {
			String addr = (String) ThUtil.getSessionValue("newmailaddr");
			String code = (String) ThUtil.getSessionValue("newmailcode");

			if (!ThUtil.isEmpty(addr) && !ThUtil.isEmpty(code)) {
				if (addr.equals(newMailAddr) && code.equals(newMailCode)) {
					user.setEmail(newMailAddr);
					userService.update(user);
					ThUtil.put("user", user);

					strResult = Action.SUCCESS;
				}
			}

		}
		ThUtil.response(strResult);

	}

	/**
	 * 修改邮箱
	 * 
	 * @throws IOException
	 */
	public void updateEmail() throws IOException {
		User user = ThUtil.sysUser();
		if (user != null && !ThUtil.isEmpty(newMailCode) && !ThUtil.isEmpty(oldMailCode)
				&& !ThUtil.isEmpty(newMailAddr) && ThUtil.isEmail(newMailAddr)) {
			String newAddr = (String) ThUtil.getSessionValue("newmailaddr");
			String newCode = (String) ThUtil.getSessionValue("newmailcode");
			String oldcode = (String) ThUtil.getSessionValue("oldmailcode");
			if (newMailAddr.equals(newAddr) && newMailCode.equals(newCode) && oldMailCode.equals(oldcode)) {
				user.setEmail(newAddr);
				userService.update(user);
				ThUtil.response(Action.SUCCESS);
				ThUtil.put("user", user);
			}

		}

	}

	/**
	 * 发送新手机验证码
	 * 
	 * @throws IOException
	 */
	public void sendNewPhoneCode() throws IOException {
		User user = ThUtil.sysUser();
		String strResult = "fail";
		if (user != null && ThUtil.isPhoneNum(newPhoneNumber)) {
			String getPhonecode = (String) ThUtil.getSessionValue("oldphoneCode");
			if (oldPhoneCode.equals(getPhonecode)) {
				if (user.getMobile().equals(newPhoneNumber)) {
					ThUtil.response("newisold");
					return;
				}
				List<User> usr = userService.getBymobile(newPhoneNumber);// 检查手机是否被注册
				if (!(usr.size() > 0)) {
					String code = ThUtil.nextInt() + "";
					SignUtil.sendOldPhone(newPhoneNumber, code);
					ThUtil.put("newPhoneCode", code);
					ThUtil.put("newPhoneNumber", newPhoneNumber);
					strResult = "success";
				} else
					strResult = "newphonenumfail";
			} else
				strResult = "oldcodefail";
			// ThUtil.response("oldcodefail");

		}
		ThUtil.response(strResult);

	}

	/**
	 * 发送旧手机验证码
	 * 
	 * @throws IOException
	 */
	public void sendOldPhoneCode() throws IOException {
		User user = ThUtil.sysUser();
		String strResult = "fail";
		if (user != null && !ThUtil.isEmpty(oldPhoneNumber)) {

			String oldPhone = user.getMobile();
			String code = ThUtil.nextInt() + "";
			if (!ThUtil.isEmpty(oldPhone) && oldPhoneNumber.equals("188666124")) {
				SignUtil.sendOldPhone(oldPhone, code);
				ThUtil.put("oldphoneCode", code);
				strResult = "success";
			}

		}
		ThUtil.response(strResult);

	}

	/**
	 * 修改手机
	 * 
	 * @throws IOException
	 */
	public void updateMobile() throws IOException {
		User user = ThUtil.sysUser();
		if (user != null && !ThUtil.isEmpty(newPhoneNumber) && !ThUtil.isEmpty(oldPhoneCode)
				&& !ThUtil.isEmpty(newPhoneCode)) {
			String sessionOldPhonecode = (String) ThUtil.getSessionValue("oldphoneCode");
			String sessionNewPhoneCode = (String) ThUtil.getSessionValue("newPhoneCode");
			String sessionNewPhoneNumber = (String) ThUtil.getSessionValue("newPhoneNumber");
			if (sessionOldPhonecode.equals(oldPhoneCode) && sessionNewPhoneCode.equals(newPhoneCode)
					&& sessionNewPhoneNumber.equals(newPhoneNumber)) {
				List<User> usr = userService.getBymobile(sessionNewPhoneNumber);// 检查手机是否被注册
				if (!(usr.size() > 0)) {
					user.setMobile(sessionNewPhoneNumber);
					userService.update(user);
					ThUtil.response("success");
					ThUtil.put("user", user);
				} else
					ThUtil.response("fail");
			}

		}

	}

	/**
	 * 修改密码
	 * 
	 * @throws IOException
	 */
	public void updatePass() throws IOException {
		User user = ThUtil.sysUser();
		if (user != null && !ThUtil.isEmpty(userOldPWD) && !ThUtil.isEmpty(inputUserPWD)) {
			if (userOldPWD.equals(user.getPassword())) {
				user.setPassword(inputUserPWD);
				userService.update(user);
				ThUtil.response("success");
				ThUtil.put("user", user);
			} else
				ThUtil.response("OldPWDfail");
		}

	}

	/**
	 * 修改昵称
	 * 
	 * @throws IOException
	 */
	public void saveNick() throws IOException {
		User user = ThUtil.sysUser();
		if (user != null && !ThUtil.isEmpty(userName)) {
			user.setUsername(userName);
			userService.update(user);
			ThUtil.response("success");
			ThUtil.put("user", user);
		}

	}

	/**
	 * 生成推荐奖励
	 * 
	 * @param user
	 * @param order
	 */
	private void saveAward(User user, Order order, MyPackage myPackage, Double leve, Leve userLeve) {
		if (user != null && order != null && myPackage != null) {
			if (user.getParent() != null) {// 检查是否有父类
				RecommendedAward award = new RecommendedAward();
				User user1 = userService.getById(user.getParent().getId());
				double rate = leveService.getById(user1.getLeve().getId()).getRate();// 获取父类的收益比率

				double mleveGrade = rate - leve;// 如果比间接推广的级别低 负数,就没有收益
				if (mleveGrade < 0) {

					rate = leve;
					mleveGrade = 0;
				}

				double rewardDouble = mleveGrade * Double.parseDouble(myPackage.getPrice());// 推荐奖励
				String rewardStr = String.valueOf(rewardDouble).substring(0, String.valueOf(rewardDouble).indexOf('.'));
				award.setLeveGrade(mleveGrade);// 级差比例
				award.setReward(rewardStr);// 推荐奖励
				award.setUserLeve(userLeve.getDescription());// 会员等级描述
				award.setLeve(userLeve.getRate());// 会员等级
				award.setUser(user1);// 设置用户
				award.setOrder(order);// 设置订单
				award.setOrderMoney(myPackage.getPrice());// 设置订单金额
				award.setOrderUserId(order.getUser().getId());
				award.setState("0");// 设置状态 0为未支付
				award.setOrderbuyTime(order.getBuyTime());

				if (leve == 0)
					award.setPushType("直推");
				else
					award.setPushType("间推");
				recommendedAwardService.save(award);
				saveAward(user1, order, myPackage, rate, userLeve);
			}

		}
	}

	/**
	 * 推荐奖励
	 * 
	 * @return
	 * @throws Exception
	 */
	public String recommended_award() throws Exception {
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		if (attibutes.containsKey("user")) {

			User user = (User) attibutes.get("user");

			Set<RecommendedAward> awards = user.getRecommendedAwards();
			if (awards.size() > 0) {
				Long[] awardIds = new Long[awards.size()];
				int i = 0;
				for (RecommendedAward award : awards) {
					awardIds[i] = award.getId();
					i++;
				}
				double pushTotalDouble = 0.0;
				List<RecommendedAward> awardList = recommendedAwardService.getByIds(awardIds);
				for (RecommendedAward recommendedAward : awardList) {
					if (recommendedAward.getOrder() != null) {
						if (recommendedAward.getState().equals("1") && recommendedAward.getOrderfinshiTime() != null) {
							pushTotalDouble += Double.parseDouble(recommendedAward.getReward());
							continue;
						}
						Order order = orderService.getById(recommendedAward.getOrder().getId());
						if (order.getState().equals("1") && order.getFinishTime() != null) {
							recommendedAward.setState("1");
							recommendedAward.setOrderfinshiTime(order.getFinishTime());
							recommendedAwardService.update(recommendedAward);
							pushTotalDouble += Double.parseDouble(recommendedAward.getReward());
						}
					}
				}
				String pushTotal = String.valueOf(pushTotalDouble).substring(0,
						String.valueOf(pushTotalDouble).indexOf('.'));
				if (attibutes.containsKey("pushTotal"))
					ActionContext.getContext().getSession().remove("pushTotal");
				if (attibutes.containsKey("awardList"))
					ActionContext.getContext().getSession().remove("awardList");
				ActionContext.getContext().getSession().put("pushTotal", pushTotal);
				ActionContext.getContext().getSession().put("awardList", awardList);

			}
		}
		return "recommended_award";

	}

	/**
	 * 账户中心
	 * 
	 * @return
	 * @throws Exception
	 */
	public String account_center() throws Exception {
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		if (attibutes.containsKey("user")) {
			User user = (User) attibutes.get("user");
            if(user.getLeve()!=null)
                leveDes = leveService.getById(user.getLeve().getId()).getDescription();
		}
		return "account_center";
	}

	/**
	 * 用户购买套餐
	 * 
	 * @return
	 * @throws Exception
	 */
	public String buy() throws Exception {
		List<MyPackage> packageList = packageService.findAll();
		ActionContext.getContext().getSession().put("packageList", packageList);

		return "buy";
	}

	/**
	 * 购买 及记录
	 * 
	 * @return
	 * @throws Exception
	 */
	public String investment_record() throws Exception {
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		if (attibutes.containsKey("user")) {
			User user = (User) attibutes.get("user");
			if (selectRadio > 0) {
				if (attibutes.containsKey("packageList")) {
					attibutes.remove("packageList");

					Order order = new Order();
					order.setId(Long.valueOf(SignUtil.timeStamp().substring(4)));
					order.setBuyTime(new Date());
					order.setUser(user);
					order.setState("0");
					MyPackage myPackage = packageService.getById(selectRadio);
					if (myPackage != null) {
						order.setMyPackage(myPackage);
						if (myPackage.getPrice().equals("3000")) {
							String is3000 = user.getIs3000();
							if (is3000 == null || !is3000.equals("1")) {// 没有买过3000的订单
																		// 购买3000的订单
								orderService.save(order);
								user.setIs3000("1");
								userService.update(user);// 更新user
								ActionContext.getContext().getSession().put("user", user);
								Leve userLeve = null;
								if (user.getLeve() != null)
									userLeve = leveService.getById(user.getLeve().getId());
								else {
									userLeve = new Leve();
									userLeve.setId(1l);
									userLeve.setDescription("普通会员");
									userLeve.setRate(0d);
								}
								saveAward(user, order, myPackage, 0d, userLeve);

							}

						} else {
							orderService.save(order);// 保存订单
							Leve userLeve = null;
							if (user.getLeve() != null)
								userLeve = leveService.getById(user.getLeve().getId());
							else {
								userLeve = new Leve();
								userLeve.setId(1l);
								userLeve.setDescription("普通会员");
								userLeve.setRate(0d);
							}

							saveAward(user, order, myPackage, 0d, userLeve);
						}
					}
				}
			}
			user = userService.getById(user.getId());
			Set<Order> orders = user.getOrders();//出现懒加载异常
			Double totalDouble = 0d;
			if (orders != null) {
				orderList = new ArrayList<Order>();
				for (Order orderStr : orders) {
					Order order = orderService.getById(orderStr.getId());
					totalDouble += Double.parseDouble(order.getMyPackage().getPrice());
					orderList.add(order);
				}
				total = totalDouble + "";
				ActionContext.getContext().put("orderList", orderList);
			}

		}
		return "investment_record";
	}

	public String present_record() throws Exception {
		return "present_record";
	}

	public String my_project() throws Exception {
		return "my_project";
	}

	public String buy_back_log() throws Exception {
		return "buy_back_log";
	}

	public String earnings_log() throws Exception {
		return "earnings_log";
	}

	public String recommend() throws Exception {
		return "recommend";
	}

	/**
	 * 我的团队
	 * 
	 * @return
	 * @throws Exception
	 */
	public String my_team() throws Exception {
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		if (attibutes.containsKey("user")) {
			User user = (User) attibutes.get("user");
			// if (user.getChildren() != null)
			if (user != null) {
				userList = new ArrayList<User>();
				userList.add(user);
				findAllChildren(user);
			}
		}
		return "my_team";
	}

	/**
	 * 我的团队 递归查询所有的下级会员
	 * 
	 * @param user
	 */
	public void findAllChildren(User user) {
		List<User> users = userService.findChildren(user.getId());
		if (users != null)
			for (User usr : users) {
				if (usr != null) {
					userList.add(usr);
					findAllChildren(usr);
				}
			}
	}

	public String operating_reward() throws Exception {
		return "operating_reward";
	}

	public String self1() throws Exception {
		return "self1";
	}

	public String bank_account() throws Exception {
		return "bank_account";
	}

	public String security_information1() throws Exception {
		return "security_information1";
	}

	public String address1() throws Exception {
		return "address1";
	}

	public String binding() throws Exception {
		return "binding";
	}

	public String project_news() throws Exception {
		return "project_news";
	}

	public String buy_back_information() throws Exception {
		return "buy_back_information";
	}

	public String message() throws Exception {
		return "message";
	}

    public long getSelectRadio() {
        return selectRadio;
    }

    public void setSelectRadio(long selectRadio) {
        this.selectRadio = selectRadio;
    }

    public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getLeveDes() {
		return leveDes;
	}

	public void setLeveDes(String leveDes) {
		this.leveDes = leveDes;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserOldPWD() {
		return userOldPWD;
	}

	public void setUserOldPWD(String userOldPWD) {
		this.userOldPWD = userOldPWD;
	}

	public String getInputUserPWD() {
		return inputUserPWD;
	}

	public void setInputUserPWD(String inputUserPWD) {
		this.inputUserPWD = inputUserPWD;
	}

	public String getOldPhoneNumber() {
		return oldPhoneNumber;
	}

	public void setOldPhoneNumber(String oldPhoneNumber) {
		this.oldPhoneNumber = oldPhoneNumber;
	}

	public String getNewPhoneNumber() {
		return newPhoneNumber;
	}

	public void setNewPhoneNumber(String newPhoneNumber) {
		this.newPhoneNumber = newPhoneNumber;
	}

	public String getOldPhoneCode() {
		return oldPhoneCode;
	}

	public void setOldPhoneCode(String oldPhoneCode) {
		this.oldPhoneCode = oldPhoneCode;
	}

	public String getNewPhoneCode() {
		return newPhoneCode;
	}

	public void setNewPhoneCode(String newPhoneCode) {
		this.newPhoneCode = newPhoneCode;
	}

	public String getNewMailCode() {
		return newMailCode;
	}

	public void setNewMailCode(String newMailCode) {
		this.newMailCode = newMailCode;
	}

	public String getNewMailAddr() {
		return newMailAddr;
	}

	public void setNewMailAddr(String newMailAddr) {
		this.newMailAddr = newMailAddr;
	}

	public String getOldMailCode() {
		return oldMailCode;
	}

	public void setOldMailCode(String oldMailCode) {
		this.oldMailCode = oldMailCode;
	}

	public String getPayPassword() {
		return payPassword;
	}

	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}

	public String getInputVerifyPay() {
		return inputVerifyPay;
	}

	public void setInputVerifyPay(String inputVerifyPay) {
		this.inputVerifyPay = inputVerifyPay;
	}

	public String getOldPayPassword() {
		return oldPayPassword;
	}

	public void setOldPayPassword(String oldPayPassword) {
		this.oldPayPassword = oldPayPassword;
	}

	public String getNewPayPassword() {
		return newPayPassword;
	}

	public void setNewPayPassword(String newPayPassword) {
		this.newPayPassword = newPayPassword;
	}

    public File getIdBackImg() {
        return idBackImg;
    }

    public void setIdBackImg(File idBackImg) {
        this.idBackImg = idBackImg;
    }

    public String getIdBackImgContentType() {
        return idBackImgContentType;
    }

    public void setIdBackImgContentType(String idBackImgContentType) {
        this.idBackImgContentType = idBackImgContentType;
    }

    public String getIdBackImgFileName() {
        return idBackImgFileName;
    }

    public void setIdBackImgFileName(String idBackImgFileName) {
        this.idBackImgFileName = idBackImgFileName;
    }

    public File getIdFaceImg() {
        return idFaceImg;
    }

    public void setIdFaceImg(File idFaceImg) {
        this.idFaceImg = idFaceImg;
    }

    public String getIdFaceImgContentType() {
        return idFaceImgContentType;
    }

    public void setIdFaceImgContentType(String idFaceImgContentType) {
        this.idFaceImgContentType = idFaceImgContentType;
    }

    public String getIdFaceImgFileName() {
        return idFaceImgFileName;
    }

    public void setIdFaceImgFileName(String idFaceImgFileName) {
        this.idFaceImgFileName = idFaceImgFileName;
    }
}
