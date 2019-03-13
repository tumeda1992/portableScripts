# -*- coding: utf-8 -*-
import sys
from getpass import getpass
from abc import ABCMeta, abstractmethod
from mysql import connector
import psycopg2

"""
DBのテーブル一覧を出力します
"""

# TODO DB情報を入力してください
DB_SELECT_MYSQL = "DB_KEY_MYSQL"
DB_SELECT_POSTGRESQL = "DB_KEY_POSTGRESQL"
DB_SELECT = DB_SELECT_MYSQL

DB_PORT = ''
DB_HOST = ''
DB_NAME = ''
DB_USER = ''


class AbsDbConnector(metaclass=ABCMeta):
    def __init__(self, host, port, dbname, user, password):
        self.host = host
        self.port = port
        self.password = password
        self.dbname = dbname
        self.user = user
        self.cur = self.get_cur()
    
    @abstractmethod
    def get_cur(self):
        pass
    
    def __enter__(self):
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        self.cur.close()
        self.conn.close
    
    def exec_sql(self, stmt):
        try:
            self.cur.execute(stmt)
            return self.cur.fetchall()
        except:
            print("SQLの実行に失敗しました")
            sys.exit()


class Mysqler(AbsDbConnector):
    def get_cur(self):
        self.conn = connector.connect(
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            database=self.dbname,
        )
        return self.conn.cursor(dictionary=True)


class Pgsqler(AbsDbConnector):
    def get_cur(self):
        self.conn = psycopg2.connect(
            "host={} port={} dbname={} user='{}' password='{}'".format(
                self.host, self.port, self.dbname, self.user, self.password)
        )
        return self.conn.cursor()
    
def onekeydict2val(target_dict:dict):
    ret_val_list = []
    for key, val in target_dict.items():
        ret_val_list.append(val)
    if len(ret_val_list) == 1:
        return ret_val_list[0]
    else:
        return ', '.join([str(elem) for elem in ret_val_list])


DB_DICT_PARAM_NAME = 'name'
DB_DICT_PARAM_CONNECTOR = 'connector'
DB_DICT_PARAM_GET_TABLE_SQL = 'DB_DICT_PARAM_GET_TABLE_SQL'
DB_DICT = {
    DB_SELECT_MYSQL: {
        DB_DICT_PARAM_NAME: 'MySQL',
        DB_DICT_PARAM_CONNECTOR: Mysqler,
        DB_DICT_PARAM_GET_TABLE_SQL: 'show tables',
    },
    DB_SELECT_POSTGRESQL: {
        DB_DICT_PARAM_NAME: 'PostgreSQL',
        DB_DICT_PARAM_CONNECTOR: Pgsqler,
        DB_DICT_PARAM_GET_TABLE_SQL: 'SELECT relname as table_name from pg_stat_user_tables',
    },
}
DB_DICT_SELECTED = DB_DICT[DB_SELECT]

if __name__ == '__main__':
    
    ok_input_key_list = ["yes", "y"]
    print("""
    接続するDBは以下でよろしいでしょうか?
    
    使用するDB：{}
    接続先　　：{}:{}
    DB名　　　：{}
    ユーザ名　：{}
    パスワード：後で入力
    """.format(DB_DICT_SELECTED[DB_DICT_PARAM_NAME], DB_HOST, DB_PORT, DB_NAME, DB_USER))
    confirm_str_dbinfo: str = input('(y/n): ')
    confirm_str_dbinfo = confirm_str_dbinfo.lower()
    
    if confirm_str_dbinfo not in ok_input_key_list:
        print('DB情報を修正して、再度実行してください')
        sys.exit()
    
    print('DBのパスワードを入力してください')
    DB_PASS = getpass()
    
    db_connector: AbsDbConnector = DB_DICT_SELECTED[DB_DICT_PARAM_CONNECTOR](DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASS)
    result_table_name_list = db_connector.exec_sql(DB_DICT_SELECTED[DB_DICT_PARAM_GET_TABLE_SQL])
    table_list_str = '\n'.join([onekeydict2val(result) for result in result_table_name_list])
    
    print('\n')
    print('--------テーブル一覧--------')
    print('\n')
    print(table_list_str)
