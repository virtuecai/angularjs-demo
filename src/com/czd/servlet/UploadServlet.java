package com.czd.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.czd.entity.UploadFileItem;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * @author CaiZhengDa
 * @version 2014年12月2日　1.0
 */
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 9121418593202872128L;

	private String filePath; // 文件存放目录
	private String tempPath; // 临时文件目录

	// 初始化
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// 从配置文件中获得初始化参数
		filePath = "/upload/";//config.getInitParameter("c:/upload/");
		tempPath = "/upload/tmp/";//config.getInitParameter("c:/upload/tmp/");

		ServletContext context = getServletContext();

		filePath = context.getRealPath(filePath);
		tempPath = context.getRealPath(tempPath);
		if(!new File(filePath).exists()) new File(filePath).mkdirs();
		if(!new File(tempPath).exists()) new File(tempPath).mkdirs();
		System.out.println("文件存放目录、临时文件目录准备完毕 ...");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter pw = response.getWriter();
		try {
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			// threshold 极限、临界值，即硬盘缓存 1M
			diskFactory.setSizeThreshold(4 * 1024);
			// repository 贮藏室，即临时文件目录
			diskFactory.setRepository(new File(tempPath));

			ServletFileUpload upload = new ServletFileUpload(diskFactory);
			// 设置允许上传的最大文件大小 4M
			upload.setSizeMax(40 * 1024 * 1024);
			// 解析HTTP请求消息头
			List<FileItem> fileItems = upload.parseRequest(request);
			Iterator<FileItem> iterator = fileItems.iterator();
			while (iterator.hasNext()) {
				FileItem item = iterator.next();
				if (item.isFormField()) {
					System.out.println("处理表单内容 ...");
					processFormField(item, pw);
				} else {
					System.out.println("处理上传的文件 ...");
					processUploadFile(item, pw);
				}
			}// end while()

			pw.close();
		} catch (Exception e) {
			System.out.println("使用 fileupload 包时发生异常 ...");
			e.printStackTrace();
		}// end try ... catch ...
	}

	// 处理表单内容
	private void processFormField(FileItem item, PrintWriter pw) throws Exception {
		String name = item.getFieldName();
		String value = item.getString();
		pw.println(name + " : " + value + "\r\n");
	}

	// 处理上传的文件
	private void processUploadFile(FileItem item, PrintWriter pw) throws Exception {
		// 此时的文件名包含了完整的路径，得注意加工一下
		String filename = item.getName();
		System.out.println("完整的文件名：" + filename);
		int index = filename.lastIndexOf("\\");
		filename = filename.substring(index + 1, filename.length());

		long fileSize = item.getSize();

		if ("".equals(filename) && fileSize == 0) {
			System.out.println("文件名为空 ...");
			return;
		}

		File uploadFile = new File(filePath + "/" + filename);
		item.write(uploadFile);

		System.out.println(filename + " 文件保存完毕 ...");
		System.out.println("文件大小为 ：" + fileSize + "\r\n");

		UploadFileItem uploadFileItem = new UploadFileItem();
		uploadFileItem.setFileName(filename);
		uploadFileItem.setFileSize(fileSize);
		uploadFileItem.setFilePath(filename);

		pw.write(uploadFileItem.toJsonString());
	}

}
