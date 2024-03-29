package ladder
import org.grails.plugins.springsecurity.service.AuthenticateService

class Player implements EntityBase{
    static AuthenticateService authenticateService=new AuthenticateService();
    	
    static hasMany = [authorities: Authority]
    static belongsTo = Authority

    String firstName
    String lastName
    String userName
    String email
    String phone
    String password
    /** enabled */
    boolean enabled=true
    boolean emailShow=true

    /** description */
    String description = ''

    /** plain password to create a MD5 password */
    String pass = ''

    static transients = [ 'name','pass' ]
    //	static hasMany = [levels:Level]
    static constraints = {
        //NOTE: validation: http://grails.org/doc/latest/ 7.4
        firstName( blank:false)
        lastName (blank:false)
        userName(blank:false,unique:true)
                
        email (blank:true, email:true)
        phone matches:/\d{10}/
                
        //enabled()
        //emailShow()
        description blank:true
        password(blank:false,minSize:3)
        /**
        , validator: {//@@NOTE:validator can not rename
                val, obj ->
                //issue#16 @TODO: complete the confirm password validation, why 'Cannot invoke method encodePassword() on null object'?
                //                 log.info("@@password:"+obj?.properties['password'])
                //                 log.info("@@pass:"+obj?.properties['pass'])
                //                 log.info("@@authenticateService"+authenticateService)
                //
                //                if((null!=obj.properties['pass'])&&(val!=authenticateService.encodePassword("abc"))){
                //                     log.info("@@start:")
                //                    //log.info("@@encoded:"+(obj.properties['pass']!=null)?authenticateService.encodePassword(obj.properties['pass']):"null")
                //                    obj.properties['pass']=null
                //                    obj.properties['password']=null
                //                    return ['password.notMatch']
                //                }
                //                log.info("@@passvalidation:")
        
            }
        )
        **/
    }
    public String getName(){//@@Note:String.metaClass.mixin StringUtils
        return LadderUtils.formatName(firstName)+"."+LadderUtils.formatName(lastName)

    }
    public String toString(){
        return getName()

    }

    public  String getUserName(){
        return (null==firstName&&null==lastName)?"":firstName.toLowerCase()+"_"+lastName?.toLowerCase()
    }

    public boolean hasAdminRole(){
        return authorities.contains(Authority.findByAuthority("ROLE_ADMIN"))
    }
}
