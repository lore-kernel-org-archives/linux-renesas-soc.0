Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE5F3CA4A3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224643; cv=none; b=Wfo+FHdsp5cdAr7NF8NH01QmyFBwvvIDZRx7uD5/7IO8zYXACP17XJ/Is1yhmoI/kGo1mQ0c+FpeqUgtG/P5xnUETSZxtyWVw99W+nCPql62MYjVFhPLnCAuQvPCExnzuVKtzg+RtDO9RIArH2koXxcj7m8lYyIEdzlQT9ZfuM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224643; c=relaxed/simple;
	bh=LSrld5Agd/ciynuf9D4CLiDK+KowNdcf24U7fZm3QB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t46WyIAjz3SDDWZqnYTxsmaXxk7cOUh4qhryMBNX19wRHRGQ1ByM+8eJ9riOvC0jMDNZBw9BrhjYYsCfEpsJmakfUpgmE88AKwrlmzmWqBhhHQ+VsotqvzDuYr1CONAySdSMNvHd9SdWR4RCEd4jysY8+zM9veiopC7pajo0w/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+0tPp+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I72Mf0qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+0tPp+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I72Mf0qh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oEGn1403451
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 08:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=; b=i+0tPp+hTTOZjkK5
	MAEL+J/w4c/vFLYwXZ+MOQLBq6MqQ4Cqk16foWDHZXW5eUduVCUaeSBesLbtuz9K
	F3d7QyjD1q2yIh3qg3J4cLWN1xKWNwMAyoSFEdMuUZvOhzaVl1q6FsQBx2ANjLQn
	OcNIYhnBfUvS2lcGzYNTN7LmZ65IqgyKSRXbSp5HH3eE9+zCwBgB3C2PK/QWAd4U
	zmbcW0sxxd9/uCmIdcbAVgMxZhO7c/gUZTQQJyUMw4dQJEN/FwtZ0W+/Pn/ah71L
	pJSODgci1nVNEUDBycUbVO3VKppWzBxXkxaeZ7AjLTXMs1rI04KnmvNqZOS9/uln
	irh8BA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0mhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 08:10:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a2035a4so40672796d6.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792224640; x=1792829440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=;
        b=I72Mf0qhxOI6UlSPqs9AraVSzY+STJ2uq8ZA1/4ejxW4xDgJveyN+JWHnS28OtAkGi
         oY8tQ+ClzbJki6Z//sXUcCHk5IxvWQiCHVq9417FCGvopZdK9ipaA3+0Rb1F2jtLO63t
         5HplF5w/f1LjIUViSWK4nBYLtVV3sc1IabCl5DxDIpGGAsINM+hEohXH/Hj79Nq9tTAZ
         EBa/YVaMJ+BJLSYeh/P+kAKtk7hfaOd5vNOHj8rYRQZ744ecY7sLm5ndJHYekKd2lP7O
         7Hr/EJI8JAyQfzfrRSCKu03tllzSkUBRyjWNqKevoQSzWSn/sJebHoql62JIHMDYGPH4
         oVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224640; x=1792829440;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=;
        b=TVT0IZb4bEJVoDe20SDaUQnXrLUao9OxkWPPioh4ypd9cADwc1FPGPOj3J/whccPT/
         MNQwdZgRt4ytADAhlhzcZsUlf4wIaoQtU0KX6sysB1ETIZg2rcGdXri2eZxSqZGlxeAK
         wnjHVtOIpLTKf+8jm9WlQhIb0EhLVBucvgsmhpAx1smX2z84KyJEnlTR5PqHcIehoG07
         lAOpCYjM2a7hAr9FsLs2wRC/VE6QCxFG5kk2IP+6b5wQ+v6N9/Q5TdpB2becYr6WpkmJ
         kpTAQpUINPSckBmzgiSElAWApPEOli4Qa4KFBTWVDNAoE+nqrgGQmq0l9rp9ZRSs7Fis
         msTA==
X-Forwarded-Encrypted: i=1; AKwUvBwWSlqKCbniMqaIwBDV8OXAxRWB9xW5jEIVZUPMkW5P8TE1V0t5k8f6PUQKkVwdV/Vk9hGCT/WqvD4htnfNAdavUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvE7G5B631WKnVSdXKYes0Ch2trAuS9d/DDDVU8rCD1DqU7Ruo
	D1Zx98JMZVlaVEu0SMVzS5icSXRP9yJkEat+QogAMvTfiCkDyCJm5jk6uZJPt/362/y0Qn3i8ct
	KkMsSuCJ2qYezmCiqzXFwXGaDRhq9IVwB4k8oVNiDEmTS1JudH/QTR14kt9HOTp6f7pyCC2ytQg
	==
