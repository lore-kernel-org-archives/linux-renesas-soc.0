Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401072;
	b=bMB2bOevpL3+dodJJHQeUQ7CCK9pJF/0ZvDGYYpqZ0wkl9NVlwc4wMNkutTVI5qOmJ4w
	 TbKiUqAekIFsM0jKLNDhDdbmk0dff7Z4+g8J/KOJH/7JtrU6w+0ceNhqaXIWC5WscoScc
	 H3LDatZHfkcmRdgpzSt9J5/MEYujsM/ZqsIv31i7PKdj8zGXz3tJu/SlaTtU9r3TK+rrK
	 K7J5l2w6c4sl3972zUb/BFYDAVOqf+jNR57Cf8f7G180XSunprOePrKqq7i/8P6OI74OX
	 hS1Oz9sNNg6f7kt28zdQYxSCEgNegz2beqxcTldOUQCUl5b/ucgIMH9O3vDh8h2kppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
	b=jHMzZW4lpO/irhqnPf/qoTqGCVnYaAhfs9XTVAkpXp7/BzXd5i2BkqR8ouzs/W9aErdd
	 sk61ILk/pTx/idzMe+VIfk/i+VtYMpu6CuTFsu7QsUFW0wjfngs7hfLxWWTDj4ClNqUiG
	 G1fEMQSYQBSS4ckjDFA3+JrmZ2xEF/NBagpgwK1id5Ti/vLXQXxzDd2P17tPftJLKe4gs
	 sSH6zELze+2ewPxz6hSeOs2FcFkPg1aaPhodUezkuwvlxy0SuQhsOShrG1v6pNuIMcAtb
	 OFsO2sQb6SwvzZfjdIE16lpBCSiBT2lHUrJA5CMkp+gGC1ALyp3+Zhq3bQG/L8l+Cpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxMgJ9LH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eOaBFmlw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29161606A326
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29161606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxMgJ9LH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eOaBFmlw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYrlS300461
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=; b=ZxMgJ9LHyx+yYhb7
	DGDEcUnJoT5haAODh0YG7f7GPmJBi6ogrxMSbDi/RS+7aI0rfbfwIDQ6D043tCwO
	xzY5Osy18UV5kSLtcCS3N6EWbJKZFoEMYQttlRJd9Kg7eWREXmvDNC0WuPxVmOan
	m6bznMkWN1p7NrrhTtbF1wMiIbwPdD/fdPKChkXD2rlmQeRPeP0+4lZvd4aEBE+o
	N6NdBP9MtjVLoB5mMJZHx3uL6zKk2yu3Y/u5k671dCgJZ6Ag5AxR6WoBct5BjJhO
	elzMzwtUO1FJm4Ct+Kr/pN/bz6wKAHLTMeEJV1tQKSJn8qqCaBer8ckXHTuZNSSF
	ooJfNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrh5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:44:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so659610185a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 04:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401070; x=1795005870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
        b=eOaBFmlwiuljviMbR+EsaRDkoFRnYPbiH51juUP7BInl0sC9mYsr46hFV53+rVcS2M
         GpMI0fIyiHTUz85I52H9OfchvY92GIkeRwgAthOz/zw5T0u1GdPENrxqLJRso64zXBwj
         Y2eTysER4hVuCU2tihtb4wxz9YqLiTuqrytYpbTNgIDlwvaH7g5jkr2i9dL6I1NEkrsl
         LuaHOqbtTRz0EFTQbV9unRfScrnuJlyC5eaIHQ0IRcl1mn/77BMDWzarGGYQ5fnDqg9x
         FGgpNfUkVijwUaWk5QTflii5c8YMxAfoqxx90AIwXxK4P/WhPDv7vKyAhOiUs26hFhRR
         I/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401070; x=1795005870;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
        b=iX38F44Y4WONPHjbntvO5bNsRb1dnfPc4wtjid+9B4TB2jW8JbZQDDnk8qYk122mG4
         Fb+T1zc+lv/BqNVq2KAaKPAx9irSxbyHZLMBzDZJOaAhs+ad2+mf2RpdFrbJOSLyl8uI
         eccHw0IhuvRMrsvRfqADaJUrDFZyfUm0ufV5SIqRo51X9RmXxL3W+2T1+wjsaaDkyPvb
         BUXePO7y2z8+bvHfYXUGVQrIvJ71P9amQESn/Q6rmxOCayn1PQxAerl8uwj7VgqhUaWh
         jXhdr91nKjo64F+eo5OC2dvqbiekTHOGJf19fZ7/qXnznP+Tjh8+Aa+FapUslGLvh75W
         ZnhQ==
X-Forwarded-Encrypted: i=1; AL+hErF56CpB8YHXQ8PlqlM/k94GbnBcpbgLpEMJocMR2dkfv72KQJMBk77Wu2pjMYqOpHTDNeAPdSYXK2TFRdZvSqQDDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D8mfK47zTx3szgvddcbag1Oq14fWIj2uvhjyzpiII4iJtuD/U
	RnoQHf8jEeaO9A4a6MjvBF6/ycdh8SxtckgsBbgyzgS1bA5FyqJb1OXyK0N/4K2vSlgnNsQSv2J
	rOVvAx+i18OYCEm8nuIPFJulajOaEaVs7txxvV2Ksfz4n6QVLb3D2xeOoljQHwQXrKpwiZuBwCQ
	==
