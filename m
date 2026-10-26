Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013058;
	b=W0P81v3C3wEJZyiDLy6mSCnO6HtzQnP1DKgOe/Q/IyMponyoA8cpIE0jGvfv2XybOjJY
	 TWr+H/vTEeWrFLOxiACFXm6IR+/G1iO6uLdzSxSSEFXKDeK2SrMlLoGbpNoNaWO8youvO
	 1iwriKfWMUDf6jPZkisG5Ler2h5a9pH+VZ1lpReJE+y4t0RZeDzhE6wRLTHn3Is0eiNU/
	 Ye9u4k3H0I/bo6v+C4PKgwgze1bQwVEXigHFZO81SCHrAim4nCwT0FFmlp43V7lDzkkOC
	 LvS68CnqZdXD6s6KRms3KVR3Zp8oakoZSUb8apuKqMbUNWB91r4rUUgfMQpuUmycrnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
	b=XWl60StbHY4VxB5pL0UYN4K4U7pmqwOQYN1f+QMEzeLeQa4jFZOHBP5qorGDX/DGEGnu
	 1+l/uy/e2inO7oC308b4ApdjBFOTwtZb2II40rMVBG4Y560PMqN5kfORhePkROtGBsEHv
	 hFQrU7FdS1YfB6ms/Gevug/tUrY4xFnJPvgmES7Ufu1ZxEazQkx23tCPrvqLlrq+a+FOJ
	 Nh+MFYy0DGDNMfy1pc1VOWNKErvhPV2XYBZGu3QHQWGCCMWdrMwpe+pQqYhv2wMU+dzur
	 OPIjiicka+3qaHl9+4GNUtdBA80CjH5/e2/px+kU57kkfKrKwVPnwBbU4i7wBGNhM4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/YLm8iy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VA633Tf7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF460A3809
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAF460A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/YLm8iy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VA633Tf7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsw9s4131502
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=; b=d/YLm8iy70QciDI1
	xsw5vntiBKVjy58tjQk1wWQ/sDVM8phUMfUO0fwngs5ZyPdG9qnRlebNMOtv0272
	94Uo/PKJhTMs1CmcIJSqzTB5hZxMnjMROVCnNqJGSFhUy7fD0MdpmuRm+V9pcUzN
	eQxdvvFRwwfN7zKMxK9ZsskkVOHVZZSGedoPBeuVtKbdQ48x+lB21aivDHe6GAEN
	IFruFR7LxogZWdq9fj1dYUlFSuUXrEfVp9gb4RpRXxNMAa5VCsjhTvEdnsbXx/nj
	wDOulrki7VLjV4F6KhSj4kpYi46KQeo0Sp8FkMtZi58Vv4lPBw18pvESrxwoKM9d
	ffC7Pg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q05a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7c17166so65535086d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013056; x=1793617856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
        b=VA633Tf7ZjRAexg3qyCTewVB3Y40fKaItZZQQ0eNSlC9k+RC3tc/gsQWcw0rsYhon5
         kK323YgtlggKR324VHGRiiwYL/EsjTVfhDMfFdBr1pQGK644qWHw/F8XvQj5iQMDONtl
         Nt/BI3jfSYh8esQxXm64aEJUQktuW4UA8/+jbML5oU1NB7HFDjsWrieBlOxh8ExN0U2T
         q+Bey8U0isEOMG4yATDqZg9VksrSuAgOvymy1juEmymHTwiHB4s/O5HgTO27aM9MoQWW
         ZtfEC/cOVexHqPazG0u271QmYcAceASZ4XsZtjrPzxU43cvVYEsbx3Zl/t7kJICLhKwh
         FWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013056; x=1793617856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
        b=YYw5gk/k/9yEmHHrNv7Y802WBMjcdSJtnKKcrcUrLWf1T3zST0zmMd8gUWQ7nxH6XX
         PwIseo7nAt3zriMFL1X/sJsK27towPS8oHjh+8GWr8Dhvyk7bCWbqxyyEC3yM05K0T+v
         Gq+B3Nh2g/OaUTkY1/3AtX4yoxCWBW0xFKTxUIC6O5N2p29R6u9rU5uYb8rkZMVCBLxW
         oMhAqJO70zZpvIFJfg/cikCGKC5+97pAlIgSHlnXrak095mG649bWgNUp00p8dlMSX/F
         ipcNnN9PckHBpZRKFX2UtjZTvs+FSUsoOc4DuT71qOLbW07MAyLyxNT+0IfztU5boh5+
         0GUg==
X-Forwarded-Encrypted: i=1; AKwUvBwpQnlpk9oqPRcjQQdAFZ38HA1Q/SNAiAMZ8P914msAW4dPI7EI8xcI3sYc/kPLh9z0sVMuCtQ474UnfuXEmCg7hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqZJMpcH9RRHBogrn/lMYySyldBG986eIwylEujH1uJQM7Gqp5
	++DxDcR8NwwKYfYz55p/UsQjL66qLeSN7MSoJSEnDkQyh/2AqSfj4GlftB8FlaQxvRzZMQGJDhl
	BlpJEf/BEAXEw104VJ0oyW+ZjnJ2dkF+9NCqG9RqD+LR+Sg4QN8CFWEkteCRlaK+J2i/83FfWjQ
	==
