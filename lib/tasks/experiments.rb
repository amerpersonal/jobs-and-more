require 'json'

number = 284

all_divisors = (1..number/2).select { |n| number % n == 0 }

all_divisors.each { |d| puts d }

# puts all_divisors.sum

#How many ways to seperate a string "abaccadd" in to 3 strings so that each of them contain same amount of "a"s

#str = "abaccaddabaccadd"

# aba, ccadda, baccadd
# abac cadda baccadd
# abacc adda baccadd
# aba

str = "abaccadd"
# a bac cadd
# ab acc cadd
# a ba cccadd
# a bac cadd
# a bacc add
# ab a ccadd
# ab ac cadd
# ab acc add
# ab
#
# number_of_substrings = 3

# parts_after_a = str.split("a").filter { |i| !i.empty? }
# number_of_as = parts_after_a.length

# puts "parts_after_a #{parts_after_a}"
#
# number_of_a_occurence_per_substring = number_of_as / number_of_substrings
#
# combinations = []
#
# def all_combinations_for_single_letter(letter, after)
#   (0..after.length).map { |i| letter.to_s + after[0, i] }
# end
#
# puts "combs: #{all_combinations_for_single_letter('a', "cc")}"
#
# a_index = 0
#
# combinations = []
#
# parts_after_a.each_with_index do |after, index|
#   combinations.push(all_combinations_for_single_letter('a', after))
# end
#
# puts combinations.inspect
# str.each_char_with_index do |c|
#
# end


res = JSON.parse(%q(
{
    "took": 29,
    "timed_out": false,
    "_shards": {
        "total": 1,
        "successful": 1,
        "skipped": 0,
        "failed": 0
    },
    "hits": {
        "total": {
            "value": 15,
            "relation": "eq"
        },
        "max_score": 1.0,
        "hits": [
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "82658635",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "82658635",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🤑",
                                        "creation_date": "2021-05-25T20:31:26.411Z"
                                    },
                                    "sort": [
                                        36852
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "82729786",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "82729786",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🥵🤝🔥",
                                        "creation_date": "2021-05-26T12:07:48.912Z"
                                    },
                                    "sort": [
                                        36918
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "84197199",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "84197199",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🤑🚀",
                                        "creation_date": "2021-06-23T13:38:53.763Z"
                                    },
                                    "sort": [
                                        39268
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "79899939",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "79899939",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "bruder das geld arbeitet krank🧠🧠🧠📈📈💎",
                                        "creation_date": "2021-07-06T14:07:24.478Z"
                                    },
                                    "sort": [
                                        40119
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "77464560",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "77464560",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🚀",
                                        "creation_date": "2021-04-23T14:46:14.704Z"
                                    },
                                    "sort": [
                                        33572
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "84041380",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "84041380",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🚀🚀",
                                        "creation_date": "2021-06-18T12:59:28.030Z"
                                    },
                                    "sort": [
                                        38863
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "82841246",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "82841246",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🔥👏🏻",
                                        "creation_date": "2021-06-18T12:59:43.383Z"
                                    },
                                    "sort": [
                                        38864
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "82827686",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "82827686",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 1
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "😂😂😂😂",
                                        "creation_date": "2021-05-27T15:05:26.392Z"
                                    },
                                    "sort": [
                                        37016
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81853660",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81853660",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "👏🏻👏🏻",
                                        "creation_date": "2021-05-19T13:50:04.308Z"
                                    },
                                    "sort": [
                                        36408
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81277271",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81277271",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "Yallllahhhhhhhh🤩🤩🤩",
                                        "creation_date": "2021-05-07T07:03:43.382Z"
                                    },
                                    "sort": [
                                        34780
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81277275",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81277275",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🤝🔥🔥",
                                        "creation_date": "2021-05-07T07:04:02.246Z"
                                    },
                                    "sort": [
                                        34781
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81232693",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81232693",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "💪🏻🔥",
                                        "creation_date": "2021-05-06T18:00:47.928Z"
                                    },
                                    "sort": [
                                        34729
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81004067",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81004067",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🤩🤝",
                                        "creation_date": "2021-05-05T07:25:52.011Z"
                                    },
                                    "sort": [
                                        34517
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "80364253",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "80364253",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "🚀🚀🔥",
                                        "creation_date": "2021-04-28T07:21:57.932Z"
                                    },
                                    "sort": [
                                        33881
                                    ]
                                }
                            ]
                        }
                    }
                }
            },
            {
                "_index": "activity_feed_1_6_2021",
                "_type": "_doc",
                "_id": "81609277",
                "_score": 1.0,
                "_source": {},
                "inner_hits": {
                    "user_comments": {
                        "hits": {
                            "total": {
                                "value": 1,
                                "relation": "eq"
                            },
                            "max_score": null,
                            "hits": [
                                {
                                    "_index": "activity_feed_1_6_2021",
                                    "_type": "_doc",
                                    "_id": "81609277",
                                    "_nested": {
                                        "field": "user_comments",
                                        "offset": 0
                                    },
                                    "_score": null,
                                    "_source": {
                                        "medias": {
                                            "images": [],
                                            "urls": [],
                                            "videos": []
                                        },
                                        "tagged_users": [],
                                        "tagged_symbols": [],
                                        "comment": "Staaark!!!🧠😀🧠",
                                        "creation_date": "2021-05-11T14:07:06.736Z"
                                    },
                                    "sort": [
                                        35311
                                    ]
                                }
                            ]
                        }
                    }
                }
            }
        ]
    }
}
))


comments = res["hits"]["hits"].flat_map do |hit|
  hit["inner_hits"]["user_comments"]["hits"]["hits"].map do |commentHit|
    commentHit["_source"]
  end
end

puts "comments : #{comments.inspect}"


puts "evo #{129652941 - 84921995 + 500000}"