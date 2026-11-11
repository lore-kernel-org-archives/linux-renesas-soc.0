Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400281;
	b=Q5Wg1tVFY4QtqRZ2BH2JJL4FEAmEAYnHW9lRuovOazHyCnmA9HSQHN39dKmZDFGgWX5F
	 yZjKyT95RlW5Qy8WYj7VR953ma621OJQjHf/8XLHpSYzCTCfUWpG5zGeSmSEeCEHFjov3
	 1QnnWe3AD399R2JyFAQUwld3tDc9wADx7V+U9Vf9FNBx53hd5xDIqMlbUGZ4BIzbrCLJ7
	 jcylzUrBP9NvP7mjL3grZkRtaljc4WkKYYAz16kkhZrWdtOgGCp1yMwY4SxxnusJiwGmH
	 vXO2TK02J5/Dz4uS3y13KUF0QWLu7wc/brm4gmRSakhPzlv0gW/kbl+M7S8Wd1LpyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
	b=xgz2OMuZIzD1nvBAPKwoNWMPFSMOXdhWWtHBg1p5mgelZ9Rji4EOtVY2zLe3RW5BrYO8
	 3VlqFTlHnsrvpXXDpxX9sfEHQ0GJu2VQd6hJx6yKnrwjjF8COC04zxUd2Bceyxuz+kt8O
	 btfsATUJvHlskWVzEmbK5zkWPdZZAsmbO3UiRwtHV/Qa+qr7XHLp8oeZsO/A5Zfdegp74
	 g59toKfHD83ziJwgmMbItRfhKpSA8nCM6KRRtCottbc6Jlh6TcTud8ivS0fFU3SowerMj
	 ukXiYoeNs8qV2V3INEua8poQbr+dGmcpVSzp0nb+JRZoF4feJUYwQoaZm+bzJSJlRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dLIxTpxg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63084606A31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63084606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dLIxTpxg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCPOZw1338917
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=; b=M8YkKQJzuae/NJV/
	myZr/ObO1tyiVD4Kg4EGhWc6KoHQGb20zdsWicCyoLKMeZhcUCke/QJMOjNT5jmu
	fB776SPGIbuzhCGAIJ8KLoAU8JVtR2lHaqj46EwazLtjQWts370Lb/g/NXbEWVoB
	zboCxylr04BUsBum/wyv48LoDD0iMCViAnbvtS7Xjzkh5d8VU/fBL9f0RZqgasNe
	r1hG/116uhf/78bQkcGhl2HCRRjJttIrDHvVjRVMLvsWId6Lv7tqoxOXpIF0AyO8
	Fc4QUi6POKw2ZWLdD5SCZJRLZ1VeRbvaCGQFyP2YeziOMnzpA/9g+B/tpltJwqvt
	SFrtkw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ps87v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:31:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d57f6ea49bso133070137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400264; x=1795005064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=dLIxTpxgWCFgNgHgpRPhBHrdxXX5aYICMBh1A6fJYH0F0LErATVG1ZrfMp/1kmMmnH
         3I1h2+LZq4Jo58G9xkqDlWpeJNBPV+yMDMjOYmGTuyxU9a+xlvipewUdvz1jc9dsdGa1
         /wscyif6XqK0h1sEB9HA6sAJraPbPKplO9qMHZX5FcyATR0QpOB4zVLl4O8eMfeSZNeu
         F3nC7tsjxwdJYVuV3AHquWKkUu++EWUWPEpnVwKfWEKVh4gdYo/cFwJLFAWMLBBqpd1J
         FvL1nAfyd3V8ocazOem04TUJv4x/umboNIgPQ2cmjQclYbtxQPzCbzLk6FmYS950t2oh
         ln1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400264; x=1795005064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=HaOEMonbxQ0xhKNH7ISMZVQJ/BMwVH5Sv2BiqOhxRFjL5+LIt4UUNdxydT5S/mZuNq
         0RiZwK1roEzV3a8Yhc5igi698+c4iYM6FBygCtmuZQ5KRdy6tGjUcHmQkKrzHWr/3sCH
         qJVUkzrJIQJNyRLWCnw90Hyk2TIRXD+NMr7WyKG2WRmBlzMLvIZR5Av+gndbWMGlJY/Q
         NvFxBU4cFmQ+1RSBqaP92+bzHhzk4v1bA6EP0E+a7X1488gVwuluw5quw+25JqvFALI3
         cepA/e6ejIGBe0b2tA4xLgM6fiLAQZ9Y/ZFYdSk4NR3yvYwch0BLm1mS1bRuq3eiMHSl
         9Bbw==
