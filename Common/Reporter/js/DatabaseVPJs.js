

function DatabaseVP(format , xmlPath)
{
	try{
		var dbXMLPath = xmlPath;
		dbXMLPath =  dbXMLPath.replace("/", "\\"); //xmlPath;
		
		var mxml = new ActiveXObject("Microsoft.XMLDOM");
		mxml.async = false		  		
		mxml.load(dbXMLPath); 	  		
		var table = mxml.selectSingleNode("//table");
		var rows = table.childNodes;
			
		var	excel = null;
		var excelType = false;
		if(format == "KSOExcel"){
			
			try{
				excel= new ActiveXObject("et.Application");
				excelType = true;
			}
			catch (e){
				try{
					excel= new ActiveXObject("Excel.Application");
				}
				catch (ex){
					alert("An exception occured. Either Kingsoft/MSExcel is not installed on the system.Unable to display the results");
					return;
				}
			}
			
		}else{
			try{
				excel= new ActiveXObject("Excel.Application");
			}
			catch (e){
				try{
					excel= new ActiveXObject("et.Application");
					excelType = true;
				}
				catch (ex){
					alert("An exception occured. Either Kingsoft/MSExcel is not installed on the system.Unable to display the results");
					return;
				}
			}
		}
		
		var oBook = excel.Workbooks.Add();
		var oSheet = oBook.Worksheets(1);
		var rowCnt = 2;
		var firstUnmatch=1;
		for (var i = 0; i < rows.length; i++) 
		{
			var row = rows.item(i);					
			if (i==0){  	
				var colHeaders = row.childNodes;
				for(var jj=0;jj<colHeaders.length;jj++)
				{
					var colHeader = colHeaders.item(jj);
					var columnName = colHeader.getAttribute("name");
					oSheet.Cells(1,jj+1) = columnName;
				}
			}

			var unMatch = row.selectNodes("td//data[@type='expected']");
			if(unMatch.length>0)
			{
				var cols = row.childNodes;
				for(var j=0;j<cols.length;j++)
				{
					var col = cols.item(j);
					var dataList = col.childNodes;
					var dataText = "";
					var actual = "";
					var expected = "";
				
					for(var k=0;k<dataList.length;k++)
					{
						var data = dataList.item(k);
						var fontcolor  = data.getAttribute("fontcolor");
						var type = data.getAttribute("type");
						dataText = data.text;
						if(type=="expected"){
							expected = dataText  ;
						}else if(type=="actual"){
							actual = dataText;
						}else{
							dataText = data.text;
						}
					}
			   						
					if(dataList.length <2){
						oSheet.Cells(rowCnt,j+1) = dataText;
						
					}
					else{						
						oSheet.Cells(rowCnt,j+1) = expected +" "+ actual;
						oSheet.Cells(rowCnt, j+1).Characters(1,expected.length).Font.ColorIndex = 10;
						oSheet.Cells(rowCnt, j+1).Characters(expected.length+1,actual.length+1).Font.ColorIndex = 3;

					}					  				
				}
				firstUnmatch=0;
				rowCnt =rowCnt +1;
				if(rowCnt > 49999 && excelType==true){
						alert('The mismatched rows have exceeded 50000. Mismatch rows till 50000 will be displayed.');
						excel.Visible = true;
						return;
				}
			}
		}
		
		excel.Visible = true;
	}catch(e){
		alert('An error occurred: '+e.message);
	}
}

