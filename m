Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400682;
	b=MPlMFuZ9IwJ4rvbN5XcKWAjQNvdMXyefvXfoyOb308yNoXesBq0EgrbYoxDbCEqv080Q
	 Fgml6BntlK0LdiRpHPExhDr6Mej14aebnyxkCs812STX348Sw/9tMRPp+C4iuzwRPsuny
	 V1cbbhqL1ZJRZLh7ancuATjAfwqJUJw5dWXsKMIqMwsbbBnqO8To/CN74QwHVnUhHV/sE
	 8BmHgH/VH0KZFQlBjuoQSNO6DLPbYteW0qXLVjDe4UR9mlmJc5LltshlbR3yxELtcBBP3
	 0FEGQxySYgGmoL9Gg5QZ3SbZRn2nXMPAXDz8F+gQewms2VzJBMI3uRrAKULQd9jelsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
	b=HuhuNpPhFjXTztdhzkDi4Uev2fXKpmUYAbijvR17Vo7OP+qj3BBUtCoi/jK7Ay8TuQgq
	 NGGecEdAZVJAQUg2CHQ5qd0TRxfrDmW77QtUazzGaBby3Ih7+wJBqH51xaFfb7ZymYq37
	 ioc8BHxkNWZ/MAapVRQiPtD5r2L9iKow57RXmjVvAlw+sHb/6KDndNJBP/xAatizhW8fa
	 Q0stRXmSmWepdHAyQmXzdEFuIBT5Itxa4G4yJaQrdebXDYQ6V3fP1lnS/SwcGssybGskH
	 MwoQmOW641BhDEzs1x/KFfS+CFTraZvPmdkK12/GwlRdgqLG/Jskv3E2a+MV3vnaRNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1nAz1PX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjg3vVV4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA965606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA965606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1nAz1PX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjg3vVV4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ1Wc1359189
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=; b=D1nAz1PX82hWEvZm
	zlE+Uj9z6A+GuhkXBfOYZZwvLm0aBrQeeC+jzBAz+QlZPo66nNePlKUNLmPh824J
	Gg01qV6wbvQ8LNumDuwy324F6mwUu2asPtSYP6uQX9RjFkfEqrP7cFtxFutdrjJ2
	1nyOayWjur/PdNuJzmDWWo1+SxRm/7hmluxo+KtT0A8VHJOrvL71zz9catuAerBO
	G8ry64nSjZo7rFNZUe0i43cjOo9aHsS9li7QPPYkkWOY0yBI60Dk0ba2ENK1E2gE
	kHN+za2+YylpB5Od+ZvfRkSjAMVtnlHtR3dKb47FXoBiA3f2KGDgbUcMzDrZFL/5
	72NZnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ps8wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:38:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso2379660a91.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 04:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400680; cv=none;
        d=google.com; s=arc-20260327;
        b=NsJ0MCmaEzkSSEOAZy33zZZKwBZ2TuvNQjYN/F2hgo74eVi8s2aET6Mj2gJLCs//5U
         DssA6Uoat4DnW7Ijx7WgKm+g5O9RO7YZ7Zr06gLBMNcEutPWIAZPSdxRhsmrtNG5YDAX
         ukcfZRXn+tJAZkjQE4vp/ev6tywL7TdcUjRffarM8ROCorxrxdAREQNNAa+sFkF/tUeD
         yQiQPU1TitCBjxgRaBRydTz+T8NHzZCvA+8ddArtvvasQcBVo3S/fhjwpcJKQcLpb++3
         ek+btKgEUGbWQt1U1JYvv/37uV1HD2+Il0azJBaO8bHyNWa6rK/uj4wlcv4A8RogW5fG
         lh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        fh=fL9rM7f/jiLxOTjCco5ZArlBlSqcdh/75XYBKecCw6k=;
        b=oYbR02UCyKRpMy8NLNzV2mnuO5CdA7ilzAy89JLQe4nm2a0y5v845iZRpvDjopMOLa
         vk6skz2vuYpqgXuhR1BRYMPPfzHktzr+p8NTzySPquueRjXA8SRa1J1zLDkZzzIXvYYk
         vuPw0jxYc2cWkkAv89bggmiERa0rnpOOEXGgGO0vjKqrLHcLxAHcNOmuaLfF+MO47+mQ
         CDrcFxTemsCuch1IdlOG2s/QqaYx6syGCsP45z9z4eGlEaNzvQ8NutEH1HxJu8iePymn
         NY4t9FYU3x02BOd4bbJrNZFqwlhVWz0/tuaO/mAqwszXd5V0gvlgUxxvLolvvf1K4wxv
         rhjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400680; x=1795005480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        b=Yjg3vVV4H/Nhye2JcrzlILXBqRBm7Y1k26HwPRFvWp1RxwbbjNFVANLFPofXbhRi8W
         DHh1Fv8iNAXHbpWum6TOY72rWAxPUscSkIZpTkFLnZ/4dc0woEk4BwEie+boVpanZGHi
         xLNJZxa3dxJYag+Y6ibMzzMfgXyaUV7bhXgb9cE4yaUqgBhPnk5nMUwQIkPqo3FI+zg8
         pEX1+EQewfozgymk9IHb8xFn0m5YTXYcZIWwWi239G+2I6sDSi2YwaFPDkR8u5azTae/
         KNnjs9g9Mt0jFIIlk6CNM7hTsaZh7fxOor+KNhkzEnQFll+kVcaSGq3PuXvVBEGcEQQt
         Q2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400680; x=1795005480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        b=PMfOXiV74d4Fhc8V0l3ljdZRJR3H+gvjK+LtVTNFKFCYkXZlcTekoX7TCqf2Q/qhiX
         TumuZyOyGsVGP6mAQnG9Y9iDE94REVvYFpYWBEgUhU6k0A8HE1u+FX9upMB6jNrsMYdT
         AAPBmO9yS1OKpvA7Y/sdS0nsQc9Lyxcw2R5n8Vcof2uqQOdUasMgi2pJUgKJflsDINao
         FGtNoY5uK6EjvRK67fRKMRHRWcFEzwy2wAYwrgkCpt2S71S+eeZCYG5UhoOYx9cP3+bw
         mR+1qDkg0qRPxDXz8umn5jqaJZ4gAXt3SWlXKtkvsbaAXhXfmutHuW1Awobkn+xe4AWs
         BaIg==
