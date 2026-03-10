Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC21364E86
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129366; cv=none; b=KYCritxcEzkuCMyBCV39HL3OzKnO6333UM2F7bffdxvzPj1246TKASiB9j16QiJ2aTE4pi4xAPPLD4+rhhjSw28iufc8QQpLO+6HKBfuwV/9TuxWtMZqBx5c65xi9BNzM46bisv7eaBaeNuqrVjDSvKoJMakwnOZCJVBft7dP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129366; c=relaxed/simple;
	bh=NzPexpQeiqadjqeObMLphMshtxAmoA9bstBE15Mzb8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9bfDPej2AqlOq7frpbwpNE9bKwwVUEQXMTX6la6ibnEqSQinvFXceJ/8aI8xNbatuEfBp4Pgyj0XV5kwYyDxDhmVeK7CPhvFfeAmo1Hl7eNsgZvY1Pxy7rBn2OBocOvkQu1gKS65m/LVLsgqB9MJEQ7PqIS0q6Tzfu6z0leVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y1ZkUaoL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y1ZkUaoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0O02edZSieAasjS+spevR8oO5F5Dn3qakXZ4rFeyaVM=; b=Y1ZkUa
	oLiS4+kvBtrV91cZBWD523zEBhOIaUDO/eR/Y9+mg5b8gyYtKgtccYXdIXhLJwTJ
	VtQgSWHDcTi64dTx8Ecu6Fwx60zTWG1TRXLmRUBUXH/UTp75lFLvBugxRpXMTvLt
	hEyNz2MrnWIE7WcWMcexEGaMOC0bAhVifkoECCGgaQRWp/1UQLHP7RUWF0vWlYRV
	7OUvT31Xm7nxL5eNupx9T95pVxp1eyEdWSD8jLLt7YyppLnOkNGzm8WO9uGQByj7
	8qpFpab7DmNtfBtNBCAHm13PVH0RdyFeLu68wesURX4qikmu133irEDMJbcHDkC4
	SNHfG93BNlF76z4Q==
Received: (qmail 3112606 invoked from network); 10 Mar 2026 08:55:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:49 +0100
X-UD-Smtp-Session: l3s3148p1@6uj92KZMppAujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 02/15] hwspinlock: remove now unused pdata from header file
Date: Tue, 10 Mar 2026 08:55:17 +0100
Message-ID: <20260310075539.11701-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user turned out to be obsolete and was removed. Remove the
unused struct now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/hwspinlock.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..74b91244fe0e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -25,34 +25,6 @@ struct hwspinlock;
 struct hwspinlock_device;
 struct hwspinlock_ops;
 
-/**
- * struct hwspinlock_pdata - platform data for hwspinlock drivers
- * @base_id: base id for this hwspinlock device
- *
- * hwspinlock devices provide system-wide hardware locks that are used
- * by remote processors that have no other way to achieve synchronization.
- *
- * To achieve that, each physical lock must have a system-wide id number
- * that is agreed upon, otherwise remote processors can't possibly assume
- * they're using the same hardware lock.
- *
- * Usually boards have a single hwspinlock device, which provides several
- * hwspinlocks, and in this case, they can be trivially numbered 0 to
- * (num-of-locks - 1).
- *
- * In case boards have several hwspinlocks devices, a different base id
- * should be used for each hwspinlock device (they can't all use 0 as
- * a starting id!).
- *
- * This platform data structure should be used to provide the base id
- * for each device (which is trivially 0 when only a single hwspinlock
- * device exists). It can be shared between different platforms, hence
- * its location.
- */
-struct hwspinlock_pdata {
-	int base_id;
-};
-
 #ifdef CONFIG_HWSPINLOCK
 
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-- 
2.47.3

