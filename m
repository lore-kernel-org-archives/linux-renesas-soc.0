Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013029;
	b=eg10SdGHhR1tHul8zX9K1sRpOazPkTRpae5tv4hTD9zzkVmIccLLOiwzBF//rdnckDRl
	 4cMLQz9UAow/+2zyNia8oILCciR+dFYyNk2cuApWSMZBwp8UV3GQZc5ihAAu0QMmROZ2M
	 ihDJPqAy/tYuuYPfo+ScFkE2s6SAcXlWEGf4alGFbIC+IC6tGJAAjivT6AbrR3i0SyW8Y
	 JODwyy89x6xkJo+361lDF84YEKZAQ3B0/NnQ2Ki5D9YLLE6jkA3f3rnBydQA1XNR9D90g
	 zSYmzdXMAiDFMOKcr5AINikZtpXaMqBTVNceXTSPrv7BsUxQxqU9Z6H3zLtwc2NEskg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
	b=OeIhZlVi5U9mMEPeQ2uVwWNWKiyAMnTiQ5U0VuHcv9PB8E1RRNL3UZ4urlVcn/Oaq73O
	 nXh5CFVopOSEe9/we3BdQBfoz1/xAf7UvPsjUBKx1ApTFXWEjvs+I+HWvBy+MKoZ4fpEu
	 wjz0xUzH84aFi6Z9aJ5GTSQsrLue0OOwuiQyFvpkNS4P6zH17b//Ml1gzJqxWvfp3B3+Y
	 uqbDd0zMtRbiXbvRSNHC+ie84yhoUdNRqY2rs9QP6V1HG/TiBAOciW4MBKqo2E9NTtRz6
	 jlJtxXFjDO0dRt4nUvrAluoR089MRmenk/29QAgD9d1RpSj3hQBPrc/K+d+XF35kmCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kibrqknb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A621606A327
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A621606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kibrqknb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKEN2734645
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=; b=CFLsHc9762okA6Xe
	DNNLTbVLT51S7Ldrrqr0IctC6YeQgidEeOZBhhNsl/MWtO1jEhxkCkW1csJeDnks
	dEGBKqWdZLh3r3PfpcqHaTbpz6kbzTOqRpNhrtCstwQyKT4mtqeKmfyztmWkHyo1
	v0uYoWoNVrrHEdqPB5uqmvExLgP5d2rIjnvCXUlOn+JV8xbF+lLiPeOObjADwzM8
	2Q7fiH/fSOgpM9suw6evclkNJbrx8+td1GkaofdOifXgCla9rJ3/nlgs9I8Q+K6D
	Zk1gS+pDJXg9WE5kvCddsHyCk9zxUc1z7WFKRbXUOVbyLIGAScUrRVGqcQbXyhRt
	slU9eA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8b8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so656271085a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013027; x=1793617827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=KibrqknblpvPvPrchhOLSZdy7GDmQWEapicqAYlzr7JNxE/AW1MXmrfz8yzb3l/LjQ
         ZLTf2MFLGqwNaNf1TrsFoHinaEX1gNbwonQp++6ud3eXo9C45WfQL6KVYWHgI6eBrIcy
         cg1RETxZCw+cHt8SVNcwYwxoeJVktwCkIQPdHzDoxDDw/8MzCkvxFXgLG1ygESAeCmZ/
         QV3/udI8rNt9Bfmka3tD2LxjypAnnBIxOn0ThH2OWP/6Ey/2F4KsePj33nKmy9IiCjGu
         KKFkBt+g2SE2WXo1fuIy5LUGrU0fS6ALCsyx8KUfdJox6cDRL8AkZYI8aydDCw1KTQHT
         DrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013027; x=1793617827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=pWJ8QpZaOwyUYgwDccBTdWaUbBLn82CerzzkV03CETHT15bLazIHS5n53EnwNxTFeN
         Ri+7AcDVJNV37NeA4WTKgWY1CFOfOOgZWVhbFZBSlWOh0PFHEv1UcawDP0EhyhIPFgqp
         u3QOgib5ooX9pI1qMbodCUO53XKNJMlqe/sY1Dum+rCVgOicy/IBtgXRuiUAPvx9DvP3
         9rkf1EvGLH7YIRi51+11oWbd+5r8f0OxfjwtFIUKDKN/t0s048fxmD62dclTaocDAo61
         lphlz2A+VWbB1WP8i/F2qAhg6/g7lEJK6gE6on45S7ao/yoTW6OOBnxZoF/TmOS5FIF+
         1q9w==
X-Forwarded-Encrypted: i=1; AKwUvBwH/wTIGoeZBL2PUmpba9w7dpuBGf5rKO0OW1fGBUo6FS21jo/K8FZ4XV3uhxoAVVFo/19+CaOL8ILN49CS8s9Z0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8L8ZqXUQ0rtOnzb2gL+Zx8O+crepPO43Gf8rfrYZTvk0WWInv
	QvxL7swHHZkCrco1/x8T+T5c4S3AU9Dytx1c5t2BV/RZaFdV1wmgWX+iGA6Z+EKAqya7tv9KGkq
	fh36Kd0f9B4tO9M9V0Ainp6PgJ8wsZxbxNv7Ga1PNGkviDwfg2LOD7nhCFK5O7Jy7ne5G3lH4sQ
	==
