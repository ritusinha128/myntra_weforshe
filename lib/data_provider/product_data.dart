import 'package:flutter_myntra_clone/data_provider/product_dto.dart';

class ProductData {
  static List<ProductDto> getProductsListData() {
    return [
      ProductDto('https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/7186140/2018/10/3/e74e1ad0-7e16-47f9-a6b7-74b3cde055d01538569313154-Anouk-Women-Fuchsia-Printed-Kurta-with-Trousers--Dupatta-869-1.jpg',
          'Anouk', 'Fuchsia Printed Kurta', '1159', '2899', '(60% OFF)'),
      ProductDto('https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11056154/2019/12/5/30b0017d-7e72-4d40-9633-ef78d01719741575541717470-AHIKA-Women-Black--Green-Printed-Straight-Kurta-990157554171-1.jpg',
          'Ahika', 'Printed Straight Kurta', '688', '1350', '(49% OFF)'),
      ProductDto('https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11066882/2020/1/13/7c708a55-fcee-45a4-901d-da0dffa5cb491578911582522-Popnetic-Women-Green--Golden-Printed-Straight-Kurta-71015789-1.jpg',
          'Popnetic', 'Golden Printed Straight Kurta', '489', '1399', '(65% OFF)'),
      ProductDto('https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13290258/2021/3/31/2a435336-39e8-475d-a7ca-9cba555a5ade1617193481375-Sangria-Women-Red--Off-White-Pure-Cotton-Printed-Kurta-with--1.jpg',
          'Sangria', 'Cotton Printed Kurta', '1469', '2069', '(30% OFF)'),
      ProductDto('https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2020/10/14/47816771-27ea-4eae-83c2-92f0bde8dca61602649914867-1.jpg',
          'Libas', 'Printed Kurta with Palazzos', '1349', '2999', '(55% OFF)'),

    ];
  }
}