import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:ssk_tools/core/zlib_base64.dart';

void main() {
  testHelloWorld();
  testLongText();
  testLongJsonText();
}

void testHelloWorld() {
  final input = 'hello world';
  final output = 'eJzLSM3JyVcozy/KSQEAGgsEXQ==';

  test('compress hello world', () async {
    final compressed = await ZlibBase64().compress(input);
    expect(compressed, output);

    expect(input.length, 11);
    expect(compressed.length, 28);
  });

  test('decompress hello world', () async {
    final decompressed = await ZlibBase64().decompress(output);
    expect(decompressed, input);
  });
}

void testLongText() {
  final input = '''
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    ''';
  final output =
      '''eJw1kEsOkzEMhPecYg5QcQrYsUMcwCTTYimxU8euenwU/rKzYuebBwD88OCErl0T3YcHtiZkMm9obpstmRWQrkt3U3uAQ/PrFwD4yY7uoNae3pGcywNqTbv2skQlhvz2IJgXnpjyMIEMfZZcmF8Jmk5Ix9QzvGgq84Zn6Yb5zqgOvhlNU1LdUGPIbH7Rz5FuPWr/sLrANyhoPqd3v4I8Sz62vx2sVBIaFfzkVkNwBf/QOkPzPLx81EpJ4nVSg3sTTcf43xbBwr0eKgk7prAkVLLikvr+blzJOrVawlsTNkm0Wtolzy83rHDttLxhn9bU0GosOfnh97s2FXRuxtlOH8eKnKK0g/vTcc1L8i+pD6ed''';

  test('compress long text', () async {
    final compressed = await ZlibBase64().compress(input);
    expect(compressed, output);

    expect(input.length, 470);
    expect(compressed.length, 364);
  });

  test('decompress long text', () async {
    final decompressed = await ZlibBase64().decompress(output);
    expect(decompressed, input);
  });
}

