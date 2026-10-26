Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013044;
	b=NK3d0zQqDrzU6AdTfZuT9DWP8yGZ4HghgphgxIDHOq2G+jInyp4zxoGOhp8Twqj4+nmm
	 ycptpl7xjUtnNWCfFdvElGf6rFRE9cCGqBov9Rc93yDB7wHe1900gWK4fI81ucgdOcc1J
	 KKFl6lFMHm+As9IlDpAePk2uFPd25TRvA6kqDYFBaGHZzZQl6d/2f9uzW392FG+Io+z19
	 19WVJX3/h2Fc4hLwqOq9djp3GdwUOabGbF0frjCmx0q7n6FW1u7SJc3h/bo72C8u0KrIB
	 TKlINZCf7m/MrhcRAdT7ZCw8ilExF3M4aU7HbBR6wj2+R7jll4bkAEXn79U4sHvjRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
	b=IbYEPswdjYAeQpHLcE73qznnRytXEb6ZkTXaCTjUcvtPt2nFQbB5oAYdAfgbqAj1bZ5M
	 cGs+fWMswXEVybMPlZnKFcX+HvI4w/UPS8HvvmXiZaKQFjieU3ysng/R5dRJi3be+dDNt
	 tbScQOIFaLF9abBeKEGvyNe4p9qu+D4mrl7MBO34KiIIdBrwNd2PgBfIB3trOhc782TiE
	 mu8WhItw9lKXl1FGe5BXIOrtN5D18EYZqbCZPLqBNTKqAarvNXFjtooJ9EWUdfi3jK5q2
	 2sMm4MIHtq/2w4DNuMZ7KPyROb33FM/dhZdovxo9g8ikLoQqUop2r9eNU38Q1f7Q3fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA560A6F74
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EA560A6F74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9dY3049850
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=; b=j6Wl2ZKT98xHbKEx
	/nU1pTxuHGauwXtw97DwI2vSbvSkNprXjQhSmRWrIFQp1V4LjR4fvRC56w2wjh8V
	GRlHhqRThB+X4gBAvEQ5tqBnh4OR09YzmcJ9I23KNbAQz/wfYptN534uiKGOvnTN
	BfFyH27eQEUbzKXUnPEpzKqtodNGDgqCKXSqsVxd2nK9C1MufKc4MCnzYCfJc3h/
	QaoFUr1TY/sZ8idYP2giGyfsHLqTVD9mgkMfxnVZ/T4DE2tIfvs72stR4rioyGCj
	3Rj+Mc5PfS7zgfKojRpyH6YViZxjvPqeYx9R0/1AAXvXygbbSyv9BnE4ZfByhzxz
	LQ2URQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b875639ceso58780976d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013042; x=1793617842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=QqfKWCoqkAvwoeUgCcgJlTl2k5GerAorxAviNUz6f0DM0G48NLvt3QdK64xNoNPyJe
         CnwvcaKhob8SaDtoWOn/h3/mwyWIpdqdjtq1gqr+o2LlyefzZF/jDe/FGboZI3Q4sSBa
         8AOsIj7N0leqAyV2l23oUbsdtzwgZMksAZNJRZHl9I5RR3G35HtarueUXwP+SEolINz4
         8tdOK5AIcZz/WjBRdVHEkJnZiAjPyjRTx52ulpbfI+g2TrgiaSYYhwrChk+7Av5aS7J7
         4A7FOiQKs0VMTR0EiKDCx+CLgpv+vEE9ZRcKv/lOo/Ap7GXwvMnZsqnuUQkK1yfWoICJ
         q0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013042; x=1793617842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=l+13fS3jf9t/svv1SlO30LqhNN3NArmdAyQovCrJCcfA3x6p3Gwb8Q+Qx4/xAjYhlh
         R+gWr9IArIMPifdU2JFYYK/j5E5q6VqMx5FY+6gfA7eAFlrU3DpKf8cDVq16TEwyTFCt
         PDUHUpsZnE7ePEmInOPHYjETZAwhoyiAuu7nWr/IES87HVoIkql2YiCGT98wJMO2VBcY
         KzK8sSnwd1tdZQSn1+EosyFe6kM0VVlxe1nupBXHLDs6oO3HkDYs7hQYjnOTpBh9lZ3/
         fADTKsv6QtHasU/pMFDE9QX+W1/gVF4xWqy50B/zUwxjHbjoYPsry1oToKWjqtLMhuab
         g27w==
