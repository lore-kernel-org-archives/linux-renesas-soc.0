Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013027;
	b=ubknxzz4WXC90K2ZxeJfvUlhdZjoCxvH+a8z48o9LnYtHgyjBeo4Gq4GDfwee4XA5RFJ
	 DJnjsVE90FFGy/PYoXxXvGEWj2GWcqK5nolUPflxX1IYqysT48/Gk5abT3ceIkarbX3Km
	 dBeEHaoOzV4i2Hak+pEjcbMq6/fap3ouUqmG0aSErZi1UMNRIUVhCqllWgPh/JR/5c8Iy
	 giqY4wdyMU/Zqldjf5bM38hIPY73nMqy02hzJwt0zbt92KLzV9yB/Hu+vQ/myOFh016Pc
	 l+A7+3xVedW7pU9wOQs7WXOJN/RhNT/KxmYin2HXE+eZHfn7HM/w0pucLjHvLVnGUjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
	b=mpMzkZOd/KY8lgb9J6KS9tNsKUCbbSk0H0kSNHsrJEBdwgQIGMxWKqlmeqDT3yXkNfDU
	 Wtv55UzEtgm70ktHVVDpQRfOzbH/wOpQkFL1dZ/wBDYEoW2J/oZkW6fbgFz4OQmt/CbNk
	 +tccH+0kki6F6KXOyRXExvX5t2iONOsas8Rw0JTC4Rr6YSBHNLVxruc0rlR4KvsFbRoKg
	 JDD7nSxo9Jg3FPPhS4AwgR7ay0lW+iIpozXm9UQr98clpuSV72+iSU9CzWgTbTNvsNqT+
	 KOxXeCsg0g8TZpFAbFf4mX3MiSwlQ3Lx6zFmr+MAGal+a4g86NUlOVSPx5IllKHi7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oa1lIdf0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7CA60A261D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7CA60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oa1lIdf0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9VM3049882
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=; b=I1IVgT0jmhAC2asb
	J2XIZ6qxrePL3+97AuF+S4wz3Lt1dXjnZnF0T8sPuCfcUhoomUFYogeVOEyDrRjq
	+DJ31F/WW9Bj+SGuYuX/2kwO11o+3AK0FPpsD2WcFjdHo9/oElGoan0t6iKjoiIz
	nn3W8Zy4qp2I4p5sCEnh9f1dVeL/50uzJwn/LiQc1i8g6YO861aLZXFv4gWBXtNK
	acuYl5CXhJjRLGL+pAn/xd/9MbV+xu5JL4VrmXhd/ltSPAEYR+dVj95wmuXULgbN
	eA2r14pxbl+bggXOXXMG74BnntY+l+9tKi6SSQxT4o8HI5QHK8bFLjTLnBzGbGrJ
	Hd55bA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338c215ed2so54465751cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013025; x=1793617825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=Oa1lIdf0d7QxTx1LX+dPpjLyq+M5WkCGdxTQ7MhPvbo9Mx9FrFeYdzm3r1W5orG6WG
         23yf54vEYuD0zHnNICIYm/OVwRZwatuDiFxEOMvyj5hFu9DgXsYxbHHMXFWYvq+11SXm
         LyQuD48rNGT1B85CfGKc4qBsjWjPeRJ8ZohV0lASt+rMKZjqqrEK8R2qGAySETv3UZpy
         7NL8W4O259n7tuueM2VqlsLIYP6xSzLe193vpZkILmu/0DqG1qent0uyTQmasbYQ+AJS
         EkRnRBNAq4y+DfZEZBdRO067YAns8zAxyjxGFCMm0IiTWRLZddjZHY6F7Uau8vzLcaCE
         IsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013025; x=1793617825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=vvmj10hUKk5W370MPAwAEB0HnhxEnglz0cwSIGJS5tc1+O1vayO2ms3W5KQPJvzvOx
         l19NG++BOxKX0xCpVAehww6PhQpKbEzwV189njTmJRcsst/u5S/KZsiqZRVniLhYUxwG
         16Qd6Ve/oWIoadAsPv/MikBDTgQL3vBrKtJ55OaKpzqcF5ot+UNZOvIbeAfQP4CpKqPA
         N7Ce16U4gD0S/xIIshECG0fHQqkUEaRu2pXsBnygdoE9cMv5uYnOm+IIoBCZBXDpFWyB
         3bnAwQAPZRxN+MRgk5te31IVHk6GNPzoFjC0x7jqcPxXQzG1J+BXLUiMjAESY8PiraBq
         hgvw==
X-Forwarded-Encrypted: i=1; AKwUvBzl1aP8/haNfIaIIOJiElmeZ1XfPdA1TMKaG1vxO3BK++vBXbn8kDmfCaeGfXDTqAAn5lzJecCbIe0keKyl68q2eA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqRiGyrynJjWZlsI8tlIT4xTI1f5AE7BLmlTSZkqWmG1qumO7u
	+jDdUptCUFbt16pbaKYxLVukuvCB/XOTs+sLXPXdIVfjmuero+tK5CtAEEiuq2QuSEXfIGUVMoM
	5GgE16bMFxPKJhM4OO1XbQL/ZTijtvE6y1pZj8dbzpQcwTNjlnh7XoUlr9cX8oHzw2bzdeZdvew
	==