X-Gm-Gg: AYBFou3GS0PGvLEA5gI4K5cA6eq1DKKL0NZIa9ECOG9lUogTFdvqp1NlVHtMcrxV1LY
	jkuW1xUl6SCgMsNOBirb4UOrHoP4aeVX0/SEOT+6w6F1uRd2jr6klyiSXsyC2SUriAka7zvWbrY
	QKigztfJGgC91/5fYH3BegJNhxA/5STta1GzTRfDbxDeH9f3sOAFapuYAVqm8UNk5C6pRpR4ag7
	3s7eY7jUKN4CcI1kG3TWjUq83rHKKR3ekLNT5+1ZN/AThLNNc4YZtd2N0o2jDdJMqMB6xh1oxGP
	n9BUsmcoqcIxVAgsvqFkLx3xSs0daZPDjakYK6Yus/aF0AZABd+rv44oJuogj0N6EZf2u0LDmra
	ULxPw6W37BHB8ChtLL0YkPPfWeEyKhJOK2pq1Gpvdx1jn/ganfXvepNm0PSWs5xRQBLFCXjQmVJ
	7lLFWnP08g9IMa
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878847685a.75.1793013027456;
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878832385a.75.1793013026763;
        Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:53 +0200
Subject: [PATCH 04/35] drm/bridge: lvds-codec: use
 devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-4-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=85YHjZ0NSZtOuaqrsrlX6K/Q2s50Gxv3BCx9uKSmNk0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUHQaGfB5ccHvaFcoPYXa+Pl27bdNQhbZFQD
 EINHRC3omiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1THIB/98urGNh+7LGcBXOGMeSCXA8j7jtuAjYNCtyogGq1Wgbt5YuIKgB2QYd7KnsyyIdv7g77C
 gxtAVLIC8OVYkdE2p8ulQt/i0j6QaellGDEk5S5npgvR0lqlvFjlwQOifUURtyY72RRVWkE7LoC
 W98XVFMsXP0XUKWriDGM1x6UPhlV+kCNSR5gfsqVsApqnoQsSUMvePhUoBFEK9CjRzOvPkmwM5E
 1VmboRTQ/GPNOQ0oLTM5IIqLUjZJn6evmk+ierH7n84183noH2qlgGEXO02qFJfVV0j9dJJSs8N
 EzwIZfX1H6kcdX8RaQP2fDm44R/fZkL5gChC6NBJ7pOarn0v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0FUfjdFmFDh+
 PgaMqPUhkVaKEF50Mp9OkkvMnMm2NZR0CWhugHXjGwlVnAYJ+xELIAUlnRQxvQNPZpz8o5B2gm8
 Puo64O6g/hiiSNfrE+Bg0wg+n3e6YX0BQJlfO+Lhd3946KhYjyrjCWg7VmEIkhWidXpUhc8ZTh/
 38anEMLVdyonq89Q2LoAwS5OwXIqZvYnqYfNiCCPD4zl4TTONX1UtRvpk8NC2FgYJy0loLQzGjA
 gVuShqH55h5j8WiQTpIACOEPj6aYp4PfVMvzpPZQksiBR5Qbi5YaQgN3P0chYbsbVUKo3x0TIPN
 BfNhcIzaWtzIYYSa9aK1Xkp0RS1+jy5lyI0/RPkEE7GNUHONlwgTh/ETK5C5RqYDJTRhKdP7628
 xEOVpMOKpu3Dt8kPmA3eFVcXqnCQvalMlvZFkzl7CoH93YbhTOHBZjH95MoCvTqfewmvlZboLux
 9wdIQEzk+AWk0n7w3OA==
X-Proofpoint-GUID: rFpl8998PC-QzsI28MTP1tM3MILNHdgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5RVXKHrKpv2N
 BGuOoH88xykzVxLHz2ELdM9Tptg6P3LqOxv5ws4CsTYoceQdVO/TvrVxLuhH3qahEdS+c6crcQw
 6hyvwYS7ul2qIZWyEqxGSfjB1To9qhY=
X-Proofpoint-ORIG-GUID: rFpl8998PC-QzsI28MTP1tM3MILNHdgk
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3524 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BDj7AndPpwv1RkrcsKIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f97c8586273d..d25d8d777191 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -154,8 +154,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	}
 
 	lvds_codec->panel_bridge =
-		devm_drm_panel_bridge_add_typed(dev, panel,
-						lvds_codec->connector_type);
+		devm_drm_panel_bridge_add(dev, panel);
 	drm_panel_put(panel);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);

-- 
2.47.3

