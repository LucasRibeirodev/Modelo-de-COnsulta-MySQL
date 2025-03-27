SELECT
    a.instante,
    a.Chave3,
    a.GrupoPrincipal AS FILA,
    CONCAT(RTRIM(LTRIM(a.DDD)), RTRIM(LTRIM(a.Fone))) AS TEL,
    TIME_FORMAT(SEC_TO_TIME(a.tempoconversacao_ms / 1000), '%H:%i:%s') AS tempoconversacao,
    a.MotivoEncerramentoBilhete,
    a.operadora
FROM trct.totalinfo_2025_03 a
LEFT JOIN tabeladiscagem_trct d 
    ON a.Chave1 = d.documento 
    AND a.Chave1 = d.contrato
WHERE a.instante BETWEEN '2025-03-13 00:00:00' AND '2025-03-13 23:59:59'
AND a.GrupoPrincipal IN ('4522', '4527', '4543', '4549', '4709', '4710');
