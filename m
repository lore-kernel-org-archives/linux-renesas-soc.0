Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02B3126BF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399047; cv=none; b=Mc+OzMQ4s3DNXva2VwRstbiRk+DfRnmF6qdiX7GGGtqr/VUJEUd7infYpmsTGjOHLfTk8p9DhAUVcA82aeiks/We8XXJJYRUKfDnLRWzj5kcfs9NHuHdybLfU5/bFiRuZ8mAdlf7hjuraVX42pmlZGKmrKBvxK0/3KG8pLXgly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399047; c=relaxed/simple;
	bh=KhP2GxoaKBUddhUUFxIcQ+0rSXYucu+YJn8Kpli18Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bch1EKxtADFeWGoIO30ykpMZBCYH9/OZ8rQLOQuAzFXneiZoQb6Enj7m9UVBSzLL2WO+Eo/SLuc3GohT+yA3sOYL4WDtgIIlICscP6+cJ/SOauydmq34gvYaxdBNecztBNOn7+MgWJ46nNL6ZgrZmH2cPYMye0IZlCtJmc4kjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JSnzhXRs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JSnzhXRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PgqfI5mgd9JJku0cQp6++IDUvvklDtSGtjGrLhHCeQ0=; b=JSnzhX
	RsjiIGKbOnv9iYAtgVlPejgJ7EMGPfaSC21rCnEAq3760lW02qKXqd3VhRHw3/5K
	NaIRt9zhsU5LqoYQeKkGORIbf3hHHm1M6oxZFm2hh+W5ejpgymsHBFDeCausNOgQ
	MyWYqzIiDIkOCLaxHxuy+LfPBSCKRUOZpO1GnXc33qO1Kryqaq+Ll/KIAkBkxd0G
	jTLC2LFaBVZszGgRrMshYpHQvCxPxjdUV4XJRO2Ajx9KhK4x/NmvrLzqGQ2R1oaR
	5e80kH3NTMWn/lihM1pLVVAnzHPOL2WSIyritYZEMGuCDuK9yIerHqb/+s54udrl
	cisFZTd/SFUPfXAQ==
Received: (qmail 1821050 invoked from network); 18 Jul 2026 20:24:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2026 20:24:01 +0200
X-UD-Smtp-Session: l3s3148p1@Nfr+xuZWtsMujnu6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 1/2] soc: renesas: rcar-mfis: convert spinlock to raw_spinlock
Date: Sat, 18 Jul 2026 20:23:54 +0200
Message-ID: <20260718182355.50045-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718182355.50045-1-wsa+renesas@sang-engineering.com>
References: <20260718182355.50045-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the upcoming hwspinlock support for this driver, mfis_write() can
also be accessed from atomic contexts. Convert the spinlock guarding the
unprotect register to a raw_spinlock, so we will avoid potential
deadlocks with preempt_rt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/soc/renesas/rcar-mfis.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/rcar-mfis.c b/drivers/soc/renesas/rcar-mfis.c
index 3435c3e16198..c327a60789d0 100644
--- a/drivers/soc/renesas/rcar-mfis.c
+++ b/drivers/soc/renesas/rcar-mfis.c
@@ -50,7 +50,7 @@ struct mfis_chan_priv {
 };
 
 struct mfis_priv {
-	spinlock_t unprotect_lock; /* guards access to the unprotection reg */
+	raw_spinlock_t unprotect_lock; /* guards access to unprotection reg */
 	struct device *dev;
 	struct mfis_reg common_reg;
 	struct mfis_reg mbox_reg;
@@ -80,10 +80,10 @@ static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
 	unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
 			 ((mreg->start + reg) & unprotect_mask);
 
-	spin_lock_irqsave(&priv->unprotect_lock, flags);
+	raw_spin_lock_irqsave(&priv->unprotect_lock, flags);
 	iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
 	iowrite32(val, mreg->base + reg);
-	spin_unlock_irqrestore(&priv->unprotect_lock, flags);
+	raw_spin_unlock_irqrestore(&priv->unprotect_lock, flags);
 }
 
 /********************************************************
@@ -323,7 +323,7 @@ static int mfis_probe(struct platform_device *pdev)
 	if (!priv->info)
 		return -ENOENT;
 
-	spin_lock_init(&priv->unprotect_lock);
+	raw_spin_lock_init(&priv->unprotect_lock);
 
 	ret = mfis_reg_probe(pdev, priv, &priv->common_reg, "common", true);
 	if (ret)
-- 
2.47.3

