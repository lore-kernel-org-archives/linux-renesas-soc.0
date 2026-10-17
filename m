Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB613E172F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258426; cv=none; b=kWpiutr7WUGmLp/f3U+os4m1QVaxDMRhL4zf7NsoyToxNus2nJzCS52c/1lVU5zuUh2QPP5jCzjwZSS2eAAToqiz1dQtKZ9drn4wDCu4TD8v4BBfjDd2BzgyN613LxOw6ueUQXMqfekVtnSTihu9P54BILe/JMJHtp9qYMozIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258426; c=relaxed/simple;
	bh=AzvAhmSSwt3ehE286M+rxPYKVbCzR2/9KQrWEdCTQxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZaKGMPciLzn9ehly8cygYpsEc/Rs7QKjjws0zMRZ85KHeRZzD5yJ3+xrLPdIwOftmTELpliN4F9VJRi3ysHwZSjKZkSj3tc95viNUV9TyfCkbIDOT4tq+AUiQZjy6AkiGWT9PulO5XuYGCKJcqajtusIkPX5C+VAXIVSvQs2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n32Fi0Jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifAE2nJ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n32Fi0Jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifAE2nJ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAmkB1180752
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 17:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpJOJuc/tTTz9czHzjb55bdDw4qIN7/zROpMVClxjfE=; b=n32Fi0Jm1JgAlJ0O
	G2mr+tZrn8V6QqPEJFTJTtbZbuY4OUXXU6MlmrYUkfkyOvm7NGT1keWCmnFMq3+o
	8Q3ZUu6LZYb5CczmkhOXkIh4Cotktztbl6F4j8nqUjyx7Qgb00li9UNe+mFcV8lF
	mF0aoQn00nAC/KAoJJCTBTUo3WHszMtGAC6npC1VJ7e6Se8oEhi4FFg9adkKsd9L
	rhggtu6S7vejoTSm8K6+/N2q19dXSOsfThf9wEsL2ufIjQdVo4O9wlwZGDiu60fS
	3mYkrUD6XK1w5qUrdIpauUT635CXLcdtXb7kVDHIWI2n6jnhGLYhgV5VmK4fiVH2
	cUTaUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bghh9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 17:33:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bebff9fcaso8755696d6.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792258423; x=1792863223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpJOJuc/tTTz9czHzjb55bdDw4qIN7/zROpMVClxjfE=;
        b=ifAE2nJ0ndLbuuSQ1vTwo8mZZxuCrj6Bei2BLYu1BXu5icVIS2zEL26MEhBhnAdB1y
         Xsk++N1qg95ZgVbA/NanSL3tE3Ht1Bqs8dKWRl9W0dKCSjC6dyswkJnT5mCPhibdrmFj
         CSRnC46fmFcSt8mIEPNBD0LUEPIPMK6YEM9tmE971T8FUF13ptc4HxjxEqmMRPJBWNwS
         Y7Yg7hvioStYhcHk0XB4PdGeqK/xIFuZ1psSQiXX3MnQ/XfQqnU9j9+F8zddG1/4+IHy
         kdQEY1tZrjWxYpLqWrVEmvwJx11FIKTEjHWrInRURx62OJpGkiVl8LYYxOcKSCnquAVr
         rpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258423; x=1792863223;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpJOJuc/tTTz9czHzjb55bdDw4qIN7/zROpMVClxjfE=;
        b=YrzM9XDrVw0DtFs70CTyAGZBS0Z3fj4UmJwHegDvq6ZP9WbA+zxEFvF0g/P6bSFY0Z
         jP7L9IVJuyY7zetnrlxpOFNLDz7k/A1a5RaD3ZzMPZRm+2hNhehabl+abOVTMN2mPANF
         k5+XiIDm5Q6i4H6LBAXG4cvFdqP1Va26QOMJ5jgn/Ynqu6xfUWQR+ufDjpumVmSYNs7O
         FhKNLiJLyQqXiQyGT2wZq6fkTxdmTavsysex7hP/g05LGSLtP/RkyMrWRPYLz8zWk1Ug
         Sx5u25VQGefLEV1r0Tu5yu0qMlhrcPVumfhJd3IwmjyTG8gq9KjBlk15bj/bwfvzSEJA
         yBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx//l1/gyDVz4q1gl8zYxN3aRytx5idPkkm1e3pOrd9TbxJ+0qNvPhwB2Cvt/fWkQ2SfvRHgZhBAXO58EqK8czeEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI67GUiw8+vtr4SaMLJq1lgLnaEOFP5K6ooWzRQ8Ldklb75btYY
	dneBQV0YI/X6INCyYMcVcqumrsEIOYOVZOnPHCEYdyMCYQzSeN+cnF4sacCfPoYgV86QbHPSirD
	rTUtoIxhwcJ9RwjSQiSFZO71PKMWpORLKSkG5tw0QfqJp4sEIi0AMrCu+qNZp70U8MIJ7ywYYnA
	==
