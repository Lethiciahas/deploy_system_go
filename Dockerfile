FROM golang:1.18 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=O GOOS=linux GOARCH=amd6 go build -o server

#copiando o binário anterior para imagem vazia, finalidade diminuir tamanho.
FROM stratch
COPY --from=builder /app/server /server
ENTRYPOINT [ "/server" ]