X-Forwarded-Encrypted: i=1; AL+hErEDM7K7fLrAmasULR0b1lDnjXdgTS8yGEgZODh/EIHivag3Te0maMUHTJDLeXWvF5rPGiiizeeVxEPSig9N/orgkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eeTDxkgHc41ebughOIuTG3W2YpJdaKcZEjkxHSQ0MKed4I1l0
	Oj2zh6kvPvGlUORmK3iZe1h/sCZFT49qDOsNWUX2bRgCimBv3EQA/JBcmeVyStq9CGTBvIUvvlD
	tDmVAX5wt8Y0McxiXjQd1OJRstlWZkKljOTUriLBn1IeYhXWKC3geRh+kN+CGhjaYsqlBfq4+Rm
	PU6YVlwxU7F+Y8teuyJqWNqFYnZw/t72BoqWesAOX1g1lfvbAB
X-Gm-Gg: AYBFou01Z+vMWijTgRIAQZRYHbc51742+7iT+KaREAtUCx14gE5nBQ4Gail/l5rJNe3
	5LuCPjPVtCEAQdgJobdCBGaTq1Gp3pbMb8nLtA7r3+hLyZ1qBypNd3EY068HL+cqNyjq7Z4B9LA
	02l5f3VKo6OjCp3wmr7+0NmJTcd3Eq1wzb/foWVpJHEFq1HzveCO/VLzMeMg==
X-Received: by 2002:a17:90b:3e8e:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b182ebd6d8mr2253695a91.29.1794400680060;
        Wed, 11 Nov 2026 04:38:00 -0800 (PST)
X-Received: by 2002:a17:90b:3e8e:b0:3ac:a139:1b13 with SMTP id
 98e67ed59e1d1-3b182ebd6d8mr2253645a91.29.1794400679508; Wed, 11 Nov 2026
 04:37:59 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:47 +0100
