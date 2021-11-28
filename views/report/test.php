
   <div id="chart"></div>
	 <div id="w3"></div>
<?php

$this->registerJs('var w3 = c3.generate({
data:{
columns:[
["จำนวนครั้งการใช้รถ","4"],

["จำนวนครั้งการใช้รถ2","6"],

["จำนวนครั้งการใช้รถ3","20"],
["จำนวนครั้งการใช้รถ4","150"]
]

,

types:{
"จำนวนครั้งการใช้รถ":"pie",
"จำนวนครั้งการใช้รถ2":"pie",
"จำนวนครั้งการใช้รถ3":"pie",
"จำนวนครั้งการใช้รถ4":"pie",

}

},
color:{
  pattern: ["#22B14C", "#ff7f0e", "#d62728", "#ffbb78", "#2ca02c", "#98df8a", "#d62728"], 
    }
,
axis:{"x":{

type:"category",
categories:["ทะเบียน  กฟ 5471","ทะเบียน  1ณด 2547","ทะเบียน  ดก-5474","ทะเบียน  41-2345","ทะเบียน  41-6616","ทะเบียน  41-6617","ทะเบียน  41-6618"],


"label":{"text":"",
position:"outer-middle"}

},
interaction: {
  enabled: false
}

}



});

');

?>


<?php

$this->registerJs('

var json_labels = '.json_encode($labels).';

var json_data = '.json_encode($data).';
var pie = '.$pie.';

var w3 = c3.generate({
	data:{
		columns:json_data,
		types:pie
	},
	color:{
	  pattern: ["#22B14C", "#ff7f0e", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728"], 
	},
	axis:{
	x:{
		type:"category",
		categories: json_labels,
	label:{
		text:"test",
		position:"outer-middle"}
	},
}

});

');

?>