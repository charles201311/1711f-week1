package com.zhangsan.week1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.zhangsan.week1.domain.Brand;
import com.zhangsan.week1.domain.Goods;
import com.zhangsan.week1.domain.Type;
import com.zhangsan.week1.service.GoodsService;
/**
 * 
 * @author charles
 *
 */
@Controller
public class GoodsController {
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("goods")
	public String goods(Model model, Goods goods,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3") Integer pageSize) {
		PageInfo<Goods> info = goodsService.selects(goods, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("goods", goods);
		
		return "goods";
	}
	
	//��ת������ҳ�� //ֻ֧��get����
	@GetMapping("add")
	public  String add() {
		
		return "add";
	}
	//ִ������
	@ResponseBody
	@PostMapping("add")
	public boolean add(Goods goods,MultipartFile file) {
		//�ж��Ƿ��ϴ��ļ�
		if(null!=file && !file.isEmpty()) {
			String path="d:/week1/";
			//Ϊ�˷����ļ������ظ����ı��ϴ� ���ļ����� a.jpg
			String oldFileName = file.getOriginalFilename();
			String fileName =UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			File f = new File(path ,fileName);
			try {//д��Ӳ��
				file.transferTo(f);
				//��ƷͼƬ�ĵ�ַ����
				goods.setPic(fileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return goodsService.insert(goods) >0;
	}
	//����
	@ResponseBody
	@GetMapping("selectTypes")
	public List<Type> selectTypes(){
		return goodsService.selectTypes();
	}
	
	///Ʒ��
	@ResponseBody
	@GetMapping("selectBrands")
	public List<Brand> selectBrands(){
		return goodsService.selectBrands();
	}
}
