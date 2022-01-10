class ServerConfig{
  static const DomainNameServer = 'http://10.0.2.2:8000';//http://192.168.2.153:8000';//

  // auth
static const register = '/api/register';
static const login = '/api/login';
static const checkValidity='/api/auth/check_validity';
static const allProduct = '/api/products/index';
  static const addItem = '/api/products';
  static const editItem = '/api/products';
  static const productDetails='/api/products';
  static const userProfile = '/api/products';
  static const like = '/api/products/like';
  static const search = '/api/products/search';
  static const sort = '/api/products/sort';
  static const category = '/api/products/search/category';
  static const deleteItem = '/api/products';
  static const comment = '/api/products/comment';
}