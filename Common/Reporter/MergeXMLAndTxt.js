	MergeXMLAndTxt();
   
   function MergeXMLAndTxt()
   {	
			var startTimeArr = new Array();
			var endTimeArr = new Array();
			var statusArr = new Array();

			var WshShell, fso;
            fso = new ActiveXObject("Scripting.FileSystemObject");
            WshShell = new ActiveXObject("WScript.Shell");
            var szPath = WshShell.CurrentDirectory;
            
            
			var tempFile = fso.OpenTextFile(szPath + "\\Report.txt", 1);
			while(!tempFile.AtEndOfStream)
			{
				var line = tempFile.ReadLine();
				var lineArr = line.split('þ');

				var uid = lineArr[0];
				startTimeArr[uid] = lineArr[1];
				endTimeArr[uid] = lineArr[2];
				statusArr[uid] = lineArr[3];
			}			
		
            var nodeid;
            var mxml = new ActiveXObject("Microsoft.XMLDOM");
            mxml.async = false;
            mxml.load("TAF_Report.xml"); // The report xml needs to be parameterized to ExecutionID

            //alert ("mxml=" + mxml.xml);
            var stepNodes = mxml.selectNodes("//Branch[@Type='STEP']");
            var i;
            var stepEle;
            var uid1;
			for(i = 0; i < stepNodes.length; i++)
			{
				stepEle = stepNodes[i];
				uid1 = stepEle.attributes.getNamedItem("UID").value;
		    	
	    		stepEle.attributes.getNamedItem("StartTime").value = startTimeArr[uid1];
		    	stepEle.attributes.getNamedItem("EndTime").value = endTimeArr[uid1];
		    	stepEle.attributes.getNamedItem("Status").value = statusArr[uid1];				
			}

			mxml.save(szPath + "\\TAF_Report.xml");
   }
