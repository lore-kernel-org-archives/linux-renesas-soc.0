Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326637;
	b=oRdIc/eqdjKIsW5d2F27goPvsT8Gf6qGVxjBXYh+arSZ8xg4G1jw9nXhb20IpA9FdUW0
	 +o4K5jG1uVQ2QdBPsTMkG7P2mf8OP6G7WWbql0eFc1hA0ajPtqXqY7n4BRFAALxhS25Rb
	 /I8wvdE7d9cyO4WLGMKNW/97bzGO0OXEJfrB+RMG7/9HhcBq5jmOCFJrtTtoSv618LOS2
	 GafrvKpzMX9SscqPzDb0VSqvavM2H2Bs3Jv6CQ8fguCwgQqIs4boEHub52jkt5r3ydq6u
	 odeT+ywpjssoA1egRaWN772eLuc+W9CUS92Q3rWXG1LFEAI90YKvxTyJBnfDYMVDv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
	b=ykoT4gmKj8PwXThIY7jRT1/X52mOFzvVbe/rBJtP5RXx80JgWNEhETXFwjz0PLDNgsSU
	 ZgcCt89p5z/MeFOnfYJC99KLIFuAdWXmVsM/Vkp7j28O8O0cYHob6BjM9BoeXSCX+qsfA
	 9tVc1nJiblw8tqO6Xy0pKNpmsC+ZXlRA6qUshzy+BlFuejbb5gk5JbKlM8+yFHyUQckug
	 QNyDDoSC/ywjxJVUDfQoehjD9hrUVh74F3aYdHjWVWlETpDVbfMQNxP7LQn5IC9RmX//Y
	 W4u0K7qw9tekrT3aWYfRXxdZSqYHypK+AFGjWcYJ6ql4Bd/k+gPrNY979yq67TXtbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=norkWtlo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CI3/+DsN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30961606A325
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30961606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=norkWtlo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CI3/+DsN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF05Y03671784
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=; b=norkWtlo38LpdvFf
	A2dEwFuVdNmQIZaXZ3XbH5NYFCvb2tJsDBgfzDpfWRjZknkMo/WgmVusZ3m2xcUT
	KljgtF0i7asQrDsxJsgqpjEZosiHjte0dQBWCQGsr+t5WsWh1YvjHUCuFHTgBPFH
	AII261ICNeryJade6UVztNk6ZAbTdpF4N3mHraA8o91pFqo9L57k49KoQUZ9I4FO
	AhPDRzVgX3tWIJaL0ZEVmnkxA4Yh8vMBQ98XZiohcw4wmC+i02fsT+LvsHWK0UIu
	dA30mFyZmX0R7/d/T3w6vrQFvWQXsKduPJzs97IxqQ8LWqAfulRNOhm7C6qQ0jh9
	BykMpQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufskgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:03:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d32175c486so176889137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794326635; x=1794931435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
        b=CI3/+DsNJXnsAQPKmWp9zS1F5KLl17YH/8Ko7WIiWWJodDT7k3VdHnfbKYa6MX03Ia
         92fyj5wdeUqI4oNdI8AdjRVdzUgkI/cWkDEj9SHr16wsIVf0LSp7NwVqCCqKEugT/pyX
         OatIF80NderFYrUIBQFsrsc/rnUN4TdN68RFpvw5cPMSREEUUa0rT8kIqT/f8dp0EPn1
         TJ8ADSY/vTUpsmb8eVucaXjUZHb/ZDn/adpPIhuE7ZWB5lvz+crlPS4xpvfdxE7jen2i
         YtFrJe1ncmVBcuxbdomD/7E4+nzvHXDeS0MtKdS5U/cxzEPlU9bRruv7nTCoi5bA4MZS
         M/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326635; x=1794931435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
        b=y053F87/7JzW8Cnh8u47U7SKFJm6S5KmUwrdjfLgxisqWBlQiG3prwbC72SGpwxtxC
         H0ClgiNBPkFK8V9qzdNWiG+m+SM5yfK6F1+b2auJ9y0oPOC79t8crpqHAKTxTrrjSqCp
         h8L0d33FnoN70RvGRs16ha5SUXlKO4vAnDPbmGA7b26Sx33CmZQtFv+P3aAQceuviOsj
         R9CmkhSg/P9dTVpOgDUkiKZpHcfKPV4wVmEa/e5oknhfz9LERTTjta7ZyZ9ZqASa0/1P
         CK17F6H/8YS5GKdoqYTITCPsGf7zraNVEpXFslRdbTchQR02xaWul80a0ylOcT//m+PY
         gYLg==