X-Gm-Gg: AYBFou35oT8jAUm7ldY2jFiY8lq6jiqD4meRgClneFkCfrgYXdkccxPj8qkwHEpG/bB
	mQHxau3uIcDL7wfCkhZod3dnp8h9DwiuP2FOBMc3FqA6e5pUg/bvdr3cTR0alS7stqd6JRHQP7+
	glBv226/0lTrzk/X9m8n3qhzfbg4LciZ4zJb876pCUNjggIz0Of53uOxuHy7HzmFWDJXqhkYt4Z
	k4oM8BMUarjklDb3N8Qofhn4gmen9s9k8O6Lw58y3NgCiPbSgHTqfm+Fixdt80Ndfn1EtrUYU0q
	GSr7gK/RVZm9OgFZZc/DAUAmMrWqHwmFWPh5Lu4jiozFxMZtRaceiNSEpmsK+Wt7DFVRpFiXTUJ
	SI/0na3lNLzSjEPYol8xuDWd77rSGJyDcu8c0dsT9D0iQst0h7tmzHUzOIKk+m8e12MaI+d9Snz
	7VARr+pcbpVChy
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870025385a.7.1793013025137;
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870018485a.7.1793013024566;
        Mon, 26 Oct 2026 04:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:52 +0200
Subject: [PATCH 03/35] drm/tidss: get the panel type from the embedded
 bridge
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
Message-Id: <20261026-drm-panel-funcs-v1-3-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ahWXP0kp+S5t7qf5z3TmyzjNxmZan19MSz4+hCT4HOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGItgb6kKK4AjO3W9Om73g2vCXma6yznbKl
 LFUKHSAbf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1c1kB/9LbGiOdDtx2eRR0gizf/fYpmreaM6z8w6EdAOFy1t/Abha1FUFd3caC3ERdnTesJb3RMt
 MQXRJn836BfxLcfr9grvPR645KCe339m9p6BgSfw+vPkemOuMfeMue4u5SDVupVid25yf4z7/0O
 /TXoov8P6bhXWyVeULl+m3JETg3qSoN99E9vQSJYSVTlWET+ZjFIjiHJfBHNNzKnVHYftfAHQsr
 VRe9z3PgswquJGQe/caiFzqlKOR6D3WWeU8ZHiOdVVf46Rm8u/Cm4seRvZ88SAHSwh4bHqD3nZD
 uzSrdXcMs4kpU2bLoFGLD29eYswEr61gzU/IKo39B93AULEn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NB9yBr_Nxn-f0Wb1kPlU7xzam_DmlvA_
X-Proofpoint-GUID: NB9yBr_Nxn-f0Wb1kPlU7xzam_DmlvA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0C75t8HxfXjg
 3fslydibrxgMeFq2536JyEB/ANhwygBqL/IDpsIti2Te5C2aupT00ItEfix2D5KSorkjLlLq2Zv
 GOeBktxPJ3V8Q7GxFlgK/PwnCkDEJx6IiisqDA5Ut7UEgJVJbmJmR++8+DpbH9gM8GQjM/qwg1H
 cW++M27HaOV8s4ZyWeI8/9SFxVlZ/8j1YzIhKCWm2iVH5Rwe4KobwGr86xYKklmIGiQ6mFqrrYH
 JBq0aJ7NMN5zKYuW+FyLINRp0lW5G7lSyA8zVO1c1cV17Uxga24cAYanVtW82LaCgMcUEw01H6x
 HOgXNG0uvVNQFBItCCPnGJFTPLhI4fU5jFVl2pwqT5B5SpdTRHjE9nfQV8j/jLhkEOH5anB5Cz/
 1vyMU2Q7E0mLXGsW9vMFD8/TRmuVnt7Wn8dNEcjQoLHI+iZbOq+zVADA0LynBzQ9dPYP7X3ooVy
 HyXR90+BKcw2ebKAwvA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3522 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PT7dRZsv_P8SEcnFsy0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXy5C1uJQ0pnRT
 LkveDPq6O3/k6Az8d324n0oGeVCg8RDvhvNPlAxspGpd68gxxhQnSTPNX+BQzUeimu6ndgxdn2/
 bqpcl/zGLjCSH/IyyH/qTUtr0+9niUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type of a panel is also available as the type of the bridge
embedded into it. Use that one, so that drm_panel.connector_type can go
away.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 70c14c3be10d..b98a48085db1 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -181,11 +181,11 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				goto put_panel;
 			}
 
-			if (panel->connector_type != conn_type) {
+			if (panel->bridge.type != conn_type) {
 				dev_err(dev,
 					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
 					 __func__, dev_name(panel->dev), i,
-					 panel->connector_type, conn_type);
+					 panel->bridge.type, conn_type);
 				ret = -EINVAL;
 				goto put_panel;
 			}

-- 
2.47.3

