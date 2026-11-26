Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699919;
	b=MD3Y9OmCRuFsdzQK0n7yFKXmARAtiEnnyHZ+YtyS4yBElOLJwPYdm5gqmJm7raiBjmeK
	 JuVZ3L09/zzd4WRIHE6suhUOfP2iQLCOMUTcZ5/hcCi90cpjES23xKDuECGv0Nr0II7M6
	 9tYZKF6Wt4fgs7K4r02G7jGHNCOjmG7P+tPAc0H1eKh2ug84rT/HoF0yGabd6EM7UsTMl
	 vqCAxZJNVsLvdpifhlVh8deHIkzhrtAlLD6nwLB4nVwoHjW4a0oBoG1tdU0MtkUXtE4+3
	 HrTmBsxJhuOhu43Cgdu/FOYBQsNA2EV0icy7f0UjKDuuq5yoWA1ei1z3w+Pf9QTMB/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
	b=tmsDHuPlxbMNLRQHRWwTMvKJEvVjm5MNWb++OFZeVGdgXsxEbB8KiHEEWpU/nCgfmLxu
	 mM3MjcgWCHt+4qNq9TkYrRLT62ssZmokmhtPJEXq39YmtlAE1w6qO9cKOfImSE3OSNsNu
	 /Q6hEr5tCSV938ErvplXNNgm4mA2+w/iKoh06kQ/1PSIy5FGi0kk+2K4gLvDKjv+pgfI0
	 moE8y7HNioAFmwXIeIEjtUzql/965ADx5ZuoidfpyemwZcY1R3GGO0+J7rXnLc1+E7zvX
	 UGw+Q+zHi/f05CHprFrueDtQgoY/t3AnFSNUvl+SewikUPe1Pz9a0qjohoW63q9eymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdSwlU8B;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18858606A68C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18858606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdSwlU8B
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5462691c88.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699918; x=1796304718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
        b=pdSwlU8BdoCVHBBNrELrT0pqFgmmPZpC7zzITXacmHK/w/QFes/gumIDPg93npLdjh
         W0f6aU0w7gB2faGLA/43zn9xB/CibYNQvB5Gggca4LYwEOQEnxhUvgiYAa6aor35j+Un
         jJo4fl5fsax6zJXFwezfZoE/uVUMVjehew3PY26JadHcJy8a8UrO5ZJzRvxSYuZu4Z37
         9e0gUUtck8cc1Ax45OZ9H97uq6SJgsQYNM1PJHwzT1wYoJZTapkquURbS/IamMHVawwA
         Or+fX4lQbTr2qLguralc1DFjjh0f+u1jCVeEWzc5NySvxdjC9LGSgZbtLA54/tByKdNZ
         +j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699918; x=1796304718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
        b=y6J9+j573rx1xwrJX1rbR5hewlXcneZxV7SgVpvMipv1AqXBHnXSnXx1TqdKXsKyRe
         NepZynjxXFv7HjJbmU1ZGV6lMPFmurNFweQJNfND+tuJT3F6ACmKgunv5iEe+pG940Yi
         fazwZl11HPqS1Y281+d5jpafjgtqgZyizVy4mn4AvUcyXas3cG4b6mKuc/x7Jh+BNpTc
         3hjBIH4qLkkfS+wpqi08YdM6bESuGLdP53EJZ0kOq/H6FI3UJLGAMnha3/WaEB2DKjFQ
         UZdmOH/guDh0fWvFw2bnUnR2uuKmfetkJeVydlh+Y1KeJr74gxLZARw//RlAIXH4g9X+
         RrOQ==
X-Forwarded-Encrypted: i=1; AL+hErHRXRZqEmE8H/P3J+Ga7hFVhwG637xgfpFq9FgXB32p9Mhqew0916b+eUPfCaBB48yVhSFF0XZ57RQnRRJabgPzcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z923WgxoQ2PnlV4KmO72IJlULy4JTqYYk+9qSVrkV+FLJsdGY7m
	obFBB6KXhXXTiv+3UE+RzyOnH/Tj4IWG3AW2PtbHaO5Bm/TJjTC+UQmOgGNFkgjMfg==
