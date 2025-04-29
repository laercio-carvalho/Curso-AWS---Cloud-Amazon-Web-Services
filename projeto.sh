#!/bin/bash
echo "Certificando que todas as pastas pedidas estarão apagadas antes dono script"
rm -Rf /adm/
rm -Rf /publica/
rm -Rf /Mariana/
rm -Rf /ven/

echo "Criando pastas do Sistema"
mkdir /publico /adm /ven /sec
echo "Criando Grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Passando pastas para os Grupos"
chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec
echo "Criando usuários em seus respectivos grupos"
useradd carlos -c "Carlos Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd maria -c "Maria Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd joao -c "João Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd debora -c "Debora Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd sebastiana -c "Sebastiana Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd roberto -c "Roberto Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd josefina -c "Jonsefina Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd amanda -c "Amanda Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd rogerio -c "Rogerio Silva" -s /usr/bin/fish -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
echo "Mudando as permissões dos 3 abaixo para permitir execussão/leitura/escrita para o dono e os grupos e o publico permissão total"
chmod 770 /ven/ /adm/ /sec
chmod 777 /publico
echo "Passando as pastas para seus respectivos grupos"
chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

echo "Projeto finalizado"
