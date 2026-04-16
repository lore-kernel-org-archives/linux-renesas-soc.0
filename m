Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF323845BD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340077; cv=none; b=JnMzz4m2q2QOBEBfx5hGXd2+tOcKC4JgkJYJm0V4NgKAwZ/GR/9+TaSug0j0bY2o4CCYyan3/kucWJMX+yedz9CxxhGFTrBAw0Qme7VZW0GV5LChYKcWnEGqpTIHy1cf+umpe9AM80engf/VSYecMbTjLYUvEsgMctqJG77rCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340077; c=relaxed/simple;
	bh=/VIfZsa4oqyvmID8SKfKFqPFfjVeD2x58CXni9M1Crs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSLK2kkCrLlAJsoiqHcrIQrlapr8wVdZoYHYOpdLQkfvBqr0WJPUMnR9LsFfHCLk0ygH107dz81c5I/dRU9GPGFGGbGXfvxX7aOI9BNiUPqns7x4Jb0ddUshshUDyWlG4Hsvw3InbEO2oZ20403lsvbgY8FWiXBpSXfE5Difs8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VBuMy9uz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VBuMy9uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3oA7U2aq32kQK/yDgGBbgWts3bDU59r35/25VsRfZmI=; b=VBuMy9
	uz4to9Mxx51cOH/87ox5tSk8JCWgc8Zx8uAtdutc6wsBcjfIWa63PKE4Iwyqe0Ky
	RE6mGH8A3PrhGJshXfs3Mm0tIM8+cQtSKCDNidkW1pfroixXzd4aCtoMFtyXdppm
	eBArREML1QR+7UX6qybuGtQqRZgqWzHYaF/Qc2z8PmchtJZpC29NhzwnEQg0a1lx
	cOWypFdkypIaqx+7sVj8O8k86q2MNh7ro7iNHPLvh1qq1fwgVGBbN8evpb9I512+
	I+AKtVZ49eZ0R0qNm3JKdcpoIo0wnrGW1LXDTjtkFtYPnVZtuJkI3x7HsWneISUQ
	u3JMFqkUhlV7xjgA==
Received: (qmail 3513159 invoked from network); 16 Apr 2026 13:47:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2026 13:47:48 +0200
X-UD-Smtp-Session: l3s3148p1@CrDAZpJPToEujnvW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 3/3] mailbox: mailbox-test: initialize struct earlier
Date: Thu, 16 Apr 2026 13:47:36 +0200
Message-ID: <20260416114737.36988-4-wsa+renesas@sang-engineering.com>
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

The workqueue must be initialized before the debugfs files are created
because from that time, requests from userspace can already be made.
Similarily, drvdata and spinlock needs to be initialized before we
request the channel, otherwise dangling irqs might run into problems
like a NULL pointer exception.

Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 0a56b593fcac..ec591616fe46 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -382,6 +382,12 @@ static int mbox_test_probe(struct platform_device *pdev)
 	if (!tdev)
 		return -ENOMEM;
 
+	tdev->dev = &pdev->dev;
+	spin_lock_init(&tdev->lock);
+	mutex_init(&tdev->mutex);
+	init_waitqueue_head(&tdev->waitq);
+	platform_set_drvdata(pdev, tdev);
+
 	/* It's okay for MMIO to be NULL */
 	tdev->tx_mmio = mbox_test_ioremap(pdev, 0);
 
@@ -400,12 +406,6 @@ static int mbox_test_probe(struct platform_device *pdev)
 	if (!tdev->rx_channel && (tdev->rx_mmio != tdev->tx_mmio))
 		tdev->rx_channel = tdev->tx_channel;
 
-	tdev->dev = &pdev->dev;
-	platform_set_drvdata(pdev, tdev);
-
-	spin_lock_init(&tdev->lock);
-	mutex_init(&tdev->mutex);
-
 	if (tdev->rx_channel) {
 		tdev->rx_buffer = devm_kzalloc(&pdev->dev,
 					       MBOX_MAX_MSG_LEN, GFP_KERNEL);
@@ -419,7 +419,6 @@ static int mbox_test_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free_chans;
 
-	init_waitqueue_head(&tdev->waitq);
 	dev_info(&pdev->dev, "Successfully registered\n");
 
 	return 0;
-- 
2.51.0

