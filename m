Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420357;
	b=diqxA2xuFuMkDyajeBE+Hucm9kAdkCeDHggVN7gJdlAwBWoQ7UzWnmwPU7VkwyKrcZrM
	 TMPio5YMjMyWcGDhL0MtMAebm0eRzqfqXwGYmQ55tJdl5oMEE08lWVVtOv90O4WkcgWqa
	 oemd8tcdlFJ6515hN99il/n91O5hOz5K0eM4q1BU+KGEG6l2qpzZOxqT73E8vvRogneSc
	 hS18BokRMhIntMkVm25G7Gy/uRB9nnwzrOBpG//lu3WNi1BcpgWevYnt6CJkI6s3yXEGS
	 qVPWhKZ0OaK6oCD2+8ddl5eWKl2edfyB+lOQ7qn5hubRhYt+DM1BLKqXIDZVcjJ4smw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
	b=RZRPafS+obKg5UepIiM5kKPwYM3dYDGkEN6trtM0jEgiOYOoOE4/NPwO12s5FYaawm08
	 26aPoj+WqtOVhqBU3LVrP774HmW0dY5XGEtjs2OSie5jfNAQnZsg4PwxP3awhhT1NeXiK
	 GiCgCEb9cA/iKka2v0mkem2vD2/YoEwemuj/NeQKORatWSYj+PVPdeXNgvniy180EN6TU
	 Ape98NHy8Kh4qFNtZZ3mrKFrbLoHCMKbQgd8aHK87znXjgi45F5bi228PgFo/mliXDQ4i
	 CHLI7+u4Ev/TOL3CbNivQwx7G+JlT2rDb/tWGVMjeR4l/6+UGHnpp+0rDuOp54SxMMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+wTlAig;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E6606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 18:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+wTlAig
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtC8E3680362
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 18:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=; b=OJwLpcqzCAs4cZ9R
	z79WRUa3kfaODLgha23FN8hrLdUhGKs74uKbdt+Yf4oI6veasW64FLMOCaf6OAGk
	mFD6WbWeItjFQqohIZRDhLa/oD1OJ01Vp+BQZhIJvAJBcY96SJ8tVICiiVsbF1qP
	2QCBcEpHn9TtvGFPszk4VAPyBbrw5FQsLLF6++mJ9pfOUhwaZrXCQ8dfcoiFHKMa
	Li1a/UZjBq58QfHz7MzQg5nOZRS8xt0uJNha7EGAQkdau2p3fWrWHyoys+6z5lQc
	3hWEcFu4wnISOXhzfeqWm7eBMhW/FIRcVup46XwiRSjbNG6JPpUduS9BM2AEeHho
	ED0h9w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1511x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 18:05:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so830396e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420355; x=1795025155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=Y+wTlAig52lU0jD70bw4LduD0Kcs5cUyHRcglMaHv7djhFJgGYwrchAoTS54Knomai
         4TgFN/Coob/4Yfqt/VGHj1dafzihvEB0Hbyf/kc/JGoXXDThpiYCHtefw8fcnpaPb4ZK
         BpjhidFlbl7li4RRc7nkVqle0x9krBIwB5Nr9Wmbz7Dqvzx52WBT/QS40eFTNWKv72si
         6cRm8h4QmrKW/0C/6bh5Rw3sBidd/d+y9Q/5z+J36D1wXx5DpBsCEs4i2y/VDAkouVNL
         +3G4f1PYIAvD+DluVwJJd5XWqKTvIRGcyCfsHxj9BD8/CYWnCJFYraJzqupaHdtv+4e1
         i+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420355; x=1795025155;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=kgU9Fg4XQd4HBZQV8iKcrq0ZTXo3uxTK46/f6MebntKx2DNv9ZaN/ZyxYy1mZ+Atos
         ZpKbAdmGtyuvB2jxAo8GXyH4ZH1w2dIkPyV2+UyuAh0R8x+eBoqnCXMeMesTuf2YF4KM
         X3Yr+Il0K2YRfewmBYEDA4Ofl68CgM0x913PH/EhaNRpPPju+beIeIqv/0NZT85UHOC6
         FXy0SmNhdgphBr60AFD2yAiH0viaYReMQxOXxHeFJ9HZoh36HOR3/hvSGVREN8LhACCB
         aZ+88CLokLcZoe/lCbz05K1QThSHiADLXii2mL0DM3JAR2JakBxtiBwNGn38Yv0gpjSC
         an6Q==
X-Forwarded-Encrypted: i=1; AL+hErExZtAQCV6CGRHTVN8ViOWJPyGsfwscDfT3Zw9c1ObfMFqN22Ao0W6GrvkE9PKXCz5RO80q46vBTt45FbyGykYE+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8J6BFM7WWrkyrdkI8rnCngccDUDoDgAoq7N7qrFqt26S0tAi36
	54FZVDrqYJXTT77ijFhoPyGguX9E2SpilIx/YjjKWfFS+QOXj6ZgjrR+tDY4UzVg7tGwuuUFqKp
	IZjHrx2OlCGl1WP7A9j9t3QRdc8kJF5J+dyVXNbZRYgURfXPhBuI/ojZCkafvv0Sk2wc6UVbTHg
	==