X-Gm-Features: AclHuK-cqjptPhOeAZDAprp1BC5PiabrNZcICPPmo2aCEWkLiSCBH4JZZfu4Ecg
Message-ID: <CAPx+jO-cq68G+wnqjyaZ00P3d1SVftjycH00jiZ-KGPK-2nCYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        John Garry <john.garry@linux.dev>,
        Hemanth Selam <hemanth.selam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
        Fan Wu <fanwu01@zju.edu.cn>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Pan Chuang <panchuang@vivo.com>,
        Zhan Xusheng <zhanxusheng1024@gmail.com>,
        Rakuram Eswaran <rakuram.e96@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Runyu Xiao <runyu.xiao@seu.edu.cn>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
        "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
        "open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
        "moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
        "open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>,
        vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX6R3J8/zVDOkV
 0K0I2budBmBexpe4d3WhmnvmXGelB96lFhoikM3GM5vIux8ouIwiOvH3Utwy4vxyXgZ5MhEgI1i
 apcK5kQchdM/zTL3kl0UT88nQnjYQcU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX7xggVPzihWqo
 Ipghel9cKLvNEj4wgnZRpG2IYMEcVoPswGgwHhaVAFxFVJrdeaOMrs0YCeQL2YSnh0oSyWF7Ywb
 u08b4XtPFizOmd/SrcxzVtS9w3nC+hlIVs6yGZ4HrGVUrUSs3PXgXYQe0XXxOg6Bxz15mNFHxEt
 JuegDsYaY+wfG1JhPLKsCH8b5vlNDMo8YyRLJa1lu6F2+5f6549IgfI/5aAit3ElCk/AQ321GjV
 LOofEq9hzw0dN7XPYwo4TKH+7xPsMU6Y/RxH3LA9KT7RMgcVOeBGkB5IPm3nApS1sx2e6Ko3Yri
 jlCySiprsbRWF12JEhc+xJWAtzn3Dh3VH1o8ng++ZAwyVfejW4gHKWGI3gZmUr1dmY4fwphCESl
 v6LkA4Ij740LeTWVPLTF/HZPtgJzFInUY4QVnw/XerVXNpbdRPYHuua6dmA+j4kg80bAurojXaa
 mlabu6o5UwpvfiLR0+w==
X-Proofpoint-GUID: 6aTzddFVAppedPQb_mC8uKgEDKh--2DA
X-Proofpoint-ORIG-GUID: 6aTzddFVAppedPQb_mC8uKgEDKh--2DA
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af461a9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8 a=KwruqdAL4-zTymEPFJgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Mon, Nov 2, 2026 at 6:21=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across MMC host drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c             | 3 +--
>  drivers/mmc/host/bcm2835.c               | 3 +--
>  drivers/mmc/host/dw_mmc.c                | 3 +--
>  drivers/mmc/host/moxart-mmc.c            | 3 +--
>  drivers/mmc/host/mxcmmc.c                | 3 +--
>  drivers/mmc/host/mxs-mmc.c               | 3 +--
>  drivers/mmc/host/omap.c                  | 3 +--
>  drivers/mmc/host/omap_hsmmc.c            | 3 +--
>  drivers/mmc/host/owl-mmc.c               | 3 +--
>  drivers/mmc/host/pxamci.c                | 3 +--
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 6 ++----
>  drivers/mmc/host/sdhci.c                 | 3 +--
>  drivers/mmc/host/sh_mmcif.c              | 6 ++----
>  drivers/mmc/host/uniphier-sd.c           | 3 +--
>  drivers/mmc/host/usdhi6rol0.c            | 3 +--
>  15 files changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 98933be5f1744..de4ef7a675892 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1172,8 +1172,7 @@ atmci_prepare_data_dma(struct atmel_mci *host, stru=
ct mmc_data *data)
>                 goto unmap_exit;
>
>         host->dma.data_desc =3D desc;
> -       desc->callback =3D atmci_dma_complete;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, atmci_dma_complete, NULL, host)=
;
>
>         return iflags;
>  unmap_exit:
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index efd1903c3ccd4..9a2c995577d46 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -506,8 +506,7 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, s=
truct mmc_data *data)
>                 return;
>         }
>
> -       desc->callback =3D bcm2835_dma_complete;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, bcm2835_dma_complete, NULL, hos=
t);
>         host->dma_desc =3D desc;
>         host->dma_chan =3D dma_chan;
>         host->dma_dir =3D dir_data;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index ff0b25d287a94..15c65aeea8030 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -884,8 +884,7 @@ static int dw_mci_edmac_start_dma(struct dw_mci *host=
,
>         }
>
>         /* Set dw_mci_dmac_complete_dma as callback */
> -       desc->callback =3D dw_mci_dmac_complete_dma;
> -       desc->callback_param =3D (void *)host;
> +       dmaengine_desc_set_callback(desc, dw_mci_dmac_complete_dma, NULL,=
 (void *)host);
