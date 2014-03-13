Initial_phase=['Aims & Topic','Format & Location','Important Dates','Travel','Accomodation','Sponsors & Grants']
Speaker_decided=Initial_phase + ['Speakers']
Sub_opened=Speaker_decided + ["Submission"]
Reg_opened= Sub_opened + ["Registration"]
Sub_closed=Reg_opened + ["Accepted Abstracts"] - ["Submission"]
Program_finalized = Sub_closed + ["Program"]
Reg_closed=Program_finalized - ["Registration"]
Post_conf=Reg_closed + ["Submission"] + ["Review finalized"] + ["Accepted papers"]
Publish_proceedings= Post_conf + ["Proceedings"]

Staging_hash= {
		1=>Initial_phase,
		2=>Speaker_decided,
		3=>Sub_opened,
		4=>Reg_opened,
		5=>Sub_closed,
		6=>Program_finalized,
		7=>Reg_closed,
		8=>Post_conf,
		9=>Publish_proceedings}


          


	   @list=  Staging_hash.values_at @stage_number

		puts @list





 










