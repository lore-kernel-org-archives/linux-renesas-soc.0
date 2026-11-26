Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656993;
	b=Iwoih3ROt3NTmEbELTaJXYThrrhdJzSPERJZqqfACzF1+Xwb+uFaAyqX4DcZk2VIh59k
	 2MiO4I9wgZSDw5OZvXEri7OK/ovNmzWwsrTErnx6/zCd9wk0jErHU6ZO1CHE1yVp5IYyd
	 KSW+hm4tklm6720eqVHxrKY8mTNaCsrOZC/lhwcPuODJ+SKPk+u32Lb1Mle9QR/P6vKEE
	 lt0bEgQXn+K7xg9WQD33r44BnTwcbExkMYbaAMsCqCTT5QHV658RDC5lJ2+qZbP+NkAEx
	 RYdOcI0La8zbFrxE+I3nx4Wu9/YUuHpS8GyJoZNxI4R9MkoCC37ekDZsl+VtUsxtGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
	b=IQRPSiCUtiLKc+RFKv1PJYyCt6k9yL/swQKBzy0B8Xa5YCBg8/Qe+3zWlb1JqGM/LZPf
	 f9Ha98tvoZRrpSdXKFSPw/0/+y6UC/v5qqOWVZtyHM0eAuUX1YMFUPOSulkQhmEW5obJ0
	 9vPEnAyTvkoxPtneR1bQ/tY0fxEkqoDdOPxnCj+Q1ttGRIlUoT4FdV/pJD6Uo6FVTBWjN
	 uaso/QvJcgXka7kX4wRDSv5EiOaEv4FgOUuJjAafyGXceFTRa7tIjwQfzlVfkVu4WixuQ
	 DofmDdHa5a6NpA5c8+bp0LBF5YAylvGy7B9fEWx+UmRmDAGnkZOL7O1FcBdQAWrTUJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkOtKQEs;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB0606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 01:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkOtKQEs
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2327317b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 17:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795656992; x=1796261792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
        b=IkOtKQEsw1P6Qem2Ym5jSb3VAZZX8TmwwUNgxT9DOWowClgIO3DlHf2mSKx2B1wjbP
         0AuxWFLGf2lq1RyFgUQmH0XHDv5gGI6zu00dAbb1L3ezjWpjf/dHnE3u6ZDt6C3W2TXm
         wCtQo4bG4EUmvmT+u7tNN8sQpQAUygbvQN71LN3myFzJpYq9OOmdyDDHqWv1MW2fSCXa
         KG4PzYEqRyb/zxyv6KU3eJyGm4QF82Yn4VGnsmLb9lcqpNh59TNXFGjGac6mTkymDYLn
         suV+97W7fCn7Go40/Ef6MQaiyG5Wd0MQjt2aCFYx7uWUaJLuEqukfQZd9cq0TmzDfUCo
         nksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656992; x=1796261792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
        b=IbjPOL1NJx7X/argusQZYszrscZ+OThBNmV2vb4TfNFBccKV6W+kSHMY8KS+OCXFPZ
         QSJDZfSy/TlrIAEqFH9pm78NrF4D9yPeaRy6vqYQFVcfTvM/IQgJJvsd3tfE3wrTd0yN
         0b4MGfkOLY/xk6R+okE2vTmRH10nKjZlk+kJohF9SM/r/62ehgHthaTYt+o/u1E/SzBu
         ugloiC4JTkIx2OTG/7k3fmwNj7PQzBc8bACkotc/n/lK1judhfQ51SErYI2QTqr/ZZWK
         EDN0pJulte3JxzOxNRtj60YBXFfuaGEUcuuboWcJDNkRtDbO6351knpILuMfvvoBwK8G
         9zmw==
X-Forwarded-Encrypted: i=1; AL+hErEqT9vwYOa7gxCltEtiZo21EqogoeaGGYfDSrtZZ/M4DcEub6jEICv/AP8GqbQoQ7+xoJFldCJQ1/aUzQbp/Ad8og==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NMjcE26vWUupXZ80yGtgMtN1b1+k7oqZHzxkkD7gm8ABEfKW5
	UMk120KenxunqSv9DLWI5d40+Gq4owKFeVa2LIzVLFEWfwsqg74sNm9Z
