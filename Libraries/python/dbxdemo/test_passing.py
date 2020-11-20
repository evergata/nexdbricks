import pytest

from pyspark.sql import SparkSession
from functools import lru_cache

@lru_cache(maxsize=None)
def get_spark():
    return (SparkSession.builder
                .appName("dbxdemo")
                .getOrCreate())
from pyspark.sql import SparkSession
from functools import lru_cache
import pyspark.sql.functions as F

def with_status(df):
    return df.withColumn("status", F.lit("checked"))
  
@lru_cache(maxsize=None)
def get_spark():
    return (SparkSession.builder
                .appName("dbxdemo")
                .getOrCreate())


source_data = [
    ("paula", "white", "paula.white@example.com"),
    ("john", "baer", "john.baer@example.com")
]
source_df = get_spark().createDataFrame(
    source_data,
    ["first_name", "last_name", "email"]
)

actual_df = with_status(source_df)


expected_data = [
        ("paula", "white", "paula.white@example.com", "checked"),
        ("john", "baer", "john.baer@example.com", "checked")
    ]
expected_df = get_spark().createDataFrame(
    expected_data,
    ["first_name", "last_name", "email", "status"]
)
assert(expected_df.collect() == actual_df.collect())