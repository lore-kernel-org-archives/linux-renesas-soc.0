Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706836;
	b=gUMFEWBj+TI0gbKzWLQqPyXaXXtrpmhoKnv/fIsxYWmOWBeGtBrdmBVm8ItGqFrlicw8
	 tURCGszRwccqTZFqwucKVF5NvDwBkf54YwpB0Rcvsb4GLZ3eKH93LT7ZK7UaR72rxlk5w
	 fYTFo4DkiDXgqK4Y1qnTRZ9WWGlZ8qVHPrJ/zgfMxi1SVoOEHYUm4QfEE51qFqdyeT30s
	 nEu4UStNE33hZUDWm2ww8rV+ZmrLH/X7hmkQAB+eU+2yoGLCyRVmOX1s7ZOKrEE3XTvQA
	 NaQHJdsNkhmpJjJVMYaO2Rbdhrgqd6sOru5cWaC+e9pVpDD/0YT/FTiXR0uR8YHUbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=WeSsmbzD749BO7d5p/pNM8WDos+MMGbd6dqcFmXGYbCmya+T51GpjtnUVoGjDkUj8Piu
	 HyOMqmuvJOefBsrK//yhgCStH4mYYTme3YoXtYpz23jxI7+Lx8uSkvo9Dd0VDRLYxL3ez
	 sO+TUZYCK1WClcQEVFcn1kNEAGEiZScCbymZ17xhzEe8u/HcyJBbSYCV6H+2o0D39g4SC
	 J24vgJRVY17t/Xl1lMvHQXbrH3rKMnetFtwYxcdcuvkpTHEGw4z2LkLO/LCZ3J26s4vKQ
	 1TzPdt+bA9BuxA7kJ3Ca1rLMc3DdjrZJ34FZDWZc6SaW/xNJ6k4s86kUw2RRFKaGl3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB8F606D821
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 11:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB8F606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAG432522035
	for <linux-renesas-soc@vger.kernel.org>; Tue, 3 Nov 2026 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jgj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 11:53:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so2001261a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=KK78crOGmZpSA555x++KwTfwjDuBx0eos14VrqpBCgLIy28W7f4uZKjNYHCI7ay+z4
         2yiQMJMvcstAWxARbkl6wagm9d5pCJdPQDIGKyQ+bDmXQr0Il8qweDzX5Aqmi+ES/jMo
         p1qyKLOd53d+6NGFXgfFWo7/m+hyV/iosjja3oBspeYvsOTBM9mfHfeXTKp877l6tdUH
         6x1ON/pCJLUfuO8SqvieUqr6Kwa2CxOQaFxRQcqfGvGfAqrFzwFUQ123x6HV4PN3w46h
         qpg4CNqiyGV2spbTKqgx5BUBc9npE2Lk0cUq5WUC49AxGU8melpdpfHqUlm0h18AwyGY
         05zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=mx6POu4EI39kSaGiaUWi8EG6npr2zGO80hitVvR167Y40AeDVfF1YzJR2r3MjtArxh
         5dtE7cMR38k3XTsNc7ehbTKYhYQ8dJ/AZst1W18IldmETjWejou/V/f3thlHDvciYaBA
         q3fWdByD3X63QrCP5mlyl8aYNLHjHmRqTzZpoRk6yVBTDwnJa75b9FNNWCFF48Agwedm
         GVGQ+iPiPTd02MdM1EycAIGpOEVSWK5L3vLn6ewPtKEqikLEzibxKsuIEuhmkMh8X1SO
         6c/0kI66QfYpTOUP2LWfxjkloHOOzNhRSoeIMa67llVKM1BQvGWbu0is+IQUs2Y7Z6pa
         RkNA==
X-Forwarded-Encrypted: i=1; AKwUvBy12gWmnEtQJALATDqZBMXuQcG0XuZn9n9wAbt4nvkosiURRTuZ2QnB8C5VGkV9aSdeQGvhJGZVgXAbBHS0QuYDjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OpL6pIp9z5yr6pbh9MQue5TAYT2DtDcy8idSagJP5hVBViwZC
	wPNTnuBSo8RPsrP5VpW60QDx9V/Mgqz91tFDq2f/9/qBSuLWTYB7gBaHSvp0maRCTq5JkuNKH8s
	lbZclXUv86ADNV5hn/ZhuILsy1Bzx0nQHPhhtD4++hhZPyGPJ33tN0jn51uVat2rox39y60w7FA
	==
X-Gm-Gg: AYBFou2Hm+d5LF8fb5mN1sq5SwIs7JP6srQ16uqz52jDM5n6Z0y837bgPsYghHXUH7O
	z+zAKlSsPy2H/DsxNBwG43vvkcwY9L+7Cow/x0myBtfXzLk0cEQEBKupG9XyjVeqT3nPKahWcl5
	muo7NDITpjrxVUCW4NWJ2Vru0sDdR6fSRQnfBSMgX0DfAQCZzCOh1e/zsAZ+U1ZHK+zgw/UvZ0i
	LOv+ECcTbuvtG7tRZt8BDRcpGwRHP7XkfFkWHm1chjOQT3mY+3ZP3beQF4ZXvLlphCxX2YfO3xO
	HXZ31SWa/hey1M8Z01Mio6EQdRTfz2sKPR4LJZb/urWvG0o3Z1RSaJjjFruB/OB5x/h6tPbVL43
	VR/14gZ9paLZRLuW4kKBIdO1YYPdtmmuJXWm6la3a0OVm74+9VTe+mhP1BEd+bjjaU+Fw4ME7Uj
	F66j0h7Q==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480935637.79.1793706834829;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
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
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8eHmwsaN2ZM9miEx2u72EbBx7EynMLf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXytGqxc7AEkpa
 vvpq8DQ68zOPGQmZwlUqubNAohv4dcrRqQp4LoA+H3OHPsm+MsVLCondq1z0eWvjb9b6DNmrVyt
 v90iyTuc8oRakV/SpHMRFhV3f1e/NazsfsRX26VMQ0aB3YWxQ8wUsZqFRLFX7YSj1JG8KlvPHRZ
 EKmOGbyswQ68LXfeuv62y9L9Ava3SKd7BzGdvWbc6YQTQ++XKonjoYUmvBC5C/LsyaxjGGx2AUZ
 G19iJlC+cBeB2cEy3wtxoZ1RsRTh4IptEKR0vzd7rLjELh1nbsSuChrrGYgs4oCE6P++eyEd90j
 jT2/dTKIEVk6EV4El/4FZEShmYAG5Um/w/2B2C3JNUrzIXWm1gxJrSHQ5HxfSQ6AYjdw4wM8js3
 y/C063mjmaKx/Zctu2ozu83ndtC0rArrYSwUXKC/JCJezc2EgfQXuk+YEdqWLF8qP5qomSbqugh
 1Ug1rssRR+XmZ23KPEg==
X-Proofpoint-GUID: 8eHmwsaN2ZM9miEx2u72EbBx7EynMLf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX1oKCO85Miv79
 LGxOGc6Wan+ezkji3kg67+Z+jp7AEyBk0wtkvARHGZMz1CRct51AGy8uZd9uzesmv+iuzXU4oS7
 RRf4IiHYZFZThx/R6t3mDbntW7B64Zo=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9cb53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