void testLongJsonText() {
  // json text from https://developers.google.com/actions-center/verticals/things-to-do/reference/feed-spec/sample
  final input = '''
  {
    "feed_metadata": {
        "shard_id": 0,
        "total_shards_count": 1,
        "processing_instruction": "PROCESS_AS_SNAPSHOT",
        "nonce": 202113041501
    },
    "products": [
        {
            "id": "product-1",
            "title": {
                "localized_texts": [
                    {
                        "language_code": "en",
                        "text": "Dans bike tour"
                    },
                    {
                        "language_code": "es",
                        "text": "Tour en bicicleta por Dans"
                    },
                    {
                        "language_code": "zh-HK",
                        "text": "丹斯自行車之旅"
                    }
                ]
            },
            "description": {
                "localized_texts": [
                    {
                        "language_code": "en",
                        "text": "<p>See Sydney from a different perspective on a guided bike tour. Our experienced guides will take you on a scenic ride around the city...<p>"
                    },
                    {
                        "language_code": "es",
                        "text": "<p>Vea Sydney desde una perspectiva diferente en una visita guiada en bicicleta. Nuestros guías experimentados lo llevarán en un paseo panorámico por la ciudad....</p>"
                    },
                    {
                        "language_code": "zh-HK",
                        "text": "<p>一個非常有趣的自行車之旅.</p>"
                    }
                ]
            },
            "rating": {
                "average_value": 4.6,
                "rating_count": 192
            },
            "product_features": [
                {
                    "feature_type": "TEXT_FEATURE_INCLUSION",
                    "value": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "Bike rental including helmet."
                            },
                            {
                                "language_code": "es",
                                "text": "Alquiler de bicicletas con casco incluido."
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "自行车出租，包括头盔.</p>"
                            }
                        ]
                    }
                },
                {
                    "feature_type": "TEXT_FEATURE_INCLUSION",
                    "value": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "Bottled water."
                            },
                            {
                                "language_code": "es",
                                "text": "Agua embotellada."
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "瓶装水."
                            }
                        ]
                    }
                },
                {
                    "feature_type": "TEXT_FEATURE_HIGHLIGHT",
                    "value": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "See the Sydney Opera House and the Harbour Bridge up close."
                            },
                            {
                                "language_code": "es",
                                "text": "Vea de cerca la Ópera de Sídney y el puente del puerto."
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "近距离观赏悉尼歌剧院和海港大桥."
                            }
                        ]
                    }
                },
                {
                    "feature_type": "TEXT_FEATURE_MUST_KNOW",
                    "value": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "This tour is suitable for children aged 10 and up."
                            },
                            {
                                "language_code": "es",
                                "text": "Este tour es adecuado para niños de 10 años en adelante."
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "此行程适合 10 岁及以上儿童.</p>"
                            }
                        ]
                    }
                }
            ],
            "options": [
                {
                    "id": "option-1",
                    "title": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "Sunset tour"
                            },
                            {
                                "language_code": "es",
                                "text": "Tour al atardecer"
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "日落之旅"
                            }
                        ]
                    },
                    "landing_page": {
                        "url": "https://www.danstour.com/bike-tours/?product-id={product_id}&option_id={option_id}&source={src}&language={lang}&currency={currency}"
                    },
                    "landing_page_list_view": {
                        "url": "https://www.danstour.com/bike-tours/?source={src}&language={lang}&currency={currency}"
                    },
                    "duration_sec": 10800,
                    "cancellation_policy": {
                        "refund_conditions": [
                            {
                                "min_duration_before_start_time_sec": 86400,
                                "refund_percent": 100
                            }
                        ]
                    },
                    "option_categories": [
                        {
                            "label": "sports"
                        },
                        {
                            "label": "bike-tours"
                        }
                    ],
                    "related_locations": [
                        {
                            "location": {
                                "location": {
                                    "place_id": "ChIJ3S-JXmauEmsRUcIaWtf4MzE"
                                }
                            },
                            "relation_type": "RELATION_TYPE_RELATED_NO_ADMISSION"
                        },
                        {
                            "location": {
                                "location": {
                                    "place_info": {
                                        "name": "Mutitjulu Waterhole",
                                        "coordinates": {
                                            "latitude": -25.35103192003537,
                                            "longitude": 131.03269662583725
                                        }
                                    }
                                }
                            },
                            "relation_type": "RELATION_TYPE_RELATED_NO_ADMISSION"
                        }
                    ],
                    "price_options": [
                        {
                            "id": "option-1-adult",
                            "title": "Adult (14+)",
                            "price": {
                                "currency_code": "EUR",
                                "units": 20
                            },
                            "fees_and_taxes": {
                                "per_ticket_fee": {
                                    "currency_code": "EUR",
                                    "units": 1
                                },
                                "per_ticket_tax": {
                                    "currency_code": "EUR",
                                    "units": 1
                                }
                            }
                        }
                    ]
                },
                {
                    "id": "option-2",
                    "title": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "Sunrise tour"
                            },
                            {
                                "language_code": "es",
                                "text": "Tour al amanecer"
                            },
                            {
                                "language_code": "zh-HK",
                                "text": "日出之旅"
                            }
                        ]
                    },
                    "landing_page": {
                        "url": "https://www.danstour.com/bike-tours/?product-id={product_id}&option_id={option_id}&source={src}&language={lang}&currency={currency}"
                    },
                    "landing_page_list_view": {
                        "url": "https://www.danstour.com/bike-tours/?source={src}&language={lang}&currency={currency}"
                    },
                    "duration_sec": 10800,
                    "cancellation_policy": {
                        "refund_conditions": [
                            {
                                "min_duration_before_start_time_sec": 86400,
                                "refund_percent": 100
                            }
                        ]
                    },
                    "option_categories": [
                        {
                            "label": "sports"
                        },
                        {
                            "label": "bike-tours"
                        }
                    ],
                    "related_locations": [
                        {
                            "location": {
                                "location": {
                                    "place_id": "ChIJ3S-JXmauEmsRUcIaWtf4MzE"
                                }
                            },
                            "relation_type": "RELATION_TYPE_RELATED_NO_ADMISSION"
                        }
                    ],
                    "price_options": [
                        {
                            "id": "option-2-adult",
                            "title": "Adult (14+)",
                            "price": {
                                "currency_code": "EUR",
                                "units": 20,
                                "nanos": 0
                            }
                        }
                    ],
                    "meeting_point": {
                        "location": {
                            "place_id": "ChIJ3S-JXmauEmsRUcIaWtf4MzE"
                        },
                        "description": {
                            "localized_texts": [
                                {
                                    "language_code": "en",
                                    "text": "Sunrise tour"
                                },
                                {
                                    "language_code": "es",
                                    "text": "Tour al amanecer"
                                },
                                {
                                    "language_code": "zh-HK",
                                    "text": "日出之旅"
                                }
                            ]
                        }
                    }
                }
            ],
            "related_media": [
                {
                    "url": "http://www.danstour.com/photo1.jpg",
                    "type": "MEDIA_TYPE_PHOTO"
                },
                {
                    "url": "http://www.danstour.com/photo2.jpg",
                    "type": "MEDIA_TYPE_PHOTO",
                    "attribution": {
                        "localized_texts": [
                            {
                                "language_code": "en",
                                "text": "Dans Photos"
                            }
                        ]
                    }
                }
            ],
            "operator": {
                "google_business_profile_name": {
                    "localized_texts": [
                        {
                            "language_code": "en",
                            "text": "Dans Bikes"
                        }
                    ]
                },
                "locations": [{
                    "location": { 
                        "place_info": {
                            "name": "Dans Bikes",
                            "phone_number": "+61298765432",
                            "website_url": "www.dansbikes.com",
                            "unstructured_address": "123 NY st, Paris, France"
                        }
                    }}]
            },
            "inventory_type": "INVENTORY_TYPE_DEFAULT",
            "confirmation_type": "CONFIRMATION_TYPE_INSTANT",
            "fulfillment_type": {
                "mobile": true,
                "print_at_home": false,
                "pickup": false
            }
        }
    ]
}''';
  final output =
      '''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''';

  test('compress long json text', () async {
    final compressed = await ZlibBase64().compress(input);
    expect(compressed, output);

    expect(input.length, 13903);
    expect(compressed.length, 2940);
  });

  test('decompress long json text', () async {
    final decompressed = await ZlibBase64().decompress(output);
    expect(decompressed, input);
  });
}