X-Forwarded-Encrypted: i=1; AL+hErFL1NUdnaeASIh5KePQr4Ip9K6OZwcL3zDLaQGepyBGBOOnP/Fzgk2D9Ct6PCVJ4+02WM1Udtefana5PJ6NwpH54g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MYcqjlt0IrMa9jCjVYcRkmfT5zWnwROJe/2x2PAEXjKMHBgsr
	+QKeN/ucSf/vF82IRPYmE77C0oxQ6HEhzVypM/9lHfe+Xb3d2OU8EQcOa9+HEhq5UJ20M6oLjrf
	5m/spYh+fq5CtGcjajxvp4IbplHkufEx3KeFRIMQ58oDHgb4KIWSa4rwcPnSchdYcDFT39kyZQw
	==
X-Gm-Gg: AYBFou0wBAN7cBEF3VqU0x1YhwfLjyBfzRd9ibl8S5QWAyihtoS/V07sQc6icE4XG5r
	+U+fuoDJvi1k0cN19glhZDM6t+bgmYv4lNslc3OcraZ+BdKGoYVcdVJIKEzKCbyJJhNloOZViHT
	0/5oPGBY60K8FQrtAy4UN/NrrDLduuDBd9gGc3YOLNBDt//nNzd0y99vVflHiHHoMNutRfMuk/X
	4zKGWzAiKqk6V2ykcXyydUatYHE0Ay0F4jgpHcge/jQCGhq8n0sCCg/4xLOqCtl8BYbX0dFlBmx
	XxNMOMICMLfpy7czCkyrYrG9Aaik8R9O1MmQKfqhGLd4WaGi7MVswjMcqzQ0XgMDrxs2zVR4K+S
	RM3wotzQlgqF7+AhONhVYkC6wt3VPrsGU81aTyOafXOhf3TnNCOw9DDkHguu+UPdhYCeWIYmT2F
	w=
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538727137.6.1794400264155;
        Wed, 11 Nov 2026 04:31:04 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538702137.6.1794400263480;
        Wed, 11 Nov 2026 04:31:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm35965765e9.4.2026.11.11.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:31:02 -0800 (PST)
Message-ID: <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:30:56 +0100
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
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avRM_GhtR8vMdTO4@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX0l+CwwGMMfp9
 Dd2kKOu0AbDpe1VrLqlgZnWsNaeBGDc6t2InFVa03dd1MJPSSRx5oJkZjPPfpE1MS8g/iXROH80
 tfILG17zB3wt6y6nHMtxpr0YifOk60s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX8VFsJg+V3wMV
 vgfPQ4NGDpDAMzH7GS3Lu2o+icdTEgDXTSRn07SmFFGS1tiN1+SpdJvF2+gLeO0B09XfQ9XtQS/
 f0Fvcyi3jeZSOeKSbYcv4c2GrJPlE8P62k1ogK09IcItQ1olsXA60TLwwkXdfY53ozN/WRiN5Nz
 w4+7++vHCIKAjsKPkFpj6NRzXD7ledeA6hy5YqG4xUxhb4Cs5eISZbXAJlYn6XPUK566U8vT+SK
 5SR73D4zYX7QFm3xjE7M8EqrtlIP999kppyg+Zetn+OyfomIYO09a2O6DFsRT6I+r6820F8P4uV
 2yGv28wX3+yBFCAFMx2reKaWnF/jdBiC+w6AqNnfDEUPc1A9rryoK+1s845SXkiZB8b82VCR2zz
 uD1jZ7BZiXGc9QZIFn/gb7Sy4ugqDd8xcBqdmCoxPk0cPbn7wC3+i8JIGsfsfjSUIwgExl8A924
 9P7MZFd5Tu7CEmC9XXQ==
X-Proofpoint-GUID: wSnX28zuauACCs1v1PMTU9jE4pWj6t94
X-Proofpoint-ORIG-GUID: wSnX28zuauACCs1v1PMTU9jE4pWj6t94
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af46009 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iRCOULmDqfF0gFl_j5kA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

On 11/11/2026 12:13, Maxime Ripard wrote:
> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>> DSI panels can be placed under DSI bus directly and many Linux DRM
>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>> such panel and DRM driver does not use OF graph to configure lanes.
> 
> That's not true. We do use the endpoints to configure the lanes through
> the data-lanes property. See drm_of_get_data_lanes*

Some drivers use endpoints, some not. As discussed on other thread,
there are more than which do not.

> 
>> The affected here Linux panel drivers do not use OF graph, either.
>>
>> Requiring graph port for such panels is tying the binding to one
>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
>> requires the port.  The port is not needed for the hardware to operate
>> and for some of the Linux drivers, so it should be optional.
>>
>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> DSI busses can handle multiple devices, and multiple data types. If we
> were to drop the port node, how does the upstream video device know
> which device it should send its video output to?
> 

We do not drop the port node, who suggested that?

You do get, that we are not talking about the DSI host, but the panel?


Best regards,
Krzysztof
