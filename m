Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575820;
	b=W587tLTGFbc9LiBeE9eckETdpEW7lDSb6T6oBuUWE9OO59ivQzxJ5fTeIDTbjuN1+NWr
	 mBUSlus/KY2Wkxaix0ZZHiL5k0R/ktRxR9LFo5k5uX6zZSpeCwbFv0yCImjvs3XlJM33l
	 1+PI/eHEaArclmYACNB6/Lkj4r61BsKhKtdET0UKOOlZR8TvaacvQSx7f3rpDURgwgXo1
	 YRmrGHOv5Ldt8rY5pDQZrWjye6dpwzaeuKSAptnzKP08bXEJmg4KMYZDfjzeK5BNb05to
	 AAv3CG4nhyYEkMjKGhCUu3H3LK4FCKzGaMUUfSxFIMUVBKWygf7Egi+QgmzggIt1afQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
	b=1UjrS0OSA3+vDYgxs+J9L0m8FYlizerHUI/a/ppagNuC+awmfJzQre62vuPUVErJzdAP
	 aKBAIZxkiJP1m3T64csrioz/hbiNHRTQ8jXfRgWinfyc/c2AV+hqMGXjGsJuQSs6U5H+C
	 /7bB2oa6F8l6T+IimbNWnBNOINt8POHx/Fj6VrtOWfBap/bGlyuy4DGXkjmhi4yktB0xr
	 CU6fkEezDf3Ef6A7xT6oTgPvdcglbOJoecig7MCxok59iIHHPc1Lr+zu/Ww6U3hmYzz06
	 E2OMEoC1durj36SKMTxanc2t6KDOjolEscgqgEUa2aZ1Fus0h9y/izBhpRJ7dClKg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKOVKSt2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D2606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKOVKSt2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so13541341eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 19:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575819; x=1796180619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
        b=TKOVKSt2MdXGJInMSKFALiaHDsdHQbhwKK9lg98AHMRSX3/spzwYNAo05kQ/wIrQ/5
         cs3kpotHqq3rqtGsIGOfEiHPMaBf3bEzRyB0GXtKDoUYYnL2O3sLdJQ6F4H3r5nT/mHi
         rsfQ2qnCw69gXaDMFSEeDS8N8kOILefhIGR3mVl6E5L4KF50kDgvjrdOqru/9GXw2y34
         pcvPDJmkRcXh+0FpZZPD71wz1Yd7UHrStUa7HDZ2oqJ3b33cXwJKijwMfR/DS/TkcXCp
         2zx1MzKEWgZirYZVkuWUDa/hdPsjsHtjnozOI9STanaIMcJ+gpVQYIOQjY6r10LE7HVu
         hxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575819; x=1796180619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
        b=mLTuKY/5C6dPdXt3W6f6X0NUKuP8ScyCEup+Kb+XoAMrMF4ZDrfBXll+h3zkFBGqH2
         uGwB0zsUN0DnMYSYZEUvMB+BOvHNkx9264WwGPWmpB3Q6UrQU+tN9I8RcN7XcbYs5JBJ
         nAQJ4iwDQLXl/IrsXq7S3wn8TcybbJN+9wBGTvt+3NvzB2GuOq0DlZyJFS6nd2mzc/LR
         jwATIunww7Ud0UtXKOY7G7HjB/RuYDyqQq4TQEEDh2sCZy+YWn58bwLbJTxL5Q9cC1N/
         kXqDZBlcpPPy7BW9GrUprRrhLkkNUKVssmqvcYbCqR2ZC9uQ/73LMjLKMmJLAuSUw71Y
         oKGg==
X-Forwarded-Encrypted: i=1; AL+hErHEQc6zKyc2MEeb68Xlyw4RuX25ypQhB9+Ry4HlOgObjntQM/aXDlGGgJsf9hGnUIgJJiIq9nBfSAjrDQlmk8hcTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xAnSZj6amDAUBvl8xhEG8YIT9aAZVgBF1lxXX9c4J/0AB4gn4
	gz/6Lpc6fzg0e6hKkdqU/e/35BMuA/HWvfGLrzDIMDjIdwnuejOF9qqy
X-Gm-Gg: AZFdTZdLmQWLNuQjjw70MRQnSot69p6BzXVONJcQrFm8ey1TiyY5BMDD2nxAPSRlceb
	MkPdAcpX1or4mFsWHYTINoTCizSQXfWwdDYuj2uSmrxKCqM11aZCDXvVDVWxwV/OoFZFNBw3IHF
	V3CdMnKZe4mbdMY74R3mpc8j3BmCkrP6XnJ9t6HeC6qHqzU/FwtluEagfgrykvvpg9pv+j8vPFp
	Y4xKChYLnrx4MI4JqbujfdGdOZ/vsMk3BURPDlLv5ib95vBOmbal7RdwlkOuyvNgapqV1IlLqSq
	ADk4KLWYMqRl97DRumKEG+xbK34MVClQ81npQdMyrE4Fy7IdQ1S0Y0+Bs/ytKPrSFAXsXKLj/tP
	kkIpPE6ZLGcF9sbqBisGLuxGJLNIVC3vUqp9imM8I98B9R0cn3qXwUrsv3Jy+thUJiRcrVijbxm
	i1xFOVmmxcFhi+QgxZMSGK4NFfnub1nazjn/BLwnBTH+e76uDeE0jOXfTSibVeD9XI4Lyw5JlC8
	BDTp5BuJ32PV0RYtoNjlBLJiL2kpQxTAOcd1+BfPF/ShbuWDOEZRm9h1m0WnLK6Nk8QtaHBs8X9
	UIBWXDFpQpMo0j6kbO5NdyO0I7o8Bqy2NS1v5FPUNCg91RnYEdnIoZkaL+96DKCnWRG8mVixbm1
	gl3Nl8ETu4RUY9L6mASaLiXBeJw3PGeGacfT7B8ThhbNsFP2JxzMOHfpE223uqOrFLCdW
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr7194731eec.1.1795575818364;
        Tue, 24 Nov 2026 19:03:38 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:37 -0800 (PST)
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
Subject: [PATCH v4 1/3] thermal: rcar_gen3: check for sensors before reading the fuses
Date: Wed, 25 Nov 2026 11:03:25 +0800
Message-Id: <20261125030327.953450-2-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125030327.953450-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rcar_gen3_thermal_read_fuses() dereferences tscs[0], but the check that
rejects a device without sensor resources comes after the thermal zones
have been registered.  Move the check up, so that a device exposing no
memory resource is rejected before the fuse reader touches tscs[0].

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..a96f02d4a8ad 100644
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

