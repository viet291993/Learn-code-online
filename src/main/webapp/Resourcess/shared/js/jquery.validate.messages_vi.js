$.extend($.validator.messages, {
	required: "Vui lòng cung cấp thông tin này",
	remote: "Vui lòng nhập đúng.",
	email: "Vui lòng nhập email.",
	url: "Vui lòng nhập URL.",
	date: "Vui lòng nhập ngày.",
	dateISO: "Vui lòng nhập ngày (ISO).",
	number: "Vui lòng nhập số.",
	digits: "Vui lòng nhập chữ số.",
	creditcard: "Vui lòng nhập số thẻ tín dụng.",
	equalTo: "Vui lòng nhập thêm lần nữa.",
	extension: "Phần mở rộng không đúng.",
	maxlength: $.validator.format("Hãy nhập từ {0} kí tự trở xuống."),
	minlength: $.validator.format("Hãy nhập từ {0} kí tự trở lên."),
	rangelength: $.validator.format("Hãy nhập từ {0} đến {1} kí tự."),
	range: $.validator.format("Hãy nhập từ {0} đến {1}."),
	max: $.validator.format("Hãy nhập từ {0} trở xuống."),
	min: $.validator.format("Hãy nhập từ {1} trở lên.")
});
