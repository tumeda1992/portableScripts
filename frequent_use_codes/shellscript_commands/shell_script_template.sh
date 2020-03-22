# for文
for i in $(seq 10)
do
echo "test"
done

## ワンライナー
for i in $(seq 10);do echo "test"; done



# if文
if [ 1 = 2 ]; then echo "true"; else echo "false";  fi;

## empty?系 -eは存在する
if [ -e /opt ]; then echo "true"; else echo "false";  fi;

# sed