X-Gm-Gg: AZFdTZd7byC+whpZzbin709EJzQ0f9KWGo8E2DmlMihG503YnloG0+1qXfcnM3jjHI0
	JGkPx7YCalvwSMKHoMh0dybIzOnZLsWMDXioBNZ/yM6lFdarbGMkcz+Pr9J+0E5B/tW6LZ/w4Ik
	+v8aT/jFBgJD4Fmav9zcI6BzM43tIAfO0Ld0/x9ahJEhL7OCl1fnoIi+SoKFr3OaqyT0JIv3Lkc
	DIcG7b2N5UabEqPg+EfZN9okzCtDp3qol4L3+i2ljBEoKivevoTrOHsYIB1x24iGtcOnptt6TnN
	tAu16iYxIM78rJk4U4foHesdLv7YV7u8IQ5WU0iXEzenmbBsudifNldKYHzoDEJlaWK+uNZxgKm
	9gpILFwbIUPy924ORxh3ENbBNBkgLmrGVPbucen4XbW49ua7TbjxpWGPfy0BjJIgUn5DQK6GwOw
	yRYOpHEQq7pnYdSzdTXgRh+xRYzIeDWmM7jHSgcBFnU8+mVdpGhpJ5m1kNGSESN1m1ObBxRtsDW
	+4YHJh0fy2eriJNSHHrUS+gtyJZNiUGa5fm0iz4EDyGanFz1YdTXprYxXT5P6mBny/1jZKsOC78
	PRDDY+xO0nQFrZ9vA3pGuZ7GTg3SnG9KR7H+dlfkZIzU7p3b9oOEXLm1hjk5I92PwkY=
X-Received: by 2002:a05:7022:ed02:b0:149:50cb:2175 with SMTP id a92af1059eb24-1b5568fda53mr20186467c88.33.1795699918133;
        Thu, 26 Nov 2026 05:31:58 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm22321547eec.17.2026.11.26.05.31.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:31:57 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: rcar: release DMA channels when host notify setup fails
Date: Thu, 26 Nov 2026 21:31:54 +0800
Message-ID: <rc-b1-20261110-vc-182-eee62ef398fd@gmail.com>
X-Mailer: git-send-email 2.50.1
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

rcar_i2c_master_xfer() requests the DMA channels lazily, on the first
transfer that finds priv->dma_tx or priv->dma_rx still set to
ERR_PTR(-EPROBE_DEFER). Clients probed while i2c_add_numbered_adapter()
registers the adapter can already issue such transfers, so the channels
may be held by the time rcar_i2c_probe() creates the host notify client.

If i2c_new_slave_host_notify_device() then fails, the out_del_device
path deletes the adapter but does not call rcar_i2c_release_dma(); only
rcar_i2c_remove() does. The channels then stay allocated, together with
their DMA engine references, after probe has failed and priv is freed.

Release the DMA channels right after deleting the adapter, in the same
order as rcar_i2c_remove(). rcar_i2c_release_dma() skips channels that
were never requested.

Fixes: c4651f11d09a ("i2c: rcar: add HostNotify support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_I2C_RCAR=m, CONFIG_COMPILE_TEST=y (object only; no new warnings).
No hardware or runtime test was performed.
Needs a pre-Gen3 R-Car I2C node with the "smbus" property and dmas, a client transfer during adapter registration, and a failing i2c_new_slave_host_notify_device() (e.g. a client already at 0x08); no in-tree DT sets "smbus" on an R-Car I2C node.

 drivers/i2c/busses/i2c-rcar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index fcb15be59cb5..b5c964c367e7 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1241,6 +1241,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
  out_del_device:
 	i2c_del_adapter(&priv->adap);
+	rcar_i2c_release_dma(priv);
  out_pm_put:
 	if (priv->flags & ID_P_PM_BLOCKED)
 		pm_runtime_put(dev);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
