Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3F3D4133
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326515; cv=none; b=sgbLeSE4JprSC9A0bo7HMaaj9Q+4wZhYFy4upHr1oteCyiUPPSX4KcqIjUpICmbBvvCrZjrmA4sJBs5XtVSVhi26/6Hjp4zuXACSSvZBfwcU7l9fPSGjJ5Wqi1glOR3QB4nl4Ocg3RXQWTKKCgOSEZP17Y6tMACMkI5WYA7hqmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326515; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaqA6wORXCPmBL7g+m3+ajLclgJNiJR1KzW3gjW5g6SabS3kMMAoVfRD1JwXyT4iKpJah151D2DK6MQvbS2zPK8tUpg+8lqUhynUjif8zXw3vr1saYn8yX4fn/Zj3NVSoeeodaJsX7PIgZglCm7o3mVFr5q3JK3ay09E/WhiMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALmVCr2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALmVCr2j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641t933618051
	for <linux-renesas-soc@vger.kernel.org>; Mon, 6 Jul 2026 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nd3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 08:28:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f08560ea44so32487756d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326504; x=1783931304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=ALmVCr2j8N2NMMQmfe6GSQtYnyAkLksi63xMIKayZrlcC9mqcEfOBd1o2HnrHWFc+U
         gsT7HKHQw6vIW1rB788LU0CfjwdbwwOvpGarH+c+dGxR0OgrvoHgnKyKcdWBL6hVvg4d
         x1b3T3wTUZVO5DzjfBQMPeFAoGpC0AmZByVSpzV8F7va8to0wwEPtH6sgNnCxtpyKKJQ
         kCeU9ZioVar9difuJuefuYsl3Qh6JD4qw68XYG3ajCjz7nRvU4guTwXEq9BEIHqr7vJo
         vwp7Oxadq6JlgaLWKqvfJn9Md1TDFCHJqXSLnPvl/njPfVwyUoGk8cKttY78FYIF3Dm3
         B5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326504; x=1783931304;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=ck+N4kJ4mi+NucLr2P9ritGbnedmPcR39LUHg+rBcjnI4mGwcpG/1NZLZ3mk7CRqBA
         FlteV9gpJf+maz1zQnMou1jU1XpHd/7lSZ0aAB3XxPFcPmFEuG3a7d+8/U2j5qwfHnpj
         YD16UeNg7myKkMZ0+DoHo8e1cFBFp8SwAT7Oku9kV54+Go+tlnbPHiehAD3xhWPTBvHY
         9NQKsTYTQh5LG5YES26c/ApdAlVZtKhzlU83oBmgnkxkiypR30iXCKEwbMFFvNkYViyl
         cTNMwVRVrYNAVXPDwNKuZ01LmOYyr3Js2mzYRliP72tBYQX5NURxKRMos9vhCed3frXi
         UpKg==
X-Forwarded-Encrypted: i=1; AHgh+RpS+0bPY6GrIz81vzXi01hvR3XAn2qVDMaUkROV0zuqqCDmKK1JTBuBT2RkhE09YCgGYX3wn8Nq2aVfHdrGJ4fAtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4zxiVQ5TzUox48a4uUg6gYY1SN+GbZFH73yHQfvGb5UENunK
	NTMbATDVV0m0F83s+OP3gMDqnIqadBc4P7ZpbC/fPUDWe7uhGJoC3Zx6zRM1dA0rBu3nA+mNkXU
	6D6nvD7wVdRQ5UPJq05n+BBWhMjlRTg392IwJ8CVcLrcDcxFXgu1pDgMUIdoYzeV44DTXe4uxXA
	==
X-Gm-Gg: AfdE7clC0Ot5V+9z+dT4MFYIApohtKrX8aDMGDLsjLE0yFFrKZDNdHZr5I5oPpWIeEB
	JwiUIYHD2II/QmxaF6lICQg4MwPJoh+a3i98sNT2aDwQPWVtG6Zxhk1sYquyYNo3NfNDFSSEN54
	DVuqq2cBV/BDKeKfpprGKmh+bi/fWVAYA7RweacyZMeKhGPL1igZzfpympnNt4uabHGOtp18g/i
	PGDs/dim0asCSPBBxPoJG6xfE4ONtRs/ELqLCJYkMxP/3IcW1PAuxVwQQFe33hzB3UZc6nTWcpr
	5jORd6YWyCJXDqVF4kvasQGP5z3sG3m5V/H40Y+gX2C5RYYo43joZYf0CQRwYWsVqGNvvxYZ1Zn
	WVNiNR0aMpF4AJYOE/QFFmRFF5owXBSlvRQO46vMuCo3cuU2i5hLUgYh5vjZFSQ==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294195085a.62.1783326501628;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX6u8Wzfw94q1R
 hh/ZrFW2ebvnOmWNiJiFHuM+OWEq0Ca/3DVV7vp9AWcl/SMrQ3FASnx+rR4qRzcU3N9/0awjtQX
 +BQJCQ0wOmV9adI/u3RAHOWfcO7Wzu4bdssnyeiNgWiNoY+s0xjPOFNCAzRfD2mE30YsWQnnSVs
 JkzIuJdcOmUTlYJf7BJ9b3cRVsaYGg7kJDFTs0MUw59mnANPdBhkrWIs1cxvo/1CdcWH+70xWjq
 Oj9OeFd+4GvENYzDIhQS1XGb451nU9zrYybLv+R7GcmnPLOs9bn9CzT+7kbjK5VLHy8ULbVGoxj
 inl5B+7q8/ENtEpe1jMwxneqAJvXaJ5qwYjsKJ/3lCqDFG1ngo1h+y/yd75y/6pUy3HkgwuWx1p
 IEnhBaHPp7QQuAh+IsJss0EHt6GX8HPbxa3oAKADJAFJcJgXrgs2C5vR9IajwoGqV7T1GdtJ02R
 OoTWq27rUEs2BJbDQ+Q==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6728 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: h6hNwbnKbbYjWSCeV9Bzcsm4XvCQHkHL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXzHFSwUnwgzJv
 lqbfPyneDMubqXtApFSpYc4ZEcPCvDhWF1U0ijwjaDSU6DWcI5l3xV+ts5TVbgKWIJm96nVEe/f
 i+lMuN33tCSQ092RSFtr4IPlCyi7mfg=
X-Proofpoint-GUID: h6hNwbnKbbYjWSCeV9Bzcsm4XvCQHkHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

