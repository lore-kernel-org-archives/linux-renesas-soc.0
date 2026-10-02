Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40FC47DD78
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934601; cv=none; b=THX+nC0B2lP5N4Ip1kl0UIpTMFUDtgkREBJG7wJnQNRmd71MP+nRzxF35ZiF+0j69+cq0fKY8J2gOuMGmfxeu4rBCZcD/QRZ9dNs8BSrfS8Sn1eh5+sM/rhW06OIC3oYqkcIuLsOzWuMRZNSB/APWoy32GwweMsBXB8ZybL+JzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934601; c=relaxed/simple;
	bh=F0sLIblX1LwJTORAx8BzwbeGJ13SNRyBB9uu3B0ACqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk7Ol4NrItq26Tgz5u9gTShEmt6C/EneGr/L6kPjNKHpCV+Kie0eKVlPFdk740mMu4HDZAFes1l1G3BjHD5Y66gfNU+zZGnhhbxrBiYnEooPbLNIvwHo9+v/Fe0AcnLjTbzCt6rSCwXfvfdlYpi4WzwdXHZinXU6dHvJplPZAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoiWOYmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAJ3qVNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoiWOYmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAJ3qVNg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nsqi1591157
	for <linux-renesas-soc@vger.kernel.org>; Fri, 2 Oct 2026 09:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=; b=KoiWOYmnTOOnyP8z
	RrhIaArb0jrf6yayEb1n4SR8GBKjw6fraJDTuhHYU3+jg8dnvpV/eDinoeLlHg/j
	TjLrhNdubY67/GIagsabNcnVmSeg0L4nM8ibHwqj85rYiAj/tWrq9/QzpAQ9FczD
	6pa4Ql3ODOhSIgYhbgbdA8b/zXiFYNJtDJbUbIeWlW5HWhgpUUr3u6PngQF77HJR
	ULilbTQo+SGSTovr3IumjAYe5c5O/cdUL0zrVYxqGeQWurUKBHAjB++P6IxSplWR
	cnP2OD1UAqh/SeVAUXYPr2LTH4J6tFWWQ3puRMRW0mP2A8JaKUGA5Lyky/tF7Lta
	8ETD2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukc8yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 09:49:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53397b6e05aso17575491cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934594; x=1791539394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=HAJ3qVNgQAqAlM2g4GRhMbPRzgO37Fdw6QoFfyrJ9snDUdDlgrKA4ceLYv/3BpCaL0
         +mQsXqFH+zsm4UbqdKaP3Za7QNCqbmay815SmMXHJbPKZOiJDSpLuN8+fOqaXcjvjezt
         AE3OkgNOAzz7Kl3zsA1D9a4kULmI73WZpztbsjl1KWNvxSrd5y5dOe7dnC2v0sziLeTZ
         ng/QcZk+kSsJNqGKWKNEjiKQci0WzkC9QTo/Qgj0RWabSVeYXbqn8FEVkNvjle4egWXN
         SjYovd4XklGYB1iNsf/SwY3XT/SdmFuMrKe88JzIgOR6p8JYSb4cM++uLrHdZc3/uHIu
         ellg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934594; x=1791539394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=wrsII61DqJsfd145+kLyXkmnnxlRz8RTZJHclVgtZ2iwNyTkY+ZeY/rIzv0b2nakxG
         HlG42vKTw3nlyGDVEDJA7o76lFpA2TGaPUuGmQMlRYYhSBx+nlbh10Nd1/Qi6ZHl3ml+
         dmhZdIi1jXfmbi+C85C6cfaueOslEnj2HKMegF4/URi87Fp118qpYaEjFuaQaW8r7djB
         qVVBayRsMRYQcrDv0wnLzTjr6DnDbDOvWK384inMGFTdAoXVKuo1WmZjLNsgnHmnPX5o
         xNf8/WTZLU7A3OfDAOM0gl9t5kWKoTPzuw/Z93O8GpU+pLguhQaeJNNZUVVjgGH90ORt
         TY5A==
