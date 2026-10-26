Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013046;
	b=zPCzc2FlOXv0cdFiEgmTRpLSMDmkAlZn1NGzQ6gxG8rZO2OVY5pvgSH3u0NrzSrPKE/j
	 2QLwfE1Will8mArVRVSFsSW53veB3gwcGMuqcu2hv/DbRLakJ0Uz/rFd7MV5d7S28KuYp
	 Jq0wE8SdAyRZTjV8Pok0VCcGTIGYgGbQT6B3DAlfjRLzJtkepLTsU0L2Z8n7s76Ye6C2U
	 KwR/stO4k/jKPsQ07b/2f0nUWl3riYFGJBfBijcLLL1VA4dnJ9f8h52mLUHZJbsEDiPwv
	 eij3QyQUy4bOjN6dXS9yMiZSK7Vdu6XC4iKxHZtfFa6aaEkJggXp97Q14fakQG8pTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
	b=p5wX3ZiVR1bR6hevbo/bCwCcjDgvFJy5BmBy+v+o9itMdBZVqinqR8250T8rffyHshyE
	 7YP8+SULz/qJBPHEAaCv/csFlfbOxy3SnlrUVhaBK+I1oyYhrToEKTkjLgSU/7WwQ3f/a
	 3A9ZKkN2pX5R+VSx+ELQNRHXAeV7k68wnGOoWnWla1W91YW0N10kyXZjKWPtee/kbkHLI
	 pqAg1QNOT1LJxlYPNkF029AvnFekZwn72pqOPwuyS9H3PqvD4UrbR+CPWzfK1dVKNHpXf
	 80TzO3TbSTDiE0wFwhrqCKNDsNma0jqLSciM7L9OAhOJn1p4BHQxkcNH06zWz3LPCFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0F606A97B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C0F606A97B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMGO2009925
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=; b=F8wy4+CX/rG+lfZZ
	Lyan3IdiIs/84Gys8owEbGXfJk34r3CcF+b+Q4mmInADgr3eWsRbVJRNoe3mwtZs
	VsYyArKxzDCzwHEmIoYcnByfO17CNPFncRW770DuzziCcwveti8XS2tC1/lSLo8L
	VcYAwYtiaXmUyJ18o38o6ju/1YtKbApXJwjhwyMJoWlo97KMrZIHjSOUWj3ce3HG
	HZDtvZAaUCdsdJBDdPPY/mjwYQldfdKv8hWGKkBABkHzpGCi2uBWHRuFB7DPdLhO
	lmcr/DgeJjlEfhQ+cH8SDfA7E3E5NMHxb7kyjKXT7eh06NVWeuu1TbmHvDH7JPnV
	0YuW9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x2sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338c215ed2so54471021cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013044; x=1793617844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=YVVtl2bznaS6SS/6vFgSQ4UcYPtj9oYp4dpt4ZjdigyQRHpLliIRvsXHskjfP63DCP
         xciX0bYC/xaMMWQXuCIX+dDlnG4bbC489vCTX3hRHxBeyXslpBVilJlHd83yoYZJa71Z
         3VGFcMeJRln+IAfQ0AVkrHe9PzNBVd92IfkiYoIXDGqNzo2DM8W5TYExi+Udk/CsFyPR
         HagYl4hlP5EqEBXfiK4aRvFSCLgxCL6Gk/6UsRQ2kceKnS3e11lCBM1bJNkyCw8bPNrd
         Z83HroJnDQimLPMvJNh2noFXLpU/mchaZ43VnM6JFc/O9uRBQBQxiYifq9o99mkysoef
         5+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013044; x=1793617844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=wDSlQBUxTkJAustJZs4ffjptQfak7D+woorUr3RDDI301QcHsVJk2bmC5fDW0VRBok
         g4KaUQ+NbSjCNhZxqfz6b6V3ZJk/tffDd+6WmcErNVfh4XO/JYTX/Vhqqo5qmcAn9Y8f
         dXkhLmvTNAOTdRMsPKCPazWIru54VaPpOTpK3YGkZoR9O/2EyrVVoSHXNWjEcvFffa4K
         145kUUBfwbM5LmDszb45NoGDboJNMMJeXaoo4VVlYcrwE/W8hmjXKZa1o33h6wpHUyxc
         7DC7fV7eCOvaldW68FB7w+7uDhCPiK/C2T4MRlDEP+AnDB0FGyitHG9RZM/QjaCVXyfE
         COIA==
X-Forwarded-Encrypted: i=1; AKwUvByKHvWPCHgloQ93mSSqpUQN87daUUrSIyIJ0qDduBwCd+8bOLjiA0q+z2K1wyvcdw+XiUwOQX0oTXLrW59ZIQp5hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYILZdzIbx/7kRDbMGWU9qZxw3R52edGu26eFpXSL1K74iC8x1Zd
	0AdMX5TJQQX7HFWR/sH+ruhDGGDqfkkutRqiaCUS8z8tm3jLuoqyhFO7d0ISp4AEnVzWSylQFz/
	9aNdkhNsizXcv8Sh9qaSFCYt/LC09yUZQipQbRpDnsxFHlE3chzsJWkjm9roekigMLg4Zr2kjtA
	==
