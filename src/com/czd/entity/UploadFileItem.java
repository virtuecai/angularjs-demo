package com.czd.entity;

/**
 * @Aothor: VirtueCai
 * @CreatedOn: 2014/12/3 13:36
 */
public class UploadFileItem {

    //文件名称, 如: qq.exe
    private String fileName;
    //文件路径, 看需求, 一般两种, 1,相对路径:　/upload/qq.exe , 2绝对路径: c:/upload/qq.exe or 文件服务器地址: http://localhost/upload/qq.exe
    private String filePath;
    //文件大小字节
    private Long fileSize;

    public String getFileName() {
        return fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public Long getFileSize() {
        return fileSize;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    @Override
    public String toString() {
        return "UploadFileItem{" +
                "fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileSize=" + fileSize +
                '}';
    }

    /**
     * 构建 json 字符串
     *
     * @return
     */
    public String toJsonString() {
        return "{\"fileName\": \"" + fileName + "\", \"filePath\": \"" + filePath + "\", \"fileSize\": " + fileSize + "}";
    }

}
