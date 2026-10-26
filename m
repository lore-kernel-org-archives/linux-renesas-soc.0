Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013035;
	b=ZaDgJcSsGLlhwB7LL79mQDPB5NSdoxhyiLEoZczHE1h3jRM/v8JsMk2Ja1aEtcOFIiKM
	 WA5jKHzps966INyp2PbL8nDtn+RZpTYut2ir8PZI7FK0l1C/vt9fYiJyDwZrF+uj+3GUs
	 7Joj6FWCyuCPOb0ODVLjFj+oWGSx7KjIbtIXsfSC4u+6k0V84Cgw7p3yjL877J4fi1qFC
	 4+hkmJtJsZ8Nsc4y+bjnyfIa9yDf1qbCgRhrzd9nmpKhbPUtChFG8BTgpZ0HaCn8PN2at
	 rKCDoYggnGySGYk+8X2LjGbGMRB86i2Ixp3qLsC98Nw2JS/BcQC45QBAr1BDgKL0Jxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
	b=YyfzKG+P84U1N3CNBfTdTeQEjwksgYh92HKkPhRXdudxehkhviw82BTduv848+WOoV+C
	 9N/pyQdi4jssiRNTQZJ6eBSD8Ohlbl2uzC3W5r1WDDfPJFP25tgEP/4AdYaUh/bdA2pYR
	 wFg1dgntGg+7ABGve3yuyeaBKeEFWMFn0zccOkEkaocNzyNcuo3SX4+7n1ezv94DpuFtc
	 ZExCduxzlCaOVnY7GSjChFvqwQFgHnNCND06h1/rQpBibT1AJ+ujZ/Ekh/HdA2wH6e1Sy
	 mwloVQXZwaBljgdmZN1LiIlWdyFdhG3FRfgavTGG6OC1oSbnTkEGfbC3h/1xtublnsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PcfRn/MG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilmu2HwX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE9D60A382E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE9D60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PcfRn/MG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilmu2HwX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsoxp2168546
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=; b=PcfRn/MGbVAXfuQ7
	zuREWbOF7ZIB8QlcwD/KDbCIEUoeG7p+WT9dU6U0lHPpBw7CHD9KJhgMPjXBnp6h
	RfZTfxM4vQGZM7+3gXb07mWk7JJJMFBiwdTqqjNS5cnBmRMhC18ELfJ3wiMBTGoY
	3yozE2Zy+QVDywzmszrEeOS9MZFS5j6P4ReC2pCgM28DF0eSBqSASDR4S4XRpO+e
	MQPqZsen2+iLuIAkN89uSuL/TIZ+320zVGTahJ3xA05P3hpjzwtk8i4Wh0HTXzzI
	em1LhwF7ZOqA2Ys1U29fiUiBSzr8wO4sCZKvvcLxiftqP7qiVcSk/ldu3jBwb7ca
	JfVhAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso728486185a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013034; x=1793617834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=ilmu2HwXYv5fKAVeX4VmvvEHQAaxPNEWJEp5wjjWBS6/8CWffqJgeNDhxLPxYQZK0X
         8gZ5wxU84IGDzsOtcOcrwVebIuHLxcVdCruemzr9+SedbRqJV9Winc8w9CeuHvZf4UtM
         NbobrDM35EY7IeORyCxLZLCDpaNGWZdFXineBmZDCaODOC1uCHxsnCj8OybjoFqX9mPH
         UlNgau7TONbYr775HTwjw5cMYAmdG20E3G4pUuu9MpFOlvuKMJeu7+7ghTLHW2508FHm
         kaPQeLAha5nZCm+3jWL3RrlcLWKJgJ9zDGzFZecsGH/l5sXonGlllan12APNoR/5oNhm
         jazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013034; x=1793617834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=nNCXzXIZJFqCqhGUoTLBHUYErRYQVgwL2RTo8oBabbCtaUjGIsJHcPWAXfAAkR+6GL
         +k4odZNVc9WOFkam1uKf7Js03yNYZ+YpSqRwAjUgrNuDohg7CILjTDSpz5VqtSidcvpx
         4XYCUt8HuULoDpzHm6agvIGT0y413l/mPgn04lFpff9z3SBiw6xrrJIMTO/VuP+I9PCF
         o6KJ2x5knDy9HSP3qdpJwrqoLxDSCZ2klWwOCtSd7VCmaZARIloAXxPFxLD571f0o+bZ
         sDlZI+ImjDb0b5WlxlYAisKWCmdA3eG1DLfhO2WADhnf8ESyHtQvEpiagZQHll9pXAms
         vx8w==