X-Forwarded-Encrypted: i=1; AL+hErEA+BDzGjyFirl/WTtEtAIMRmfnOJEjA3OSf4Kb/iBkfILD5GiD8SogWOlgqfTm8Z+BUjbNyvxuVaVd4wpM6aldYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZgkCkeHVG/t5k2/A29EOLoWECAq9jWZSrYyT0+uncXuGv/6LM
	FnMLbn6rmVZNzqTboJFhGcrxWIdKr8YCm8TGx3eqc4quMGdSMbadclCT2ukKqYjMDFjIaNcqtBP
	Vj7/j0jIBpy8NQhePZjFBBCmkIeRp/qQhY4Kf9W+AHpSmr9Kww3HMegtpxa3c7wB56pKS7emDHA
	==
X-Gm-Gg: AYBFou3qcc6i1hSjaEoaNYd5fbrAp4y/DHFKZBe4ziy7q/yDheGqAJkGyvdl3ThqiQa
	PxupDgslWnMLI8z0VKING3HGhKBp1Czr6wIeOMz/dVA3DqmkFF6cYy0B81HpwgHDHSOGVJcT00d
	IbR34pm7xV4PkoHKlpWh0GhIZ5IR173qMIbL9uyfbKfhlmAjZWxAkWwhANd2r2/03fwxUJCJxMI
	XETQaTzZDxVweSY3DBEC2lzy6kFDrQsgbwCEckCNHH7I2w820c0svcDpMtFQ1B3BCfGpP/KPGi+
	Hk0ZWMDN5ryJ49FH1HorsUtLh585itmVb8RYfMxa51HGPGPqUdoo7ZtNo4qNKwZ38RqDVjK3jdg
	wmn1Hcu01spP2o29RhVzmZBKBaZPXnyXL0m1JjOOJjhmONdlEJUGb2V+svFalfm3mQyMoT4ePtx
	M=
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr940106137.7.1794326635263;
        Tue, 10 Nov 2026 08:03:55 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr940050137.7.1794326634568;
        Tue, 10 Nov 2026 08:03:54 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a64998dsm125019966b.63.2026.11.10.08.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:03:53 -0800 (PST)
Message-ID: <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:03:51 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg+renesas@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
 <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8Lp0hV6cl_ozy_HKw4kNiYJlhB0PE9Mh
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3406c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=tBb2bbeoAAAA:8 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8 a=bYITjNxFN6idbckDI6UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: 8Lp0hV6cl_ozy_HKw4kNiYJlhB0PE9Mh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX0WhlRz/k5O0Z
 ctzj9riR66r3DXuZZSFtXwG9u7ag+Je9FEhsemx5atDJUff2d5afkGXB+gd+EZtcstnxcW4e6CB
 kfs8gBOVxe6XixqGgulxDX/sy8t6tt0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX/21xFJx/TJzs
 oHN+kJAyOCpJXy0LjlWbHoqh/Em/UsXIBHm6LEXuirYs/M0nNJ9H0XelXEGxiZjWFPElkwQlBQW
 wfYbeZdRni4ubBMEObbSzywLRshfRfn/2nW9iJExnQ4o+dqeyVcob04KFdR5iWaw0lF0dT23Tjx
 qQnws5+/8PH7aQy0RP/qFQ6LG3vUZmvl7eJET0F86qEzqyz9cf/FdrbIPrwWxMGXY32CpMp60uq
 7QRW+tnjwiRHZGyhD3VnTacxQf1TL3cPyLSvJ8VB2+cw4LC9gMkdIUuZrDAxy3H4sCoS7c7dT8t
 /NaALvszdyacO1A1s7SHsB4JRvKarH0ttLV6SXSxqyhfbVCWmALmAmgk0Ef/7tir/f7YzNmnOoL
 wqyTpZrlYoh9IkWugjdEGvnwesbPnwod18bJJ9K1uMRCiaw6GU8s6CYNc9sDJI0ffDqg+SccC1L
 YebnfwTj3ufNlBjUstg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100063

On 10/11/2026 16:57, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Tue, Nov 10, 2026 at 1:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Prabhakar,
>>
>> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Enable the RZN1 RTC driver as a module. It is used by the Renesas
>>> RZ/T2H and RZ/N2H SoCs.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
>>>  CONFIG_RTC_DRV_RENESAS_RTCA3=m
>>>  CONFIG_RTC_DRV_MACSMC=m
>>>  CONFIG_RTC_DRV_S32G=m
>>> +CONFIG_RTC_DRV_RZN1=m
>>
>> I don't know what happened here, but this is not the right location to
>> add it? Moving between CONFIG_RTC_DRV_PL031=y and CONFIG_RTC_DRV_SUN6I=y
>> while applying.
>>
> The configs weren't sorted, so I added it at the end. Thank you for
> taking care of it.

What do you mean? I just sorted it 6 months ago and it DOES look sorted.
You just placed it randomly.

Thanks Geert for fixing up the placement.


Best regards,
Krzysztof
