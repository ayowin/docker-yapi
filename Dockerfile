FROM mongo

RUN apt-get update
RUN apt-get install -y python

# nodejs enviroment
COPY ./node-v12.22.12-linux-x64.tar /usr/local/
RUN tar xvf /usr/local/node-v12.22.12-linux-x64.tar -C /usr/local/
ENV PATH /usr/local/node-v12.22.12-linux-x64/bin:$PATH

# install
RUN npm install --unsafe-perm=true --allow-root -g yapi-cli --registry https://registry.npm.taobao.org

# deploy yapi by following commands 
# 1. initialize:
#       yapi server
# 2. serve:
#       node /my-yapi/vendors/server/app.js
# 3. access http://{ip}:3000
#       default admin account:
#           username: admin@admin.com
#           password: ymfe.org
# 4. keep serving and detach current docker process
#       press:
#           <1> ctrl+p
#           <2> ctrl+q