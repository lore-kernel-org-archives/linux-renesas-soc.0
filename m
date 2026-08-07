Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68262311C07
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786095082; cv=none; b=ZSZt0yBwQYgf17sf4yPcTIBpGkML0brEc6nE6CMSaZmseCf/VCIIafeK3Zel8mvdXBzPzMB8eRoPAF9VowW0Vch+it4pgy+DmfHe3pEXgGe5oX7SW3ICG+KKfqZQFXoGFFyy6ZWoPe7uRCjjC9NGR2OQxe2mMeCWFvBqSO2k/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786095082; c=relaxed/simple;
	bh=MCq7HOoAuj5C9pPHPU0fY8MT+3nCMaYzcNRl/D/Go2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zal8s0P+p9vcI37ovPsfzboW7EWU12YRbtKBn9NuZL1GZFFZqlDL6lV+r6B5ZZkCXRTxhQBipwTmhnk9OlMKOKYw0UwVfAPSsp8ttTisqGDoGkJB2pAqrY4xfGsZXzDQEBmUVWjaWo7ZBqQdQceM5EBVE8Nt05bvmloBq3CmWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejEVLqAt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejEVLqAt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso39821725ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786095081; x=1786699881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UtRGrc8i7gPdIHBxc2+2pdsu0ewzutkt0VHCMy4kXI=;
        b=ejEVLqAtp2+Y1cRkAjzDFJ3Jhsk4SREXZBvZEwVr8pb37tlBtjtDq+wqxpzMPUYxSD
         3N/gSzp7MUCmPk/PaMCbCS8QkvPxALW4O/nnu3IZ0n+PRRGOvSThoeEztTI700IiEVDa
         q1zpvZvPhgY6lMjkwKkhhSazPCx144xlROaLyH852p2tziaoiEe7hhbx/U3UW0IbhBaW
         hEytu4YeKOQZB4G1nr+WxrEJts89L2yktDWTW53Y+yAlFE+uBvmo6zC+5j63fAzxe3kz
         EVsvSRp5YcfXBzLDauUDJatxtDhcf0hEHj3ov2vKmPOmRv+KEyQNTF0Z1huWA/NmsMmx
         4m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095081; x=1786699881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UtRGrc8i7gPdIHBxc2+2pdsu0ewzutkt0VHCMy4kXI=;
        b=mZopGPR17T5EuJOnkt4SzCcpRpr160JCGBANg9JjA6q2s8k1yMpAvw3Yt2cyK/ARx1
         /nJzYD3gAZTrkksZ6RBnBsTuJ3zjgoOO4ENSt7wYwzaerereIM/X0Q0j7MF5jur1XjRv
         lY/U+gB/bBjOzjxiPNuKqiZS86k/qdGRnZi8PSslbPVLs4o74s5RVWGuSFw+PnXq2hHU
         09/wqljZ0tOM8QVClqxu6htrAoqWlDiJKthuxPbYs/LoDcfvsymBnU98+eyecqaUpuIs
         bQWx+BBbVdWpf3mKxcWJAiFOgc9VaY2Ec2wAPEXuP2GJdSqNFlq02K5kEFR8PmHJLqkc
         x5Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rrdjmls6A5FGYli8uc85lsEjBIV27wukGfX6et/HKVLU3uWElOilIecfVuZmbW0/o6RfrLFOjbCnwC0QDdjhsSZEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7ngeoSETCArBJhB0zm6TvwyeZlqBlWIxe6A00/U0D+t7BcKR
	0RuSzp474DzeiugeOAM+SkfZhdMfhamnZYmz6Lpu4ezwSedzUSMuUV3w
X-Gm-Gg: AR+sD13JK+fhnLvBd3ui3itCBnsMEAsZ/txn+RydCbZtoUiymJZtjN8KhH6IU/37iRQ
	ai10XqQZMetDg74Cqug5A7EtBKtAgy/xtYgxUI86IcGpK/izE43jyZyH1W6usxdiq5TJ3hfujOC
	e6aN5Ow+jCInj8l+AJbyUoUKHmJnyuLLI8G5KoMpdfgnWEWPIO5Rkzwru0d5Gw/IJLp9oXi6qVQ
	V/5P2oG0WjJ/f56uk8fzYheUwNXhfBeTxfUws0c65ufXexJ44YksH38IcUMEL1TAa6FIw1DBtGS
	OpQ6TtoEGDEVJQOJHNiKgx/6RxkRZm7gPXrRKndSC8/9Y3uht1+zlBe7Yslva/vjblsyr7lcJWg
	LJM2aUaHA49GODcxkr55ngvuMh2diiYTfVSPp0zr5vCr9WeDNDgHyG8v3V3J1rE2Wh0dD8tYJsx
	C/43xHLEUyTX+CAyqJayG/qkBano+FQ7pydg/cMxHhB1Eopb1zbpPfw3zMwxzcKYDzfs1nbKeqT
	LprD3xcT+dufG0k6i0dXXmtFkd24QJ1huqA1YrYJJdV3FVP1sxbCakQSfTP2zvQmssckoZX9/89
	jpRw
X-Received: by 2002:a17:903:18d:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d0ca759b87mr227230365ad.10.1786095080818;
        Fri, 07 Aug 2026 02:31:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd8f1bsm6347525ad.25.2026.08.07.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:31:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:30:57 +0700
Message-ID: <20260807093058.42840-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns -ENXIO when the optional IRQ is not
specified. Treat -ENXIO as a valid absence of an optional IRQ, while
propagating other errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 94804816e9e1..6204fb163ad7 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -491,7 +491,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 
 	for (i = 0; i < 2; i++) {
 		irq = platform_get_irq_optional(pdev, i);
-		if (irq < 0)
+		if (irq < 0 && irq != -ENXIO)
 			return irq;
 
 		irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
-- 
2.43.0