X-Forwarded-Encrypted: i=1; AKwUvBxuF7VJEGfI0fuY4ptJP/mfBQyVkTUapUwgv4PQq+8b0CWYZynGYs1YuC60E5F5jsyKEzR3E5Xlx2ZvhY9A4y61Ig==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTgIYZleCYwrEZ6d459XhWoAQ7/gk/SV+8CnhAzMhSdXtQxCM4
	NaoZDP3j3hpsrQXYDlyzxsNptWm+xiwvAR3s5Q9v7Vb/FvLisxcZp4zX44WZ3nRCRirielr4PjK
	XCnyy+TRFghvXdW7f/CyG/+ADXiebomWZdOTdH4g9Q/O8jy/zw6J+xySQs6B8ImHJXpFAye/9PA
	==
X-Gm-Gg: AYBFou3WmxaQdWSuASmV79sum4Z3L4Bx9k1TNcbjO0FmsKy5Mjebzb7uggM+NdfpKPm
	lauUvmbWCU10tAsOmSbuiblHE10HmhEigGzM3GHO4NXhViPeJR9I+g6Vxrwcg4jP/Hn2fROj4F/
	wYz7AvQ9j6U1B82WKLQPkJBuERpHfoH/aQWDSbM55CMp4eYHv1a5prO2o0xQFWhIUgqABe8QKZA
	RMW+BVxpbFaF9+kza9AflP5BcqhssRQveAwVtMgQwq4jydX7dhaUj6D76pqrGGH4R+VeVZeDOUj
	rtuXZalQC0N6YX6ieSlNfxJcE5Jh4v6RAFqcR4//rSzVrWIJuti/yIEfHMyqbVWKIB9M7poIZYi
	B2Kh1H4g9pQgBr645wfpmDPaD9e4sraYs7CrNSy+6pOR5AnNNoTSlOUrbCkVs+dZmtK7xwSe9yG
	hVjuafCmGylj2/
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965079485a.46.1793013033521;
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965073285a.46.1793013032997;
        Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:56 +0200
Subject: [PATCH 07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ULsX1dvjGix9WxOeq5OBXyIUsRBnuO1n1CN6kLh7e1o=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrfNQijBa4aGH9jIv71o3IUXgiKh0bJWRV+IrnWQn/EhK976
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq3zUIAAoJEIs8ij4CKSjVvlcH/iO8
 jYjv/HmDRrgNDbCzIBY4wlAdtIgGZlU+t9FDDKZ8SP6nhoK2hkukiFUBbwqQnTCMGhwHGeC81oR
 JVXvJKEJI/fcLj0DPMr3YIpCmst/stq61gz+KuqPdk7SI9OuOF0a2H88vkGOOoj35VT0rc6NCdW
 9QKlWwfZvnOEY9n2MuG076KGS2o5KXObwy2hr7i5FtiMbDhT+y9jXBXOVw+qvMBJyB0Utk3l+MX
 pgFkTm36QGi1diysTHh2q2sTPKR2zcgP0IIlrA5zOSzxXb6wCEfiKFWWPkLHZa+EAGdzpIvJYg2
 b9aYDplpVEOCLyE33DWH7DqvtUtQp6mqaFqOu44=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HlV-LUPRV8cubKUY47li3OQoR5mjTyJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0vgUQZX1VTgF
 vEknujy117LR7tuZmtNyThU2n1VnG5dKeG1AHOpvtyX/fetJ0VW5PTJ3jG72REhyZJBLi0szxa/
 1+sAOZAUI/DZj/sBmK8HSpyzv5mbHYheBPVDkVqpsfRmiwcsfqYp02hFrlxoWG+7SjPk45Incaz
 aIeLkhFBhne3exX5IQrxqC7ytqyk/D5EBTWZH7g8OSVH5063OHQGGWe50YscZXJ8f2Z1pRAt4G4
 Jy+MJmUu87aBQfgqn8tSmdoWl38lSo9i+/uvtJw38JCBWvahejQHWKjN4w8tXN7XbDVjim3hmxg
 gmf0OrAuZxtgtG2SqCyZmBRlvi+2hbalKWD8BlcasRNTOIEeCQstFWm7ZaFkyoKrlMXAgtfqBvv
 Q8Fu/6GbtlHQkYfUybIngFLSqnuELjzZvAOLI/Jgs+D13HM+HXTT2UEkABti7wL10lBpks8PQRg
 AhXtMXFGqO38gkfi6fA==
X-Proofpoint-ORIG-GUID: HlV-LUPRV8cubKUY47li3OQoR5mjTyJ6
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf352a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4//xKqy6QN4J
 MuO0GERuqFsQyNLFgD1+rgs9QeX6znC45X+YhE83lqTRhAGXPr6feT6pw/q5spj5XFRcZP/M8kH
 kfiJCqcgQBUr4xc3QJvEusQ7qcqAoaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 3f98eae9b6ac..f28840e3a1ed 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -67,14 +67,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		if (IS_ERR(panel))
 			return PTR_ERR(panel);
 
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
 		/*
-		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * The reference taken by devm_drm_panel_bridge_add() is
 		 * released automatically. Take a second one for the __free()
 		 * when this function will return.
 		 */

-- 
2.47.3