>         dmaengine_submit(desc);
>
>         /* Flush cache before write */
> diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.=
c
> index 28aed13549a64..15689717c76bf 100644
> --- a/drivers/mmc/host/moxart-mmc.c
> +++ b/drivers/mmc/host/moxart-mmc.c
> @@ -289,8 +289,7 @@ static void moxart_transfer_dma(struct mmc_data *data=
, struct moxart_host *host)
>
>         if (desc) {
>                 host->tx_desc =3D desc;
> -               desc->callback =3D moxart_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, moxart_dma_complete, NU=
LL, host);
>                 dmaengine_submit(desc);
>                 dma_async_issue_pending(dma_chan);
>         }
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index 097498a3f8ff4..e6271d67b6f6c 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -394,8 +394,7 @@ static int mxcmci_start_cmd(struct mxcmci_host *host,=
 struct mmc_command *cmd,
>
>         if (mxcmci_use_dma(host)) {
>                 if (host->dma_dir =3D=3D DMA_FROM_DEVICE) {
> -                       host->desc->callback =3D mxcmci_dma_callback;
> -                       host->desc->callback_param =3D host;
> +                       dmaengine_desc_set_callback(host->desc, mxcmci_dm=
a_callback, NULL, host);
>                 } else {
>                         int_cntr |=3D INT_WRITE_OP_DONE_EN;
>                 }
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 7c7c52d9e8e72..6a2b3e6d9a207 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -234,8 +234,7 @@ static struct dma_async_tx_descriptor *mxs_mmc_prep_d=
ma(
>         desc =3D dmaengine_prep_slave_sg(ssp->dmach,
>                                 sgl, sg_len, ssp->slave_dirn, flags);
>         if (desc) {
> -               desc->callback =3D mxs_mmc_dma_irq_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, mxs_mmc_dma_irq_callbac=
k, NULL, host);
>         } else {
>                 if (data)
>                         dma_unmap_sg(mmc_dev(host->mmc), data->sg,
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 527b89a5ed707..4e72e57d11971 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1050,8 +1050,7 @@ mmc_omap_prepare_data(struct mmc_omap_host *host, s=
truct mmc_request *req)
>
>                 OMAP_MMC_WRITE(host, BUF, buf);
>
> -               tx->callback =3D mmc_omap_dma_callback;
> -               tx->callback_param =3D host;
> +               dmaengine_desc_set_callback(tx, mmc_omap_dma_callback, NU=
LL, host);
>                 dmaengine_submit(tx);
>                 host->brs_received =3D 0;
>                 host->dma_done =3D 0;
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.=
c
> index de5a3b70107d8..ba60b81560fbd 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1279,8 +1279,7 @@ static int omap_hsmmc_setup_dma_transfer(struct oma=
p_hsmmc_host *host,
>                 return -1;
>         }
>
> -       tx->callback =3D omap_hsmmc_dma_callback;
> -       tx->callback_param =3D host;
> +       dmaengine_desc_set_callback(tx, omap_hsmmc_dma_callback, NULL, ho=
st);
>
>         /* Does not fail */
>         dmaengine_submit(tx);
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index d5b8a110267b8..8e0520d338c47 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -329,8 +329,7 @@ static int owl_mmc_prepare_data(struct owl_mmc_host *=
owl_host,
>
>         owl_host->data =3D data;
>
> -       owl_host->desc->callback =3D owl_mmc_dma_complete;
> -       owl_host->desc->callback_param =3D (void *)owl_host;
> +       dmaengine_desc_set_callback(owl_host->desc, owl_mmc_dma_complete,=
 NULL, (void *)owl_host);
>         data->error =3D 0;
>
>         return 0;
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index f8427f071c009..06483f7355206 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -212,8 +212,7 @@ static void pxamci_setup_data(struct pxamci_host *hos=
t, struct mmc_data *data)
>         }
>
>         if (!(data->flags & MMC_DATA_READ)) {
> -               tx->callback =3D pxamci_dma_irq;
> -               tx->callback_param =3D host;
> +               dmaengine_desc_set_callback(tx, pxamci_dma_irq, NULL, hos=
t);
>         }
>
>         host->dma_cookie =3D dmaengine_submit(tx);
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index 426308b73b490..e5ef3bae88d59 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -196,8 +196,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct=
 tmio_mmc_host *host)
>
>         if (desc) {
>                 reinit_completion(&priv->dma_priv.dma_dataend);
> -               desc->callback =3D renesas_sdhi_sys_dmac_dma_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, renesas_sdhi_sys_dmac_d=
ma_callback, NULL, host);
>
>                 cookie =3D dmaengine_submit(desc);
>                 if (cookie < 0) {
> @@ -272,8 +271,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct=
 tmio_mmc_host *host)
>
>         if (desc) {
>                 reinit_completion(&priv->dma_priv.dma_dataend);
> -               desc->callback =3D renesas_sdhi_sys_dmac_dma_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, renesas_sdhi_sys_dmac_d=
ma_callback, NULL, host);
>
>                 cookie =3D dmaengine_submit(desc);
>                 if (cookie < 0) {
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index efb4c7742fe21..18aca84834fb6 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1298,8 +1298,7 @@ static int sdhci_external_dma_setup(struct sdhci_ho=
st *host,
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D NULL;
> -       desc->callback_param =3D NULL;
> +       dmaengine_desc_set_callback(desc, NULL, NULL, NULL);
>
>         cookie =3D dmaengine_submit(desc);
>         if (dma_submit_error(cookie))
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 8bd9cdedafa4d..9fe49fa8f372f 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -299,8 +299,7 @@ static void sh_mmcif_start_dma_rx(struct sh_mmcif_hos=
t *host)
>         }
>
>         if (desc) {
> -               desc->callback =3D sh_mmcif_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, sh_mmcif_dma_complete, =
NULL, host);
>                 cookie =3D dmaengine_submit(desc);
>                 sh_mmcif_bitset(host, MMCIF_CE_BUF_ACC, BUF_ACC_DMAREN);
>                 dma_async_issue_pending(chan);
> @@ -349,8 +348,7 @@ static void sh_mmcif_start_dma_tx(struct sh_mmcif_hos=
t *host)
>         }
>
>         if (desc) {
> -               desc->callback =3D sh_mmcif_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, sh_mmcif_dma_complete, =
NULL, host);
>                 cookie =3D dmaengine_submit(desc);
>                 sh_mmcif_bitset(host, MMCIF_CE_BUF_ACC, BUF_ACC_DMAWEN);
>                 dma_async_issue_pending(chan);
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-s=
d.c
> index 1eae2f4b6c1f9..d75ac6abd853c 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -158,8 +158,7 @@ static void uniphier_sd_external_dma_start(struct tmi=
o_mmc_host *host,
>         if (!desc)
>                 goto unmap_sg;
>
> -       desc->callback_result =3D uniphier_sd_external_dma_callback;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, NULL, uniphier_sd_external_dma_=
callback, host);
>
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0)
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.=
c
> index 3bccf800339ba..8b2bb44e2f86a 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -592,8 +592,7 @@ static int usdhi6_dma_setup(struct usdhi6_host *host,=
 struct dma_chan *chan,
>         }
>
>         if (desc) {
> -               desc->callback =3D usdhi6_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, usdhi6_dma_complete, NU=
LL, host);
>                 cookie =3D dmaengine_submit(desc);
>         }
>
> --
> 2.43.0
>