X-Gm-Gg: AZFdTZe6JifV6WMy/6F6xiN0wGkkRNhqQ3ckcKUT9LtTiNE75ugM64n6ma9QkfGze3V
	sxGsdOY5V8x4SEZXukEbILiGWAZY3tjFVECbilgad28DHcwqFZmqvuk2ih/OPDAx29PblH34bll
	QNfQMPZ8YTSNOZHjLQLmH+DHysa8I6riUtFB3DPgzgiy/EvKXMiJPLNJeFNT44yO7Ghwco4loK5
	WR9Qcu6oEBBN5ntm/bSIALZPnPgRHAq2duBuJm1UmXf1sG9TuoL340FNwQ1gykPyC75j33SbWoD
	+re6ABlbdwiodiuCDpEZE0cANx5S+Jb7NlSO0bZ5l0onoQGKCHs23OxZo+uHgsJ4Wzay5VK+mmU
	lkADNcSqiPonJnkpQ3wTcTkcCPdJqg5aBb67sGCGtE/241lHYXQATkq86BK4l5kR/ujr6De2CJ9
	j+m8RfMoMZKAVScZ5C6OyEKOzFlUCjifZXADNQAxHu3SpgHK3KrPtVEluMnS/x3qXxpcwzVu5d4
	V1xF98CqNE6RR5oWXkc/lbYQo8U6WNnlmYAShj1rEuAHpxAFEnTOVHYNWfoH4DAEyVuUhdwK74r
	8OXs9NocP6z7g7mpNwV2/fZxKyE0IpegdYdVsijBIHz9AfiM+UNxDpsfF1D1ByhUcUPgLNNDsnE
	r43Zp+rqk7Ylrz1RPNZKA4HiSyTGc7ULIIvbBk/2ewlNRr7w=
X-Received: by 2002:a05:6a00:8015:b0:89e:92e:4211 with SMTP id d2e1a72fcca58-8c87bcbcecdmr16856465b3a.16.1795656992438;
        Wed, 25 Nov 2026 17:36:32 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm9748633b3a.14.2026.11.25.17.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:36:31 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] thermal: rcar_gen3: check for sensors before reading the fuses
Date: Thu, 26 Nov 2026 09:36:26 +0800
Message-Id: <20261126013626.2168810-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125060429.GK3898744@ragnatech.se>
References: <20261125060429.GK3898744@ragnatech.se>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rcar_gen3_thermal_read_fuses() reads the THSCP register through the
first TSC. If the device has no TSC resources, priv->tscs[0] is NULL,
and the read causes a NULL pointer dereference.

Before hardware calibration support was added, leaving the
!priv->num_tscs check at the end of probe was safe because TSCs were
only accessed inside loops over the discovered sensors.
rcar_gen3_thermal_read_fuses() introduced an unconditional access to
priv->tscs[0] before that check.

Move the existing zero-TSC check right after discovering the sensors,
before reading the calibration fuses.

Fixes: c3131bd5586d ("thermal: rcar_gen3_thermal: Read calibration from hardware")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes since v4 (split out from the withdrawn 3-patch series):
  - Split out as a standalone single patch per Niklas Söderlund's feedback
    (<20261125060429.GK3898744@ragnatech.se>,
     <20261125113106.GM3898744@ragnatech.se>).
  - Rewrote the commit message and added the Fixes tag per Niklas's review.
  - No functional code change relative to v4 patch 1/3.

Testing:
  Compile tested only (no Renesas R-Car Gen3 hardware): arm64
  (aarch64-linux-gnu-gcc, CONFIG_ARCH_RENESAS=y, CONFIG_RCAR_GEN3_THERMAL=y,
  W=1, 0 warnings) against 666539eecdf4.

AI assistance:
  AI tools assisted with initial static analysis and commit/patch drafting;
  the author manually reviewed the probe/remove paths, verified commit
  c3131bd5586d, ran the arm64 compile check, and takes full responsibility
  for the patch.

 drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee670..a96f02d4a8adf 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -557,6 +557,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	}
 
 	priv->num_tscs = i;
+	if (!priv->num_tscs) {
+		ret = -ENODEV;
+		goto error_unregister;
+	}
 
 	if (!rcar_gen3_thermal_read_fuses(priv))
 		dev_info(dev, "No calibration values fused, fallback to driver values\n");
@@ -588,11 +592,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		dev_info(dev, "Sensor %u: Loaded\n", i);
 	}
 
-	if (!priv->num_tscs) {
-		ret = -ENODEV;
-		goto error_unregister;
-	}
-
 	return 0;
 
 error_unregister:
-- 
2.34.1

