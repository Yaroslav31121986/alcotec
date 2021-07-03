<!DOCTYPE html>
<html>
<head>
    <script src="{{asset('js/jquery-3.6.0.min.js')}}"></script>
</head>
<body>
<div class="flex-center position-ref full-height">
    <button id="products">Touch me</button>
</div>
<script>
    window.onload = function() {
        $('#products').on('click', function (e) {
            $.ajax({
                url: 'api/products/210',
                type: 'get',
                dataType: 'json',
                data: {
                    brand: 80,
                    availability: 3,
                    price: {
                        from: 500,
                        to: 10000000
                    },
                    // sorting: {
                    //     sortBy: 'price',
                    //     isDesc: false,
                    // }
                }
            });
        });
    };
</script>
</body>
</html>
