Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B1383C83
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340077; cv=none; b=JU3/wO7KQ31OTemWaZmSOv+kvCfAjyVqJ//7jIuH0Rf3QtrqqauX9TroDhC02/U8uGNWdKEKjOdPObPxxEO4y9t0mnIrnOqfLQn2YiJf0CmMFhAywDhKx7uHbTSc8ECgqb8zzVIjd3DCAUlLlke9XnfCUtw0KZeiP3vyj4xmz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340077; c=relaxed/simple;
	bh=0q6zAkbE2SG9nRMwwFfGhKrIGBhyItuN03BV0g+m0p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNKqcPw+l2lZ7UF8rLgCHq8J4bP34A7vCZI8Vc/AthZEh1CQ5rQLMFmx08Tr4H3QwCqU85uSXpBUMTuCMkJGheSQZjaNyqZPQOjaNUvgUxiP32pE+/xktQbLqfodHzcmMxXfqVjtq1Y1yBD5WVmBjqB2QObe9gPehaRlS603jSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q4EWMAHj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q4EWMAHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9Q3+CBtz2OVL7c9MekVC9pbheFy+g+zG2ak1DrBaRRs=; b=Q4EWMA
	HjFJvcAKLLoFMT5IZ/cqH4ncz2ap6L2NidcfW8zgFADp6o0pa49NndVa+mE39kyl
	+K/iFhtvomIXVfmmAOhRBBNwnBj/m+UNPIlm/kn1iHzusi1iegiqwgEYkRu9SNVG
	2V8/9mww+eVfvGW6r1zlW5Gt7xq/3opFr80IJlN/FvUSWstW8MY6YBG1efOjrhQK
	5kxCMC20ZqSvBtnaVl6Xi1N/Ey6oOLAqgNJVEqEGLswWzD8S6EiOwDqv4U3HMy8P
	xfd7pJi2sO8fRlHQhBhb0XLn1TfC8oMq5evUs4LL4Xox9a3RIzF7P5vgJBfQuyM4
	R+TCactOibkfVhqQ==
Received: (qmail 3513129 invoked from network); 16 Apr 2026 13:47:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2026 13:47:47 +0200
X-UD-Smtp-Session: l3s3148p1@zlOwZpJPQIEujnvW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 2/3] mailbox: mailbox-test: don't free the reused channel
Date: Thu, 16 Apr 2026 13:47:35 +0200
Message-ID: <20260416114737.36988-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416114737.36988-1-wsa+renesas@sang-engineering.com>
References: <20260416114737.36988-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RX channel can be aliased to the TX channel if it has a different
MMIO. This special case needs to be handled when freeing the channels
otherwise a double-free occurs.

Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index daf4b6f27d11..0a56b593fcac 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -427,7 +427,7 @@ static int mbox_test_probe(struct platform_device *pdev)
 err_free_chans:
 	if (tdev->tx_channel)
 		mbox_free_channel(tdev->tx_channel);
-	if (tdev->rx_channel)
+	if (tdev->rx_channel && tdev->rx_channel != tdev->tx_channel)
 		mbox_free_channel(tdev->rx_channel);
 	return ret;
 }
@@ -440,7 +440,7 @@ static void mbox_test_remove(struct platform_device *pdev)
 
 	if (tdev->tx_channel)
 		mbox_free_channel(tdev->tx_channel);
-	if (tdev->rx_channel)
+	if (tdev->rx_channel && tdev->rx_channel != tdev->tx_channel)
 		mbox_free_channel(tdev->rx_channel);
 }
 
-- 
2.51.0