X-Gm-Gg: AYBFou2+d2bcd7ZbjM9zQBF2UL7YcNBbktHnnlGUuNMFt76muzM+pvEXTQUeqdXHmHM
	GxywpP50Shodi63rgdR4iKC+O18KfWfYtqpztsL4OUpbPcWOrDWZuqlinKyHXmruDoN5eWy6fos
	IcBqKSWtKjTycz/p4W5G+482glU3gLiugedRoEQem9LSTUNJi5LYBvDjKU4Gk6gj2IKz1yJzv3E
	HjroT3KjGnzdEB/DEpGr+DbXqJ6n+yhb+EiwzsK9lMFYDlncn6l3dbYNBF5NCr9Z9gQwbaj+p9o
	nSKTDeMCdoJQvXi21L+pnYLl3UDC+QLlhbFhUNUvZdxbrBvW9K5EwJr5WpAbDfXYcaTVPLeCg/N
	N3DVLEzCAuQ/Vyu8kVnjnj7TgYM1dzSHBJnzVVP/2xMFmM6lWcm/GcPcT
X-Received: by 2002:a05:620a:298b:b0:936:df48:d507 with SMTP id af79cd13be357-93f29cc9239mr548535985a.18.1792258423388;
        Sat, 17 Oct 2026 10:33:43 -0700 (PDT)
X-Received: by 2002:a05:620a:298b:b0:936:df48:d507 with SMTP id af79cd13be357-93f29cc9239mr548532385a.18.1792258422936;
        Sat, 17 Oct 2026 10:33:42 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm125453235e9.9.2026.10.17.10.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:33:41 -0700 (PDT)
Message-ID: <ce03d3ce-da47-4435-8c98-d86b2816c5c0@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 19:33:37 +0200
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
 <c624d8d5-3362-458a-96db-0457b25cad53@oss.qualcomm.com>
 <TY3PR01MB11346ACB35A041309BCFA744F869A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346ACB35A041309BCFA744F869A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX2Cx3dq/5vslw
 ltCm9NyMlbtkKvTXLXSnMxnBLfPU/++Ym//MvM33fXCotKz6jwttMw/XEVovXfHp7XqZefZvJb3
 +CsX+mX0gvndtb4euyTjieyb2yPPaLg=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad3b177 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ybr_MWcd8vCGkqVRH1UA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfXzUFqQJqLjctz
 ApQ94f4fkENyKV0YIBFvA3at2/HUUtAY7ASQUU5frdo+HEiviIyuUp+gG9bPcqvciqhVTjDb1Ff
 anN+/etCLkQgx0/xM5ZH9dQCNLwSPT7NBNmO7WPYyrrbS6dPVqvL8di2uh5qCoWn+IiLklwf1SP
 Gf8gqv3lSG0ax4F60uar6+jBDyTaNnNWvXsdxEI6WVqO4KADUOBUQaRuZRX3AahYumQ7wvsXLh/
 DMmQPtMTo4bXAdsEVHhW6qQSzWWZf7y4H0ZwUWSRNDiADXJ9RA0gaX9s9jXs+AUVc7zBW7gf1NZ
 MpZCbpwKRPFQE5fy48z0JB4yTHPtgdJWq5ozE1+vBq+8UKBrNkm+zkt4PxoRqDBtbDNFPYbFJwr
 vwgluYxbnNGyFryOXcuO80IAWU8Riuv5rPd+qtTAp5UICZk7waL4Uvx+LgrwSN/i+tq7zL+5p/k
 O3nBjgy8K1v5Ovw1xFw==
X-Proofpoint-ORIG-GUID: v1fv0CaL6-5HF0tRw-ziuK0aIsLgBohm
X-Proofpoint-GUID: v1fv0CaL6-5HF0tRw-ziuK0aIsLgBohm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170069

On 17/10/2026 10:23, Biju Das wrote:
> I will restore maxItems in Interrupts/interrupt-names in the next version.

Yep

> 
>>
>> What is the upper cap on interrupts?
> 
> 20.

Then you need to set specific upper/lower bound, since you have less
than that

Best regards,
Krzysztof
