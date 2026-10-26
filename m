Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013026;
	b=0Appf71BvTIVp4FejoRU4NuPosKZ591fdp83OKnCsaQ7/aauyoy21kb89Z4w3SCtaxro
	 ZQPq04PFJ1IH3iaM/n2S25OiuGvaSH882hQ04ViSeqUlxpMWdNWI49SRyuyHBajuASpui
	 88Pi30COEuRhOP4Eq2b/izhOyMUTfIqik9entB6dm0pJMzzOwo/ie260f3eDb1nvvCRY/
	 UzOprzMXI0+6OcFqusjHfiVH/b+Jm1P9uAuSrbse5UL3ZuPOgxBoQimeeMFX1Qrdp2xJk
	 iMFcwhc1kYMWQk56DmHh/+W172pkfNCHqN8N8zwKf/Dr1hdkchw812Z/y6XQwbk8njw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
	b=S7o4g2WjyEUqiBFMrq06mDWBt7VQ+OUSQu23qPQ9U6VoRS5R95F4ua7M6bYpU/CqMTbK
	 BcP7LEmIhoyH+lD0bUZsJssgqaoEkx1jVXW3RcyhBesuLTM7kqflQZFnKsSkUIBXOkaOb
	 yj7HkTaTYYqrGbVKgWrxr7GlXovXuUeYE+FJfT+u/Ex1gEe4+39ALVlXAOz9vfRMC5BYX
	 75/h5LMHNx0/QjGUtdcTzNU4zbt+Yff1Wt8SNPALvEK0bGQZY3VEKcYBa5vEjdbm4Uzo3
	 cmih6YEhOINavsUeRyy55kPvx3K4u+vgYqvdbD8YBYt43U6Qlpumbct88hmHItaZ0uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXqHWHsk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA8606A333
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AA8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXqHWHsk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtI883085625
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=; b=J0YP207Vsr8a41lL
	AjZTyKZDrAyn6bMHQJEp6Ht/FIehVV8eEF5YoNyoeaCmc+rNObWKjQv04DCUX2Cl
	VzBO5vsuY1C0jjwasjHYfSjKhp+pYBppemRDlZLoeyl4HiG8CbqT5feR0nzz+DT4
	EXdRZ/rt4k08qFVuNJzDRn3JQAYr2ZH/EkhSsvcLfrueanalun4EA9pfys3hT+JN
	cPyncc/64E8luL/m3DfyPGWFUjze2XB0vIJ5q40Hz82xHoa0llHpl5i0Ghdq3WZ7
	RmliTjsI0u41dBQAdUx/R/Q7iaj8HSOhMQhLXhNVQYIAju56QTXiXiaS6x8FSj28
	SDLxZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p27h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so564915285a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013024; x=1793617824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=PXqHWHskL5t37KGyi537IFjZC5zP+moJmRLXi8jb2O5NDpLiNMA6pM/aTtPxJbbhgO
         mc9Qy96589RuJN3rR8ST9ec7w7QJbPKlXp18LrF5mpERB3pVNKxRSqNsTNQ59Nw6Fp8l
         ffP8VQu1UUiM6+lQ9AkH/nrN1Xnaj1XH5PKaOjbSuYMDdCg38dmoyGghhzHKBOY963vr
         ZSkPiCSOKudxy1nad/Qf49BWkg8Vv0mq8gmuAtIcK48wHkPxQLE4wRTEJHc3U0x8e2rV
         +IZ9ggRGHtmV7upXKQRXpcUxiidFxvbrnXTP2n7B0QrHqIG/QEqQ5Li/doXV3tmitjMR
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013024; x=1793617824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=thkFQgcjp8vLdeOuclIBQ+z4TOgoWiwEBTkqyE0RLQhAzam9Dhexg9UghmcDUGV0i2
         MW57mjFNG+KlMgdgXOnio6b6V5qNuAUXXl4hfi7YSfhqX+cP+KhzIqL98mKl3m92PnJY
         r0f86nPi9x48Xky1GY7p+f6rEMjOM6Lq3kz8DbdYTxensv/ZjFnj1tlCRPEYu00v6xr5
         uhi2Obk531vcazel98YGB4Q23e1k/LqQw8WlJI0fu26RqH33yjEpSSMF2B3S6bmV8MtA
         s8xfVU4+npDjVs+DiR7GKCRPeM4n+50CDMlzfgx83WvpFQY5eS+AsHwGFwBr59454eGg
         gnmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq09WIV0TTbOi5l9CZ1rdU5bdPseRkpd6yvXZLsPGKxlpiSCHURJsjtQGE8/GQgkcDbxHhPTaqKV8DcVCcHa4Hzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYPe+PEu+CzoryorOyEUesoKLyatZBuhq5q0NMjm34MwBdoUcP
	4yHwxqx8eLRgzvleD7Rw0/8xHShMfcrIBQLpd+Tzm+LFnL7jwGUNJN4K80MzMgBzJ6eLHj4MCbe
	5CgHpSlJNq++KR0h1l4/C0OgIiOIA2DHQYNnaxxb9u9891Y+foZHhENPqf4nTk+90aJCJsrBI9A
	==