X-Gm-Gg: AYBFou0TIyDgVVzPrOz4LTMG4iMQxpbuBhtFq8Cw5lJRTNQTlcK3E/ez4op2+0BtkIW
	7s4IRr6ZiWMoXhsmGYq7danEhGES/lmpNv6WRCdAYVKNnMy6HIx7AQEYbscx8yrYC7jPGEaZMV1
	KP5W9lUY5hTVmjULHdJUhMtpeCqOd1FnTFmPP7IsWEeD8lOA1G8BY8Schc43xqoBnRG+f99rHFJ
	pdaW05qxXJSPfZEYLKLahE3mqUqnnTQRgCkhTIUFGI/TSj0k1L7xMfQipVcBx+t1gvXvjcAM99M
	T2As8QzhoAaf4p9jeAD3OAfr/lMmw6lHqQtBDO9ydiGeE7oTv6ghmeDN3ck0bRUkyr0mLKw2ewM
	4LHBjpHXoB8tc9rEYnB1rCn7/8klICLXLbHsDdNG2IoZflJySOvMvEk1nHsYw63ka/5+yPNc649
	mjj9p/0h944M8g
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820051985a.60.1793013044039;
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820039885a.60.1793013043412;
        Mon, 26 Oct 2026 04:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:00 +0200
Subject: [PATCH 11/35] drm/rockchip: lvds: use drm_panel_bridge_add()
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-11-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuuvMuByE/5au8TNoJGc8h1xnsMCd+SMeZ7MKGuRyyg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKIUVSRGzZfc6qYgyaD9nRGfx+H/7o4CWdk
 wQOpg5J6z2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1QI8B/97uFs9wHHAcLSj02SUi5PXzEJMksmcQ7qKZIjNn7GfH8bLoBKSFnfP49YqCUduisOEhT6
 KTKuTU4S/KuVHEJBZ8F/LiOMPnVQBnq0NiQhbfywWC76Ly4pg+z9waoN70q5DcXEhbaE9tDRkX/
 MYkXObslKB4jt+l4aynd9Jnr6SEAxi0/kA+2541TxyDmriKD+P5IDDweHYYyiL0PKyYdNKx3OdL
 ZCouAJsrqTPTCfki5i1Jce4Kw4n+85mVUI4+LTmH77ya3K5dNFMJsfHdvnOYkmDaqyBghuWU49H
 T1iAXG1ZbmbO7m6dyfFHITSkUzX8Saqr43Axoe2knMHnYoPk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf3534 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OUOeoX45vkrWV5s-CC0Uc0ZK9ASMABPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7Jhn/RLQ9O3h
 w98KFDrtZnDF86y2E4E92JCiAyXNlkNbKAHnppbZTIJo66JbepD5jNN9r0DxVfCGWplY29PrJkz
 IX9uS4ENEsgtHyPcyXgMd7adEd7U1Hw=
X-Proofpoint-GUID: OUOeoX45vkrWV5s-CC0Uc0ZK9ASMABPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5YN8553rsbsu
 R/mKc64Y5NfPkARmolGeoU4MkNJ5FjYdgErbM9C0WAagyvVt0BxJcWytPZTEhqXBjWND9K968fR
 /BoQXwJkIb+0NchVpt2YgePXq39cSInW8XAXHnY/2VlIzYmCIVzq8eG2A97ub5IdchG6J7qNkUP
 Hlgc09E6bE5wl8Rj7EUGdUScgRyDmJAxCUKQoEoXSkGw7HvC+hD12B4FW+ORvAsbEwVzElEDmzf
 eZZ5Vtsz2gwsXPWtyq9Iyb+/gLg6xlRUsqgNAlfgXCV7ZpnkxhGdUQHTjZGRbVlCYYpYQj3Td02
 JQeFcp7Bo1cRUeSkhkvdSLaFbRG3Q3vgRU89bzom7vmo57o0LuG0Q0SEk7Jt8UeOJg+BnIPUbLA
 F1YafANH4qvrVzKNKy687UB8GUrStqRR/QwjL0OJ9+bMD3XIGXWnFD2mPVcueSkqWmuqophstne
 l/w35GlOgypORWo8BJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 505c6c56736d..d49870cdf906 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -609,7 +609,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
 
 	if (lvds->panel) {
-		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		lvds->bridge = drm_panel_bridge_add(lvds->panel);
 		drm_panel_put(lvds->panel);
 		lvds->panel = NULL;
 		if (IS_ERR(lvds->bridge)) {

-- 
2.47.3

