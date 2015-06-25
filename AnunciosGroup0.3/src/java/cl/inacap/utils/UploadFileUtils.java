/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class UploadFileUtils {

    public static final String MainPath = "/home/diego/images";
    //public static final String MainPath = "/Users/macbookair/NetBeansProjects/AnunciosGroup0.4/AnunciosGroup0.3/web/images";
    //public static final String MainPath = "/var/lib/tomcat7/webapps/AnunciosGroup0.3/images";
    public static final String AnunciantePath = "/anunciante";
    public static final String DifusorPath = "/difusor";
    public static final String AdministradorPath = "/administrador";
    public static final String AnuncioPath = "/anuncio";

    public static Boolean validaEstructuraDirectorios(String rol, String usuario) {
        try {
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath));
            }
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol));
            }
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Boolean validaEstructuraDirectorios(String rol, String usuario, String anuncio) {
        try {
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath));
            }
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol));
            }
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario));
            }
            if (!Files.isDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario + "/" + anuncio))) {
                Files.createDirectory(Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario + "/" + anuncio));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public static Path getRuta(String rol, String usuario, String anuncio) {
        return Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario + "/" + anuncio);
    }

    public static Path getRuta(String rol, String usuario, String anuncio, String file) {
        return Paths.get(UploadFileUtils.MainPath + "/" + rol + "/" + usuario + "/" + anuncio + "/" + file);
    }

}