X-Gm-Message-State: AFuF++lsL9GCujKvOyLdvzyusg7tkP7s5ygIhFfS48pG2fZVUhScD3a4
	qWG1aej4BVqHZ7DK3V6p+Svf53Cu2Fw8ljmBDBhwDIgJdG2DCNlWEzWUsjIb2lkvwwhCpPbxIOH
	VmqV4fdWeGZIB5WVkB9LgcDib7vlQjv8J42+l42IoNbI8gvRSLsHdT7IspxdMeRvcNy3DQScJDw
	==
X-Gm-Gg: AYBFou1YsmF3/eXv/4zbe46H5X5TyqQEUqaWTB49tXkhhDf5HAQ6Y0OfIIr2Y+DiDgx
	uGD4d+sk8k98cLkblzCcuOVf6xLxXSbJ9llpM68xcE2A1dw2qOieqyooDsI3xU+Z+L+eswaKx+F
	JjQ3uJhPT8agoWo0E/HU0I7pWbixzbZpU4PcbfyWv/RoplgEOaLlmniswGYGeX2eCowMqU3Ox0W
	s4MFEJDwf7ALsPgC6E8YEv6L+FnaWjZ/sBe3jHBzO8kzdYV2RgFgqRYf9/nucq/X77vY/2L+cZ9
	6M1NrKMcbNy5vaqoL8BqyVToJFeksAurllA1kf3Cc9/nQMfgV0yk3r3L23Om919latfENwgHU0n
	6NgI4lWKFVQlPxOdBI9+mjxASFbzIwYYzc/iydmiDY9q1VcqdIFUNE55Gg7mWrw==
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326873285a.50.1790934593188;
        Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326868685a.50.1790934592654;
        Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm3914595f8f.1.2026.10.02.02.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
Message-ID: <8eb0b435-e5d4-4429-a807-24e15b0659fa@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:49:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] timers: Add support for RZ/N1 SoCs timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXwME3zvKMWJpk
 PbBalhY4LzZUKaBmPA0q8Xpgy5YeVvtCVBIX/Nwb9Qlh+4/L8KpE0+9DvcfFfhgIham5JcK6cTE
 yC6JJjwEbjx7DFzaTot6rDXobgq6SQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX8M9rznIsdkM+
 uUOPwoEabLibM4waR0kuXR4ragKGtasicq1MQ2223a/GR0OFX912MC2w/Be5Wn4zn6wtM9AMDlq
 w8rxpbt5MGaJGUtE4K3Y8iUuOgMc97VoOAhfTh+5xzfOt9No7TQDvjgDcLRquuxLO7y6phISlw3
 j8/h/hJ4BIG3dRJ3MUS0vLJDKGA/ldmBjtNAKv7oHpmvH82U6MNtWPD0peAwbRrNyh19ExZvd62
 UHZdy1hTdsadvbLDxMdFRLSgzU03Iwj2TbPiSuMTktv65TQfC++KmHzJasbzO/c9xri9sHGOBuc
 WFUMq91PhqcvJGaUDXv8LIxq96aGWwu18tTgUfjMd7+KcPDUR7eYZbYRDco2o0m2VDWMrl70QSF
 8mTvziJG8rVp+GxkHBz/izfuPLFACrCHws2PLwlB69i/yyBy8Q7JI3kr3RYKU3k3HjqX+xecvLj
 rZ0irkPNPx/LdY1uraQ==
X-Proofpoint-GUID: ZtnPDjvxsaL3cS_NIKZWLmNbxiGrEeP_
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf7e42 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=v9AyLkvIsLCxcgOLbSsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZtnPDjvxsaL3cS_NIKZWLmNbxiGrEeP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

On 10/1/26 10:22, Herve Codina (Schneider Electric) wrote:
> The Renesas RZ/N1 SoCs family has two timers block controller
> available.
> 
> Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
> timers).
> 
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 (timers block are fed with a 25 MHz clock) and
> all timers can work in either one-shot or periodic mode.
> 
> This series adds support for those timers blocks.
> 
> Best regards,

Applied, patch 1,2 and 4