X-Forwarded-Encrypted: i=1; AKwUvBxmWRAWuoxsAv/06sn/fmLGxMs3Bqoa+516fnp/ytt4XU1JceR1l5h9bEjslG5AHuCAC7m2X6mgGrTT8Y5CP7a8Rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbbo7urLydQs3Rz+gO7Lkfcd9zxGq+DxmE5dFtHwFeMyPs33+U
	v8zARYiBDT7Yaxb5zbXMnNi5yp/TlFKCyS8qLePw18IEaKWHwKd1ySU28arUzkVsQignkSu+vZn
	PqeF5slCrmqBTXVe9EIEg9gDw8TPJhEFk+NVwL2HEgVjnh1l/jUCzpvLSgUXhYJ2YNrAXURS0AQ
	==
X-Gm-Gg: AYBFou37SetTlJ3bc+hKRGGYWVG6yc6wCI/rLeRqP6RQoJhAtTVuz3raWvEQc4YAD7h
	P6K7UfgyryVH/9DiNr8BKyZNfYLLOVH/lrntV8I1wy6ZEmtHJM2TIcoRwGT8gd6WHj4u2umwmkv
	vmfU3kCrmVGwkDrAZBlVdUEOfPB8EhaZRevYkBvs0FbpmqaUZaWM/LFlyK6II4Im7oRgMhN+vRx
	KsnsUsp0DF2/5/wpeMisXXHyLHl4J9uUjzJbv27XzFuk8ocmHtGFhcxuWi2dEBU5AU5sWFhW/Jj
	4+z1WP2W9coWPM5OkP8R+5iypCLTrahyye4i3m8nFAuO/mUbLLm9iHoYwY/HXZchQbY3u6QMtSo
	2w+BrhcjHGteq7xtWK2rC0I7Ahmm6b38o0Dz4APqF2LrVH99SXTS8ufbZXNM+hCC/2ctfj6cVAm
	J8TUXRjgqmLuow
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861756285a.7.1793013041829;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861744385a.7.1793013041149;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:59 +0200
Subject: [PATCH 10/35] drm/pl111: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CmM8Wphvynv0lIRI1+4+EqPH050ei17LGuNpAlAxYlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKQ7TIU2XRP7HZmWCiTiNqZj11gfIKhJErO
 DHDY9rbRdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1YPGB/9rhW1ooU6FBzQ1pckqwHPnHHWFmRJFIB1Fpi/hiCtnjoh9PtNUR4MQKjC/rH3//hU3uFC
 nozE52P+NNx700phAyOXXZC7YRZJaCErlJn5BFFr1JiexNs20CTS6K7tejSh8TK2Y76rZUxhrrV
 Y2loDvttO806mSD/DRpUdu9ahHaiE+NhyJI0EW7G4jjWOQyvpEpueI9gklyFlhdEPlnarBK/s3f
 K5h9NwlLkyegQ9nvNlccObPXL5xrzNK+KqqmPhcUyPmVR3mJ1zA9ApXMADNC6Vdjq2EOaPrBcBs
 8rGmFy+GqfVfwsz798jK6AMPQ1yrjM6732SGR4Ykn3ZWK5IA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: x8La_aN-Nu3McYN93k5btqjjweIpjE6f
X-Proofpoint-GUID: x8La_aN-Nu3McYN93k5btqjjweIpjE6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6tYP3P+znzNf
 TnOZpIddhIkymNminY+4bU4I45ABXvxzOqIHv/kifvkirVrdPGIBdEBLNLvPDG8TRbfjh8ae0mC
 R1+FEwp0NwoTAsispO69W8Ey+M+NnSBlpCL3eicslIbzEL685x/zhlNZJI9CUhuN5pf7pYG2S++
 3obCfIhoTYaVJifd9MRcHFd47XcZpB+E5rSoWvxEKss50qxHuiCjUTjwjkf+pdRTWtRw7wH3iqP
 N42Qm52zjp1NToRsGMrb07RRqQFM7AhEiOeHViuAu/PIHMMOKgd0I7MkgBbkI9UUOGLXYh8AEwD
 wQU5WBAN/UJP8e9sElrHvg18hPPOAR0ABuJX5EwDKDgvBrfEypv/NKXN1YqGegR4pQYQcXbBXOk
 nY8XOAU4WuFbcWDqClft5k1FA6zlv6NJ3JHcleUsVSL5M+T4C/tlaghHmEveZKnv3vdJPsYlacX
 lk3FBuU+GSYq0c6Hs4A==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3532 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6PQUdDDLQLJ_jpbVOC0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX81A3HdPSGUAt
 Q89eLhdFgNrvp5gpSBK6EpnqYMJAbUT/kCLA5gtIouE8rCvnLrHMnyT6oeOsT73IllBsbbo4NLe
 ovRaMrBxoQHKu3K9Eyjf4HfjsecwAhk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 89d44e970510..d172cbb95d02 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -143,8 +143,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		return -EPROBE_DEFER;
 
 	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
+		bridge = drm_panel_bridge_add(panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);

-- 
2.47.3

