# 1. Alap image: hivatalos Node.js LTS
FROM node:18

# 2. Munkakönyvtár a konténerben
WORKDIR /app

# 3. package.json és package-lock.json másolása
COPY package*.json ./

# 4. Függőségek telepítése
RUN npm install

# 5. Alkalmazás forráskód másolása
COPY . .

# 6. Port megnyitása (Express 8080-ra fut)
EXPOSE 8080

# 7. Indítóparancs
CMD ["npm", "start"]
