var timout = 0;
function count() {
	var sds = document.getElementById("dum");
	if (sds == null) {
		alert("You are using a free package.\n You are not allowed to remove the tag.\n");
	}
	var sdss = document.getElementById("dumdiv");
	if (sdss == null) {
		alert("You are using a free package.\n You are not allowed to remove the tag.\n");
	}
	if (sdss != null) {
		if (timout == 0) {
			var startTime = document.getElementById('hms').innerHTML;
			var pieces = startTime.split(":");
			var time = new Date();
			time.setHours(pieces[0]);
			time.setMinutes(pieces[1]);
			time.setSeconds(pieces[2]);
			var timedif = new Date(time.valueOf() - 1000);

			var newtime = timedif.toTimeString().split(" ")[0];
			var newtimearr = newtime.split(":");
			document.getElementById('hrs').innerHTML = newtimearr[0];
			document.getElementById('mts').innerHTML = newtimearr[1];
			document.getElementById('sec').innerHTML = newtimearr[2];
			document.getElementById('hms').innerHTML = newtime;
			if (newtime == "00:00:00") {
				clearTimeout(time_out);
				timout = 1;
				alert("Your Time Out..")

			}
			time_out = setTimeout(count, 1000);
		}
	}
}