X-Gm-Gg: AYBFou10tn0Dyp78XQYZuX9u58b4gEmJ1L2NtcCKF6m/WTlAEzNanLAGKPK4LMbNoKz
	jn63EvjhTuAcUBDiRerO/uBGiANz09oAXO+fUJNvYTcbV3ClTS3GylGMyrJ7WlPPNWgnRwNORMM
	b+U2aUbaR47+KC0hBG5BmjIJ6ArhAvSlE8kYgt1DicRYJlX9cF2oZi1SYnpJc6D9n9PmTDgVO/s
	orTsJY9Ez/McwXzMTfnhj+HWUlvwafzQmn3ORvKt8COUlH1UMk1Fq3bCNUsDYvCBXQuUxZPr2lT
	JS0Zuz2I5iXHGJRx6GwJaAC9gWw5bbB9a9llsbu9+CdzZr7pthf2RySKlkvFdJnNGchSP6Of7rw
	taoizFUC8XIJUw/6I/8VFSNddlt1dUkwYPrqFJAMBobw5TLSWBAIZ6iuVC2Dnqrv4S9ncrsi1BL
	M=
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237717e0c.14.1794420354445;
        Wed, 11 Nov 2026 10:05:54 -0800 (PST)
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237606e0c.14.1794420353724;
        Wed, 11 Nov 2026 10:05:53 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm8588796f8f.32.2026.11.11.10.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:05:52 -0800 (PST)
Message-ID: <72bc9dbf-a4d3-45e8-8647-a8c4a41045d1@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:05:48 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
 <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
 <avRy_D6MTK5u01_9@houat>
 <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
 <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8OTu4NrA4nSA
 /CW1druhLArW4evobU7uQjOYJCtFiQqZf5VZBWLktKCCtLF8XtLlfafAmg7YUxdAD1+reyTOxUc
 LXiaJCnctzGuMGmnyJkU8grHnpirt6o=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af4ae83 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=fswbabxtGTeL9KkrVe0A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: CI1snMZgHNLg0bemLn0DVucODhtuqsPM
X-Proofpoint-ORIG-GUID: CI1snMZgHNLg0bemLn0DVucODhtuqsPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX/CMCElgVXsN0
 bWsHEuY18wVZhq8yhMeG5ZTSIgRa8EjnwkdIRZYjCs+dNnCUhn+Yqn9Pm0oi3BVKdjK+2NTmj69
 POYcuaftK6ukpDaZMhJIl6LpbCR6RfIbIY/qpg+kpOVKpV1YWqKapXwSJadJuXIggRqgtORIGD1
 7CWb2QpNo+MoZQDnZupbA451KqQwfQwJiZiFOmdxSsub0Jwb7+ieu89QDumnC56NjyWlKFBzwDN
 4EzWmc/dhVC0BRp0kLXR5uZvkYAciITTF9nKhhgAgcbIsdirkxJEcDhSWuqz267b8vsKtdZL1lA
 1GdheBGT4RpwQn5bcL8O4/LiecuLiKp/8Zq5d4XAX7hjxf2VJCGbNI6D0wXb04la4byly8kk2tl
 Qd7QkJcQOQ40DjyXRW/K8Fq+AcOBKWlUmw0hUceOBP5eoDTlEN/pWffhRrY9qivD8diGOFfbt29
 5rzw3EKNIRRp1OmoUSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On 11/11/2026 18:55, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 02:54:54PM +0100, Krzysztof Kozlowski wrote:
>>
>> Commit msg said:
>> "many Linux DRM drivers will work fine with it"
>>
>> So many->some? Is this the only problem? What else is not described in
>> commit msg?
> 
> The commit message points out that a minority of drivers use and require
> the port, while majority of the drivers don't. I think up to now only

Ack

> the Exynos and sunXi were mentioned. From my point of view, it would be
> better to change corresponding DSI host bindings to allow port bindings
> and then define the OF graph connecting DSI host to DSI panel (which
> might be done gradually, etc.) even if the OF graph is not used nowadays
> by those drivers instead of providing a false signal that it's okay to
> have DSI links without OF graph connection. It's not future-proof and
> not okay, especially for the new designs.

Around 33% of DSI panels bindings do not require port, so to fulfill
above their bindings should be changed and ABI broken by requiring now a
panel.

Even though neither the panel hardware nor the panel driver needs the port.

The requirement of the port is on DSI host drivers, thus it should be
required there, just like I did for MSM bindings today.

Best regards,
Krzysztof
