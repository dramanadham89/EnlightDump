/*****************************************************************************
  Name: DynimicFieldIdWebService.cls
  
  Author: HumanTocuh.llc
  
  ============================================================================
  Purpose:
  -------
  
  It is a webservice class. It helps Various Custom buttons to override standard "New" button and pre-populate desire fields.
  
  ============================================================================
  
  ============================================================================
  History:
  -------
  
  VERSION 	AUTHOR       		DATE        	DETAIL                FEATURES/CSR
      1.0 	HumanTocuh.llc     	12/10/2014   	Initial Release
  
  ============================================================================
         
 *****************************************************************************/
global class DynimicFieldIdWebService{
    
    /*************************************************************************
		Purpose: To get the Standard edit page link with key prefix of any object.
		
		Parameters: api name of object.
					
		Returns: return a string value that is standard edit page link with key prefix of any object.
		
		Throws: 
	 *************************************************************************/
    webservice static String getObjectKeyPrefix(String object_name){        
        return ('/' + objectKeyPrefix( object_name )  + '/e?nooverride=1');
    }    
    
    /*************************************************************************
		Purpose: To find the id of any field of an object.
		
		Parameters: Field label from Standard page, Object name.
					
		Returns: return a string value that is Id of given field.
		
		Throws: 
	 *************************************************************************/
    webservice static String getFieldId(String field_label,String object_name){
        // Obtain the magic ids
        PageReference p = new PageReference('/' + objectKeyPrefix( object_name ) + '/e?nooverride=1');
        String html;
        if (!Test.isRunningTest()){
            html = p.getContent().toString();
        }else{
            html = '<label for="(.*?)">(<span class="requiredMark">\\*</span>)?(.*?)</label>';
        }
        Map<String, String> labelToId = new Map<String, String>();
        Matcher m = Pattern.compile('<label for="(.*?)">(<span class="requiredMark">\\*</span>)?(.*?)</label>').matcher(html);
        while (m.find()) {
            String label = m.group(3);
            String id = m.group(1);
            if(label.equalsIgnoreCase(field_label))
                return id; // return field Id.
        }
        return '';
    }
    
    /*************************************************************************
		Purpose: To find the Key prefix of any object.
		
		Parameters: Object name.
					
		Returns: return a string value that is The key prefix of given object.
		
		Throws: 
	 *************************************************************************/
    private static String objectKeyPrefix( String objectType ){
        return Schema.getGlobalDescribe().get( objectType ).getDescribe().getKeyPrefix();
    }
}