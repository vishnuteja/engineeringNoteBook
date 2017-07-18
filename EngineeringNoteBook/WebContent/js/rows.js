 function addRow2(tableID) {
 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
			row.id = 'oneTst';
 
            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "text";
			element1.name='deli';
			element1.size="20"
            cell1.appendChild(element1);
 
            var cell3 = row.insertCell(1);
            var element2 = document.createElement("input");
            element2.type = "text";
			element2.name= 'plan';
			element2.size="40";
            cell3.appendChild(element2);

			var cell4=row.insertCell(2);
			var element3=document.createElement("input");
			element3.type="text";
			element3.size="40";
			element3.name= 'did';
			cell4.appendChild(element3);

			var cell5=row.insertCell(3);
			var element5=document.createElement("input");
			element5.type="text";
			element5.size="10";
			element5.name= 'size';
			cell5.appendChild(element5);
            
			var cell6=row.insertCell(4);
			var element6=document.createElement("input");
			element6.type="text";
			element6.size="10";
			element6.name= 'effort';
			cell6.appendChild(element6);
        }
		
 	function addRow3(tableID)
 	{
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
			row.id = 'oneTst';
            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "text";
			element1.name='gap';
			element1.size="70"
            cell1.appendChild(element1);
            var cell3 = row.insertCell(1);
            var element2 = document.createElement("input");
            element2.type = "text";
			element2.name= 'lesson';
			element2.size="70";
            cell3.appendChild(element2);
       }
		
		function addRow4(tableID)
		{
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
			row.id = 'oneTst';
            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "text";
			element1.name='deliverable';
			element1.size="70"
            cell1.appendChild(element1);
            var cell3 = row.insertCell(1);
            var element2 = document.createElement("input");
            element2.type = "text";
			element2.name= 'accomlish';
			element2.size="70";
            cell3.appendChild(element2);
        }