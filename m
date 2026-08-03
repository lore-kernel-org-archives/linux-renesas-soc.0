Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00563FC5A4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761011; cv=none; b=aDiH0d3mvpeee6fVMoQXNjqpobvwYwKKSj2dxkUqhg1PZl774WlcZhuUDs1EfnHKnGL3/SgYgCatPUKfk7+NFnbOMCWVHVjuX47kf81bJhWhKIDyj63Yiz1SzVweMn9nCTPUBOTrSHAUkyYR4TIuRfyQBsSwNY2B+aGf2SYUI/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761011; c=relaxed/simple;
	bh=tnQVRiKHBbJMgYskau3aHnN0bLEXgSPq8Kdh08EQFXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mvG0i6xR7s90T/L0Mglqikc9qmQTLhzr7usfHDPiLHPYAFtvGjSo5PO8Hg2YZN2q/bMV/yJkNsxWyQEEAGBxruYERtIoXY+KLiuOrsNJp2T7x9zO/BHdn1+HB2PyNV7E25G2dcCzl6rwMqn/EuLdiGDj9BLTjfPEmFf9MHRUpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xs7zmOqM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xs7zmOqM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso32870005ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785761010; x=1786365810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cw8Ms9Kan2k7tw2PC7Z5aIyl6oywbNO7qN+ujFMHGmY=;
        b=Xs7zmOqMf7jXmqO0SSSe03V3KihWfaiDuqIN4eefQYd0PsDmNr7QilsRW0RhdQCCJK
         H+EXpSXU8RB9GOTQfyKybi33RPgNbnW1F0dIu8RgYrqEvcMtL/t7nGssiwMk/cmdskmB
         PNx98WWvjq+YxhWxz3QfuonP8o1pkupoHQi4PDrLfc3J181Qct9Su5fw6qGzfQo7IxWy
         X7ZF9X3D1gkssC+0CKPrzImBmKMdm2zy68gaU/3YWO8Vz+mPd9dnX6sDEaAwd6QOThih
         APddUwYIoxsyPbmGnD/AB/nOYPEMuzFmekIi7CZ29zJs/fvL+jo/11WF1YgjQ1+H2Pgt
         h78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761010; x=1786365810;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cw8Ms9Kan2k7tw2PC7Z5aIyl6oywbNO7qN+ujFMHGmY=;
        b=d1xNcSqiMblCp2ylxlU4D6FsEk6/Uzrp24mrxSxsRqJ5jCSEpVTzt1YTcN/isREUZ3
         Pvm0MyLK/F8w0Gfst3SYCYm8B/VZuaaf4Ls1hli8xKchI4di88zJm/w/vuOELWc+aEHm
         csyfwwfARolozdlVmGNvIMO3zgHaipFbt/87pAX4UvNNJA6yiGDQyCwGAOsNBirOGJ4j
         p3h34y80Hxw2FV6kDs8fVmIEF9nTOblET+rWyDtVTbt1MNocS7KsKUhwAy9PzdMx6B+M
         Oh97ktHCxh9GgIaES3nuSciK5sB6g/6csjrwrGJUXRdxxMpBWgf2x0MBbrHEsU4tehQB
         2ITQ==
X-Forwarded-Encrypted: i=1; AHgh+RqajAUSCvyTBBe0TWToO+iYSTBnTkLbtCnXN/z44GHAaC9IBUNpbXKUHxWweLqTvLMcjQWgRAvY3kAsLYacPNYZqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOA/TOi/PiD4RB+PzASjv17awvq5AfWzwUdryPr46GNjwc9USg
	vcLJBq808aUEw0SLXD5mvgnvXq2fGAVUfSPwRu830ZmMPcE7veJ4QnC9V6HGyA==
X-Gm-Gg: AR+sD138SPLDwBZj25MCmUWYQcoBspOiJTOJgs1TfMjjhYj5l0MYSU2YhyrrfPMINJB
	gQ5XnWh3xUdteMnwbjOLkALDdOIUntkQb45TFAEduRxo+ZRNwpWhH8cWYROqV2ya+GNdwT/W/Eb
	bmS/Hn5o3D5LjjF2lrRRJfCJnLb0tfLcFiuPY0cNofCgRw25ABQ0FQ7mRWHHEM/dSqA6E+b9nx1
	eKaAXcEzrNoMO+Icgn3qm4W5Tharaqm3TBsyZzBPwGRqT5ckLszbAkK0ZeGS4rPEmFp4zO6/RBJ
	0+ZrFN6eIUmdgWnuzOrL43EJBNuDVFYtv8yrIm2Z8LhoktWkZFGzEU2C5mxrfoLxSb76pLzNNoO
	qm8ST3kZKZr1GpQi6IF1dRcXdaOzXD4/0KMUYZG9U5sprnOTwWWBvD8nFRGNNHzbCYLQxr7FWgY
	6yMSDMZWvRz4uzMuwdYHmlguqkpLu7anVRLGK4rD3a+HyJKnBDa/XCr1QdXaUEROLymptZZVH8K
	iRqSk6jmWx+otmb3/bj95mfRCBtSjy6EX4yhA==
X-Received: by 2002:a17:903:2c0e:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2d0524c91c7mr101881205ad.44.1785761009849;
        Mon, 03 Aug 2026 05:43:29 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b1216bdsm37869825ad.69.2026.08.03.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:43:29 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 03 Aug 2026 20:43:24 +0800
Subject: [PATCH] phy: renesas: rcar-gen2: Fix double of_node_put on phy
 creation failure
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOuMcGoC/yXMQQ5AMBBA0avIrDWZViPiKmJBDcaiZIpIGndXL
 F/y8yMEEqYAdRZB6OTAq0/QeQZu7vxEiodkMGhKrLBQ4jpRE3mjtMURtXVDUVlI/SY08vW9mvZ
 3OPqF3P4O4L4f0rGeA20AAAA=
X-Change-ID: 20260803-rcar-gen2-140f014cd384
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785761006; l=1122;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=tnQVRiKHBbJMgYskau3aHnN0bLEXgSPq8Kdh08EQFXE=;
 b=Dtvb2UdTIMEbYUuPteA4CV5qm9tyMojbVJ/54PyUJ4b/tVVtCnK2SbzUZ+Xhxjf3yqchmGzzh
 2faWgB4i0y8BvFMYCg7LLc4GQu5haDAbQNbKUybtRElA2DHrSYzAp/c
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

for_each_child_of_node_scoped() releases the node reference on scope
exit, so the explicit of_node_put(np) in the devm_phy_create() error
path drops it twice.

Drop the redundant of_node_put() and let the scoped cleanup handle it.

Fixes: b64b32791fb5 ("phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/renesas/phy-rcar-gen2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 6c671254c625..5a272e25e051 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -405,7 +405,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 						   data->gen2_phy_ops);
 			if (IS_ERR(phy->phy)) {
 				dev_err(dev, "Failed to create PHY\n");
-				of_node_put(np);
 				return PTR_ERR(phy->phy);
 			}
 			phy_set_drvdata(phy->phy, phy);

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-rcar-gen2-140f014cd384

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

