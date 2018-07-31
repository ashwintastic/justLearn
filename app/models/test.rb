{
    "settings": {
        "analysis" : {
        "analyzer" : {
        "my_analyzer" : {
        "tokenizer" : "standard",
        "filter" : ["standard", "lowercase", "my_stemmer"]
    }
},
    "filter" : {
    "my_stemmer" : {
    "type" : "stemmer",
    "name" : "light_german"
}
}
}
}
}