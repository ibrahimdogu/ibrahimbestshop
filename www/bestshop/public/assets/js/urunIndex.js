$(function(){

	$('#urunler').DataTable({

		"scrollY":        "200px",
		"scrollCollapse": true,
		"paging":         false,

		"ajax" : "/admin/urun/urunListele",
		"columns":[
		     {"data"	:	"urunNo"},
		     {"data"	:	"urunAd"},
		     {"data"	:	"urunBaslik"},
		     {"data"	:	"urunAciklama"},
		     {"data"	:	"urunFiyat"},
		     {"data"	:	"urunBarkod"},
				 {"data"	:	"urunFoto"},

		]

	});
});
