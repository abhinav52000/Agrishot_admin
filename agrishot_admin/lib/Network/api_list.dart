String baseUrl = 'https://api.dev.agrishots.in/';

String loginPath = 'admin/auth/login';

String articlePath(int pageNumber) =>
    'admin/articles?page=$pageNumber&perPage=20';