X-Gm-Gg: AYBFou2qfjAS8o8sM1uAJO4n1BBH3ABqwFOCCANGI0J7mcfQaL/y7013QgjrxE/a2vN
	JwMPyVwJxRb5dQH8iVj7I/97TgQC58u5Q4RPNmcJkG0Ux/4ZHBw0LdCkMMwJfisaFryS8pghAiV
	4sC6JegcojK/ciXUBEFATCaqb9uL4UqSPEYII/xScWTrCIV+CcgWYmucyzRbH5Ph37yanVzIlKn
	bWR+SqUZE+IljDbbS/AWKaFSCBmOlPp7qTOHGk1EYrdnj957LiuwXG/CNwMY80e0pmkb7bO3SWQ
	Nyc1WV9XZz8BwoXDCxr82KbmoYg79oLWSalftfziEnWsBJ1t0JvzLdA/1aNYlSbMReMRTFr6Ggx
	N8117U3vp6qobbUcF5VOVFDqLHCcKLQllzVY7jayEvxzf55TY0C5BVcqQBycPrV8c9esRum9vcY
	I=
X-Received: by 2002:a05:620a:1b9a:b0:93f:2c95:658c with SMTP id af79cd13be357-947aff969bemr317657485a.14.1794401070310;
        Wed, 11 Nov 2026 04:44:30 -0800 (PST)
X-Received: by 2002:a05:620a:1b9a:b0:93f:2c95:658c with SMTP id af79cd13be357-947aff969bemr317649185a.14.1794401069520;
        Wed, 11 Nov 2026 04:44:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10036962f8f.29.2026.11.11.04.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:44:27 -0800 (PST)
Message-ID: <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:44:23 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX6JdH3NBYWOar
 YELlRK6CZ2ax8NuejTeSzM/VGIAd4AttjQ90foYlvvBdMqbymaXknYGJKpsLWR1HmP1EY3dl3Sd
 74YzSCz1u6NfRFDKnLz9fyUXQrS22rYhhA/u2j3iKju2Yl2F2dZi1rbrYzl/xBK5FmQMDx6/s5g
 v2TPdJY32C28bPQ/3rjRRlD2Nh6XkZPh807oad3aKdT3D6ah8Qr+/6IfVahWZbJGeS5BPFR33JC
 6d2Xl4FSxu6ARrPLEbyYcJ2/ZGFpnp1apzYAueRU3qqSy6kTwGZf2XDoiiz3OkpRzNIammkCfCv
 Wp82oXBeN7u6PmBCnoL+ownrlNsw6wgRqR776snzajdng3dVLWK1/m81T2XUzl5LLdC4p8RzVll
 ZTNCzgWLjy5vnRE0jEkEVbjF+t72AfmNKXusc/fj5DIPJBa33zbKQbtbGIaOUh0z2xjqXSnL1A8
 3Wpf24OKPwq+UOpfH/A==
X-Proofpoint-ORIG-GUID: a0RijCkxwg8x0uM3bXOXVo-3EpnWXvl9
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4632e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=FoKKIyl-W1BixC_GgiMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: a0RijCkxwg8x0uM3bXOXVo-3EpnWXvl9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfXxKwOgKxAXQkS
 FNbErdFu12khGhcMJE5+MNHgzlDtE8HIJjDizfaPcz9b0GhcjRKW2AGGn0weNNoR0S9lXslRUW6
 26w2xs/fzLOVgG+yvSmKR/Ug+tSIGW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On 11/11/2026 13:37, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
>> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
>>> On 11/11/2026 12:13, Maxime Ripard wrote:
>>>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>>>>> DSI panels can be placed under DSI bus directly and many Linux DRM
>>>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>>>>> such panel and DRM driver does not use OF graph to configure lanes.
>>>>
>>>> That's not true. We do use the endpoints to configure the lanes through
>>>> the data-lanes property. See drm_of_get_data_lanes*
>>>
>>> Some drivers use endpoints, some not. As discussed on other thread,
>>> there are more than which do not.
>>
>> "there are more than one which do not."
> 
> Which means that those should be fixed. We have legacy cases where the
> drivers assumed that, but we should not target legacy.

These legacy drivers work fine for 10 or 15 years, like Exynos.

You can improve them, for sure, but if no one does that then requiring a
graph is a mistake there, from the panel point of view.

...

>>>> DSI busses can handle multiple devices, and multiple data types. If we
>>>> were to drop the port node, how does the upstream video device know
>>>> which device it should send its video output to?
>>>>
>>>
>>> We do not drop the port node, who suggested that?
>>>
>>> You do get, that we are not talking about the DSI host, but the panel?
> 
> The panel might be driven by the host directly or there can be other
> chips on the bus (someboby has been asking about the retimer or
> something else sitting on the DSI bus between the host and the panel).

Sure, does not change that panel DOES NOT require the graph node.
Neither current Linux drivers, except some.

Best regards,
Krzysztof
