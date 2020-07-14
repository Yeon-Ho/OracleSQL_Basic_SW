-- CLOB
CREATE TABLE type_test_07(
    data CLOB
);

INSERT INTO type_test_07
VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui enim, finibus dapibus sem ut, gravida malesuada dolor. Maecenas faucibus fermentum pharetra. In hac habitasse platea dictumst. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque eu finibus ipsum, vitae interdum enim. Morbi aliquet aliquet hendrerit. Duis non dapibus mauris. Suspendisse dapibus sed sem nec maximus. Aenean a lobortis magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Ut fringilla risus nibh, eu accumsan sem ornare ac. Nulla justo metus, dictum vitae lacus eu, viverra molestie lorem. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam vel pulvinar odio. Vivamus at arcu porta, malesuada eros ac, aliquam augue. Sed lacinia blandit purus non gravida. Morbi id dictum nisl. Proin bibendum euismod lectus.

Vestibulum malesuada sagittis congue. Etiam vitae urna a turpis finibus molestie in ac dolor. Phasellus et finibus nunc. Etiam mollis aliquet justo suscipit varius. Sed id suscipit nulla. Cras sed condimentum nibh, quis convallis massa. Ut et elit pellentesque, dignissim enim vitae, maximus orci. Vestibulum quis sodales nunc. Aliquam porttitor a tellus id viverra. Proin facilisis rutrum orci, vel bibendum urna blandit sit amet.

Aenean et felis vitae urna aliquet eleifend eget molestie arcu. Phasellus id nisi convallis, faucibus ligula ac, porta odio. Sed vel nisi a risus fringilla rutrum. Praesent non nulla enim. Donec ultricies ante in interdum congue. Integer pharetra ac quam eget tempor. Etiam eget ligula sed eros egestas laoreet sed eget urna.

Fusce ut lorem est. Aliquam sit amet neque eu elit laoreet porttitor sodales non tortor. Nullam ac velit sagittis, condimentum lacus sit amet, ornare ligula. Sed sit amet dictum nisl. Aliquam malesuada mauris lacus, id mollis erat tempus ac. Suspendisse potenti. Morbi vehicula, odio eget scelerisque euismod, felis ex pulvinar urna, ut facilisis justo ligula vitae enim. Etiam hendrerit scelerisque orci, non scelerisque magna interdum sit amet. Vestibulum egestas at nibh et fringilla. Praesent fringilla ultricies risus et cursus. Vivamus at viverra mi. Nunc egestas ultricies leo non pulvinar. Quisque ornare ipsum scelerisque luctus maximus. In ut lacinia mauris. Etiam consequat orci id diam varius ultricies.');

INSERT INTO type_test_07
VALUES ('얼음이 원대하고, 꾸며 것이다. 청춘의 인간은 따뜻한 역사를 크고 이것이다. 있는 속잎나고, 예가 두기 인생을 목숨이 찬미를 갑 것이다. 주는 위하여, 커다란 품으며, 많이 있다. 봄날의 같지 가슴이 용기가 있는 살 물방아 끝에 기쁘며, 보라. 끓는 열락의 가지에 위하여 우는 더운지라 심장은 듣는다. 맺어, 별과 없으면 청춘의 그들은 속에서 심장은 피에 방황하여도, 그리하였는가? 현저하게 피가 이는 아니더면, 그러므로 있으며, 희망의 생생하며, 사는가 것이다. 행복스럽고 찾아다녀도, 길을 우리의 얼음과 없으면 사막이다. 날카로우나 뼈 풀이 관현악이며, 그들의 힘있다.

소리다.이것은 타오르고 생의 것이다. 것은 않는 천고에 그들에게 인생에 싶이 청춘 만천하의 운다. 피고 그들은 우리 운다. 천자만홍이 길지 그들의 더운지라 무엇이 싶이 이것이야말로 것이다. 무엇을 것은 길지 찬미를 가지에 모래뿐일 품에 어디 풀이 보라. 청춘의 얼음 가지에 과실이 같은 말이다. 길을 꽃이 얼음에 물방아 아니한 그들의 가지에 같은 것이다. 대한 어디 대고, 속에 석가는 맺어, 이것은 것이다. 우리의 이것은 구하기 반짝이는 밥을 돋고, 생명을 때문이다. 이상 않는 얼음 크고 목숨을 대고, 살 얼마나 눈에 이것이다. 같이, 불어 굳세게 속잎나고, 고동을 우리의 행복스럽고 그러므로 이것이다.

피는 되는 구하지 얼음 그들은 속에서 끓는다. 황금시대의 원대하고, 돋고, 못할 청춘의 힘차게 쓸쓸하랴? 듣기만 든 할지니, 것은 눈이 튼튼하며, 것이다. 봄날의 뭇 길지 것은 인생에 이것이다. 할지라도 없는 어디 있는 노래하며 피가 불어 넣는 얼마나 교향악이다. 얼마나 끝에 지혜는 따뜻한 없으면 인간에 피부가 듣는다. 힘차게 때까지 타오르고 하는 많이 밝은 이상을 목숨이 그들은 말이다. 유소년에게서 반짝이는 우리의 인생을 것은 것이다. 이상이 거친 영락과 같은 사람은 소금이라 봄바람이다. 속에서 그러므로 쓸쓸한 봄바람을 피다.');

SELECT * FROM type_test_07;

-- CLOB 데이터 전체 조회
SELECT DBMS_LOB.SUBSTR( data, length(data) , 1 )
FROM type_test_07;


CREATE TABLE type_test_08(
    data VARCHAR(3) --이거 대신 VARCHAR2(n) 이거 사용하자
);

SELECT * FROM type_test_08;