X-Gm-Gg: AYBFou1LTImGTYwVtImVEuXusyJkOLCYQOTk83jIZreuqaMTkuFtmyY4vBIIaNqkQMa
	FcZVJ7RIVlbH1gRuC6OewDvqgqGxv+qHj97MGkMztjNDdZTOefKN9HDEQHi7+vxKe+lSLoWBzWi
	LNC5LAwnwZY9UBII0BFV09h6DdKNSGpmAxZhO9YCEcLON2lDzPeaHv9teFfFXzfRwJlV7rYBG6e
	rAvZiVftucxRgN8tyeo/ykdVN7XGyVX2EcnMeRoZFmSOOxUMz8N3EL1k8l8Z4zdA8iIYcE4DMOI
	5JI3N4e73IWCebkDAd2CuxGBsLUyQEAiSevVkzimEO0P7sJjfn8eUreArbzHCxgdByZe41gy4P6
	6O7ifSW02kwGTy/QRKWEmg1ONMLvAyURlae30VOqZIJi4HCCpaPO61HmNtwvhqKP/9eSWVgLzei
	UQRtotudmDOv4X
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835901285a.7.1793013023187;
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835894685a.7.1793013022577;
        Mon, 26 Oct 2026 04:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:51 +0200
Subject: [PATCH 02/35] drm/panel: remove the unused struct panel_bridge
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
Message-Id: <20261026-drm-panel-funcs-v1-2-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sZu+gCCAPK/+XC2UapLGIknKvJV9j0SOSwR5V3S29Kg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGKchAASinmtwtPvMmwc3Sq3F9KCOYzdxgN
 pt0G7G3yiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1Q8ZB/9UTlwRaNEBaGZxc0IwmW24VtC9wkBG+oXCJSl5rdTbX9zSnAGHOPU42S8Nlb1GuDWUcCd
 u8AC1Glm1GPXlGJRPo0AbB3a7ktQTdDgK6JaD+b2r9Hoc47OdhOBGIVXM4vYHqFgZiSHqjhnvzx
 Dhv7BjRRQ3C0W/HD15S/GIPnlNoNiLX5I8xbdFlTSl6S5wJ50QKkOO1Mc9a5yef6o+FVeOZDDE2
 1OOg1OrJ+lx2dkO0aE0ZEz3LFOlpM1pJsE0AeR+twAepe3OIl00+EzUnqQKGESS355y8wohb7lg
 43i2QjbtSdWp/qaxCdogJSgBLYlMQGzeD9sI+8HSJPnUZO0R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4gasMXT4dFlBNb7ZGmyEBlbUMcdQhRrb
X-Proofpoint-ORIG-GUID: 4gasMXT4dFlBNb7ZGmyEBlbUMcdQhRrb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/3iHeR1wY9BX
 H5vXt1XsKXdiUgjPzb1WgDKBscbWCPbSUDYBjSazhYD+wFKKrJK5wTYcQbI/PFMfP/zjVhqIDF8
 wdSZks24spZIPiTr5xrwMXlyI5Jrjls=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf3520 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a_a0KNV-W32lKMFKthYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX30sy0t1WQ+0i
 sIartCvzJTlkjsbL5CqMSjzxKbdXABPgU32p+DQGuLnNTeGAF45VlGt+cF21oeLMk76ERDg0kEl
 /w9/yBCel/XNWID/1mqT5VhOfvG6hyJI9+fnT7OQvdAzbv7mO+Rj7EkyOK/jfTP+NU/Cp0G1MWt
 iI0uIxF6XwWzVl9FLFU57q+8QOYypfTy2zpJzm8Ox/ST1ErGJiEBnXY0urvQtK5V+AaAUgNamPf
 xaCVFmDCdlCNwJ7/ZKONNjd6VIvAGyWPIYSo05RfdEYfllblRpse/9vHBGrahxAZePoHD5aWxxl
 UjtHqOXj4gnq0i5foTvzDgx4VSMiYlVuBGIvbOIluycuGAyvT7IfFI1feBCxAQdgtqFGx5HvOv9
 A1ZFK6Tm8s3RBG1AAITI252HC1ElL+uw9wSjenDZrg7GaLe4zJprZLDuQPEVL8Iv/cFdRZKVvOF
 xe94Mdr/ro475LeY4PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The bridge is embedded into struct drm_panel now, nothing uses the
separate wrapper struct any more.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..268e655140ac 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -50,13 +50,6 @@ drm_connector_to_panel(const struct drm_connector *connector)
 	return container_of(connector, struct drm_panel, connector);
 }
 
-struct panel_bridge {
-	struct drm_bridge bridge;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	u32 connector_type;
-};
-
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);

-- 
2.47.3

