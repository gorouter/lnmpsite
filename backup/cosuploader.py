#!/usr/bin/env python
# -*- coding=utf-8

import os,sys
from qcloud_cos import CosConfig
from qcloud_cos import CosS3Client
from qcloud_cos import CosServiceError
from qcloud_cos import CosClientError

# 腾讯云COSV5Python SDK, 目前可以支持Python2.6与Python2.7

# pip安装指南:pip install -U cos-python-sdk-v5

# cos最新可用地域,参照https://www.qcloud.com/document/product/436/6224

# 设置用户属性, 包括secret_id, secret_key, region
# appid已在配置中移除,请在参数Bucket中带上appid。Bucket由bucketname-appid组成

#secret_id = 'AKID15IsskiBQACGbAo6WhgcQbVls7HmuG00'     # 替换为用户的secret_id
#secret_key = 'csivKvxxrMvSvQpMWHuIz12pThQQlWRW'     # 替换为用户的secret_key
#region = 'ap-beijing-1'    # 替换为用户的region

secret_id = sys.argv[2] #('secret_id')
secret_key = sys.argv[3] #('secret_key')
region = sys.argv[4] #('region')
bucketname = sys.argv[5] #('bucketname')
file_name = sys.argv[1]

if os.path.exists(file_name):
  print(file_name)
else:
  print(file_name)
  exit()

token = ''                 # 使用临时秘钥需要传入Token，默认为空,可不填
config = CosConfig(Region=region, Secret_id=secret_id, Secret_key=secret_key, Token=token)  # 获取配置对象
client = CosS3Client(config)

#先删除
try:
  response = client.delete_object(
      Bucket=bucketname,
      Key=file_name
  )
except:
  print("COS中不存在此文件")

#文件上传 
try:
  with open(file_name, 'rb') as fp:
      response = client.put_object(
          Bucket=bucketname,  # Bucket由bucketname-appid组成
          Body=fp,
          Key=file_name,
          StorageClass='STANDARD',
          CacheControl='no-cache',
          ContentDisposition=file_name
      )
      print response['ETag']
      os.remove(file_name)
except CosClientError as e:
  print("上传超时")
except CosServiceError as e:
  print(e.get_error_msg())
except:
  print("上传到COS失败")