X-Gm-Gg: AYBFou2AQNOogoeAsM0fqU5/FWCKH1dZ4gEdbI+TPzpI1l8J4hjUrAgtGlVzFDjyn5R
	WhODZLN0O4yiE0BLtKf/0ljRG7wCnpW/S3/LlEH+ZDMwx7juNrAtWvBdR7ewKLm4aAO4LLIyIAb
	kJ25SV6kGfnCTcBwe+5jM8/R7n0PDonRJ0WIIh7Ed7My5Jlh1XH7n3KCEsgx4uF1dUDN5l4bDfl
	fULEwLqkB3CmtLkOZ8z8H4zSWwbacLLPq764/wJMkDrlD6E+thrSU8TgO75ERWzllCq8tEHz81i
	KjFYeAhWVjMkOk2wiKv/kWiFIHuSO+FkMyQx7X+KRPuiLm2wzY4O7mbRclRp71vscKHvdfPHR9f
	Xvm8i+UvBuN5irpwLB+TR/zy7iiKHHyErvsAX0YzCZvUTgAh0jrmJKZBirNcAQd5C9kIy1PxKdg
	1J6uFipGywMkdS
X-Received: by 2002:a05:620a:17a2:b0:93f:34b0:4880 with SMTP id af79cd13be357-940ef9143a5mr985779385a.22.1793013055832;
        Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:34b0:4880 with SMTP id af79cd13be357-940ef9143a5mr985772685a.22.1793013055334;
        Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:04 +0200
Subject: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
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
Message-Id: <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kJJulWe9/CRUqjDC8d07GB/dA7Y7k7bAfXwncPVPNF0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUNFrhKRJ1vs1GyUehHNBtb9FlnqJoPMquu8
 8BkmoB71QGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DQAKCRCLPIo+Aiko
 1cqpB/90Rev4Ra9vC2dyeOIrhnPoNQBSYBLQ+4cBwkJptbtGfyOsJEdf36WL78sBupyXy7mvm70
 mOZiZb5Q3wQEUFvvldaq1SinnSkM4ZvLYA54YtJe1e4afUhZf1zdxxxN6uzG/nzN2MtX4gSeIko
 27jwwr4T7EZOInS4vGyl7UvrpyOVrBrxx4Of47Ux+urG8HX9CQPn65jITmKLsR4Q+mOYk2/cr0v
 I5mHBhdl6b9iwkCJ5w9zK11X/Jvpm5Go095HO/8NURfhBKLsEmjAFaijW38uz9L/Js1zRLqM/vp
 BmmaJ4tz4ggA0u+jYpCBNPnIMBEjR1IObkJrqpE7vpMy82Xe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4VC5bHzcTAxs
 PYFQu7Ws0IsaM5AObJwb23WtKCZgI5zxD1lHyW/pqA1C6Qn4Qymge7qwmKPWCyONKJviIwPTeHJ
 qxbQeh/cKElY6TF5APwjZpdVBHjMFaw=
X-Proofpoint-ORIG-GUID: baU8rRnzfooBDpOA63vWUbdTm8Fk7Yon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXy10Bcqf4klLY
 8WieiSXrD5V5q/Fv/8yZY94AxrLI32G8OHuBNzhe3p1S6pSfIRsi9ao0vT7SQCN8qVkaNs2F+Bp
 3tBuAAmJRUF+/QaCxs9DRmNABIk69qpP37yx8lHQ8qlRyeVtI9dKVcZeDeQ4NrcOj7IS17h/3s3
 TKpGDlFMZxfbvHC2eyqhE87nUublQicdBm+qCPFAK2VHc8sSJedRsIKpdFg2cFnOsl4RvmChkws
 TiBImMuacRGoBkCjeeIXjn2JKDH3/zLN2nycaBs9Vcz736j7wP5M5UhYoA/KjbjKkQWjRMbHlZ1
 UHatvY2MTzUv0bzjjylpWQnOCj+HxXRD+um4MTm5UOGXYpRJCZ6yMoermOzfWNpkaB47KuFtNzO
 710OuItCc534b25OPCsSYtJuQo7ythPlAXcgXpTXbu6rbX4KO1YkYmf6aTPd/aj53frhLr4d+Ib
 sHnxjT9GllwAIKzDvmA==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3541 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oT6YcSNdPRKyStaNtX8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: baU8rRnzfooBDpOA63vWUbdTm8Fk7Yon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 407834a03b63..91ce1a877bf8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 
 	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
+	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
+						       anx6345->panel);
+	if (err)
+		goto connector_cleanup;
+
 	err = drm_connector_attach_encoder(&anx6345->connector,
 					   encoder);
 	if (err) {

-- 
2.47.3

