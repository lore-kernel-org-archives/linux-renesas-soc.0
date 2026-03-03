Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5437C926
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566304; cv=none; b=C8PXUjbGRzsSdDHy7c3gVkpVmZwYHxjc+7FdMPbnB8MaM5teX1+3NwXNhZcvt63rZnYF5Uwi417E9/S0tZFhO9K5vCPy3aoEOkpMCBwGsEd7aAfBz4llcHzVbj776Oaz0YadvcNScPCAiv+57w2ZuP/krUUSRTjYUnoLzZ0LRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566304; c=relaxed/simple;
	bh=s4yz1qknYsovhomq/cNB/wPtjPAk3MtjAzmSsKjp3rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geGwqJPIT9VcDEG6ERK+VdQnUm+rtrg44mzbpRi7MUA36+M3l5sorb1iRdYjlB3cSTumnLhNYeLBIVzRQf3G9t97mHljNng/bUpym0V42CDu/0txzGxMjli4WgvJWxoR6hFlAoF4IXcUwnkCjrvgos3Wh8+F/J5/buljrdGnc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C4VedzTg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C4VedzTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9wsX/1VG+KmMW/70MpWHcnfgt2pNqZbpfdvHVMNyqlE=; b=C4Vedz
	TgnDCSnmKl5j4vr4rMs+Jgjf+wejQPMrfeThExRUCsQPPDKre63nC6b6UPkSbNTb
	ABuI0T6XBv5g9A5Q+fCQLovvBuSBfA5wZZRxeY10SdkgIXHTl7jhh+y5hevOmhoh
	n6i/vhUtATTsiqsAhigd1uaZCKtnFniF7FQbg6I5Y+hc70I9xF5uWrApUWiQ1nI8
	SZlCiqFUjhQ3aZj7iAqkqKNV3y2LYhGrXa7QKhfaHMAdMlxKMuEoUxx+9stIKUYr
	eCEzbRVoPxS3cL/tFNpSI9P5JEIZnveyyQbbsDClpi/W6gV6RF3gNYbm7tt0qeF0
	vwqvzIhgr+lEy9zg==
Received: (qmail 430477 invoked from network); 3 Mar 2026 20:31:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:27 +0100
X-UD-Smtp-Session: l3s3148p1@zwDjvyNM9qcujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 02/15] hwspinlock: remove now unused pdata from header file
Date: Tue,  3 Mar 2026 20:25:54 +0100
Message-ID: <20260303192600.7224-19-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
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
2.51.0