X-Gm-Gg: AYBFou1sTuyFN7FXrBp6OWBupYw8p1oUD8dqAS6l6BKl5ItvE6BaMZVJu/CGizCGmfL
	xMqQaiBPcHVzbJ0EcU/6jPsPdhoqSe2Wshl0xEoIxP48LicsoRmQY/dTrgQEWl8skPy0CZbCfZz
	fe6SUI35aRpTtaYCu+/BSqlXtUVMSUr2ZowJUEQn4stjCg1Hy3rvWRrLhjuqclagB/nGcQttmb+
	YtKCtYxUBJrhWYcIIJYwmm6xqsp0LEBUablKYqbL1uppw4i85zkvb1bOwZdKgo60sz1klbTEbTL
	n12muhYCbFaWsCZK+Ozou0roeVva2ry5DmI9Eek/I1PVRJeEaxSwJUdFb5ZeWRE783kq/2BCWca
	gH+nqtp99swt8QlgIY8tOWNqdpELvjKYABQ1Jmn48Ww6cp/6qlGH2s58p
X-Received: by 2002:a05:620a:4495:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f2e8128b2mr120961585a.36.1792224640042;
        Sat, 17 Oct 2026 01:10:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f2e8128b2mr120959085a.36.1792224639531;
        Sat, 17 Oct 2026 01:10:39 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm11128617f8f.5.2026.10.17.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 01:10:37 -0700 (PDT)
Message-ID: <c624d8d5-3362-458a-96db-0457b25cad53@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 10:10:35 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "magnus.damm" <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001075742.21961-1-biju.das.jz@bp.renesas.com>
 <20261001075742.21961-2-biju.das.jz@bp.renesas.com>
 <20261016-rebel-ostrich-from-vega-f759c8-mkl@pengutronix.de>
 <TY3PR01MB113465234171180FFB5F1B6FD869B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465234171180FFB5F1B6FD869B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfXzpNzOXy+xKS1
 xb2XxdHA+DbdaAwGdlJ3BABvtByiWxGqltcyyup4G/A8ai8d9q+15xzXuG3fD6f5jaFfNXxy26m
 jJeRBjCmwWs5en6r3qq8zQ6lXtCCsikYTG1p9CH7h9P7fWK6eSska39zIujAq8F6JWtSepkCNvF
 gp5SKMSzGX/NHoDDswGwvNCuQptPn4j4hVa1zqGILI+0qw6ZS3p9pzFUkJQmKAqr4Ho9LVj5KWA
 VV03W0AMjijNgIt2SulrrpBP7vqXzfkMYHGv9+PnDdr6wUBSob41clwTdXxESOsdYB4hSX19HEU
 hpxIB6Vex6zEW8vt+o26oouPJtwe1zMOTfos8Tdj7FjL+MErUl9IXljKf1cLFljlZ2Gj/HZcWtZ
 rBLLA+k2Rl3O2vRw1PpGgEfx0n4u/eyj+TwzT8ZR+PH0Iythl/Z53TUb2ANBNPauyLPMTrAX/FL
 IFwi3O/yvGQNm2w03xg==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad32d81 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OvmbqCCc-nj-YtGC7z8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: rsqkYUC-LPai6p1LFfq-Fy4GhUyXw8-9
X-Proofpoint-GUID: rsqkYUC-LPai6p1LFfq-Fy4GhUyXw8-9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfX/r1kpk8ESrIA
 BsYsomnEFgg1YAN4ZeggGTHSA1wvsB/eEBosCzAJXQqUHEB9tTvk1vlRIt032StGciGevHw7rEp
 ye1Bv0tdJ3VNZed0P+0X+9HwNzKJPgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170032

On 16/10/2026 16:12, Biju Das wrote:
>>
>>> @@ -294,6 +295,25 @@ allOf:
>>>        patternProperties:
>>>          "^channel[6-7]$": false
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: renesas,r9a08g046-canfd
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          minItems: 11
>>> +
>>> +        interrupt-names:
>>> +          minItems: 11
>>> +
>>> +        resets:
>>> +          minItems: 2
>>
>> Discovered by: sashiko-gemini · Missed by: opus-5-5, gpt-6-astra · Confirmed by: opus-5-5 Should this
>> block also cap interrupts and interrupt-names at 11?

Correct.

> 
> Krzysztof,
> 
> Do you agree with sashiko's comment? I dropped maxItems based on the review comment [1]

I asked to drop maxItems from resets. Why did you drop it from other
places? Comments from reviewers appear in specific places, not randomly.

What is the upper cap on interrupts?

Best regards,
Krzysztof
