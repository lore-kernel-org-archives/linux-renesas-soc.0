Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537884;
	b=JwIFUox85lp3I4Ifl3o5+gUuvFvQA2lQ2ckfSvFIwsgGtasrOzu1Tc1993m8+T5m1xs1
	 LUVzoga50f/c3TtU8Y6Eeu9nB3xCqOYWJwh1zR8IUu5ntTcQbcEGSBkPffIeyb6tHh5XN
	 bVKMXS8E8nHkvQ1kHiv8bzPNyyuvG0ANA0cJYBt7JthPDfanMIKnB8r2mrBaxnDvBiooK
	 ChUxsfdnDVmtpfVEgIbidpUq2oLS7cUxnDqb4JlXokQff+lZfkEtJySoJ2Ar+KRLDAskC
	 ugF31uNKxL050zrJSwkMoJope/qFkVxfjd5nSla7qld8TmU6gVi77n45Prw3OUYC/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
	b=TnKitv+IZ5aW4P/JYGvhcGcZ47M+yUNgIzhrb46aL5WUsH68R1NzK64BbN/J8w/gY4ze
	 lAi6xeuV7littobXeG5wSxVwW4tiBownDCp4FxFtLnphQ/ZYKm6iZTwR+MMO4bK/dxU3p
	 riyMttp31aqNGV67PASIf4zu1hGX6znf3ZW5f+nQMepFtSULCA8i5TOsVYctdcOSyjLzO
	 ZcjFW6sPrPhDUxvy48m6ihgh1O5Yi/88Ah/u5MklUmEfGD9KhFGd0WJMzY2OPxhNDN98o
	 dnFRkrjQVumoFNTjls6iCi4DtBJm/ave/dJCkf4Fz+U91/paIrSY7LQWeM3Rr0u1H2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LO/10Qmz";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7588606A337
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7588606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LO/10Qmz
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a42b34e930so4149860f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537882; x=1796142682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
        b=LO/10QmzbMJOWlxbUU6wBuAq18RVMV7yVnrusuFonIgvjZ5F/JZ6fyv0rlQZ8wJZw8
         /LC2lv8BGgt9gUrxXRwMO/7kOMJpJsajeFE9DHp1Wsg678U8tsI4j3Bg22LSiDro4+l1
         pWR1FvangA3SP4W8BNqlaFjcQ6A2nDX5dF4sPcCu+sQ4T/26EYHE4F5ThMM5XgO0yA6L
         F+NBTXExgLltLguJ3b9yAhNVi8D/t1YKGTuFK7BWlwdwKITV1bUn6qkjbyQMxNHCfPzc
         fZeIhKAl+pFhBVx3DdMfjIvc+/UMXcj7cFfCCJCFV6JU3MxBNm0fIfAUlKVMmKSpNvaC
         dkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537882; x=1796142682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
        b=j1tv08ylTlezGNxrgMSNZkFhfWufgw0y7CWooN5knX69I+LaYuwJgJBnlrv7iuBN32
         18SMw6dft8RLf639dquvDazGAKfdVszglK9SxcOnZRyeQK4TU5mAyqZ8xexXzJTvASZP
         NF505XvEvVE0ltzh4erkfm+AtH6eL6PYbpCzk/NWwYB4Me+6hfXELZWN4ZP2bQVWkZYM
         J00H5WfLxgYGr/eZBsigP7URa76l9wM1unb6/Ti8OA1tMUn/nc8mbhqkl32Y+IqRQAgX
         P7z/AgEp5vPphkrtFMn4SBNgTk7AsOqu7JNnATCn23HiD/1Q0BYbbyAZjYKHRHgNcCDh
         xLUA==
X-Forwarded-Encrypted: i=1; AL+hErFtTt5Mn+z0TZfkzC1++am4x+YXWg5kUvM3wI11nqW9TJAzbMa32WtkiWaZ7RWxK4mF31P7OMjFP4/N/Ga688Vlbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TGNr/xSnxEMP6cAxjE7hMjHT1isfnWnjr7MBb91j6R+ZuTCJv
	ptLg2SNai1kfyZ6R2VCbMZSHco+0E/hwDUws/Ncmqcgi5++okfOVDfNR
X-Gm-Gg: AZFdTZfl4AvsgwJeHBhqhaSAIKy9eJd48ZHcw2ZaII2k8I3UbR+ZnjZkdiX40J1wxV8
	9b0jA0ElQP6y5LaVWkiTRju369gGZ49oTNAN37CrVk8o/S4C4ULtu4U28DZwMcDZGeydy7ayiSq
	mt3iJjfEMaHd8IFeiqGftaEF3Fvs0V9i3YyYys9ZSvoGBC7oyAUcTSTkCPRvMZGaCqEnJdN53uU
	V4pGm7OzizFXAIRbO/egOWpysGRSehWotlFuDDlFfQgzhsyRHHnxdb94JIUL/w9o5RLmq9M0RJu
	Nf7vWzKDGuLw/yvrcVJ4ayKY3OdNNj+ho6YJGg8yNrQzdFVvPToqipeWBGuShOCOQDJIq8WgxYs
	KewEv6kBFyWnalLQkxGHFBAlxjJTiHr+8E9KTJMZLmVsODIwFknTIaIgrdvJ0rACYt7GQIFREE+
	UrWADqJ9YXD2D4Jfwy8QvsxzAmavjfmbSaEzbYnwumDvmAKFXeDonr0kKCyofgbmVlb3qDRU8wn
	/xR3CiACiO1CKD7EpMQvz+jZg7SH4lC6QT68SJ4xE85Frc4juOB+mSeuOGsXn3i4Br0ZeDn+m+l
	p7+kDiWl5IwEVW+nSp3P9r61BSUUyNdPbepm4x9Ro2dKxfMqgm0UEKp0n5NhRlaX8Q==
X-Received: by 2002:a05:6000:29d6:b0:493:28c4:331e with SMTP id ffacd0b85a97d-4abb31ae161mr19737972f8f.28.1795537882037;
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:31:19 +0000
Subject: [PATCH v4 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
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
Message-Id: <20261124-sdhi_hs400-v4-1-df452ccd9bca@bp.renesas.com>
References: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
In-Reply-To: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=2555;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NNhniuzpGFX1nca5vW4pDZfRZAtHdZfsX1g2gSTvGpQ=;
 b=dBACvf+gLaRjRVNK5ZH/7Y9iHRyWPDVfxjWRzSwE/xYnB95yUePgO1M49y60bDvH7MB4kMpL+
 Wb/iCFWNbT6CvM8GwpmwVwu3xluM7SozAfvV4XppuvliB4Xe1I6YwFn
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No change.
v2->v3:
- No change.
v1->v2:
- Added fixes tag
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);

-- 
2.43.0

