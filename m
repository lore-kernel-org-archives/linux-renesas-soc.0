Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64AB37B01C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411770; cv=none; b=fvT98um1hKZ/Lxn2zTk8xnynqC+/FK048L3FO45BOlZnxpJhEPSsFd3Rof6gjAGLBJz+M32yHLc7xCz+ml8CMxzvWUxSnk+ur22E595OHLZS9gMOD2kFI7YiEjlEOiyYCImY77leMBYD4om4Qi0T3MRG7vgjmuvJMNs8srGVFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411770; c=relaxed/simple;
	bh=PdR0t6PIPrfwC1VtD4zPq/c3A3Hha66LQa/sH7nzyas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSg6KH1h1AaIfrrw+PD9ghDKmOrJ1ai5KXr+8oOqWS+fKCzIpaU3A7XXjRLcLsSz0jn4zupd/sJD9YdzDWvLQYJdjE4L5ZvRnvZpkjB9/caGsgfBltqXQJR2A+PoHATes2ZnaRH4OTC0NIzCawzPCRg7sWo3GYmn05vmdH0zIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=icPlPV29; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="icPlPV29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ttbAflTbp0B7HiuzcNLymn4toX13Ln+9145vIJ0/gvE=; b=icPlPV
	294iKY0rGL9nJyKu+N15xmZS6foDslcev9dSOFRbvlMxBoHm42zavsSUR82jJ0ie
	QMT5ZQHuNQe9AqRGVWBHsm6HzQZfExifJB+y4FLATq4dQKLyOIL8jYpOFFM0Y0z6
	4lRDvILfzeo5BO+QRc5DI5bvCV0JQm4OYMYAcJJJ9R4E0a+MPZ9mpAOXRKvF5sdu
	UPWTHB4eq54DELoBKz8aJ7+AOM9t61LLClZEmY3thbrICXXBYrzM46e5BY7a4aX5
	vyjnPmKt7V//KDmGivBccU4bnru6X0WjKdO6l3UkKfT+5I16doe6snag3CcK8B/f
	5sPmFPohXQCWCCYg==
Received: (qmail 3856016 invoked from network); 17 Apr 2026 09:42:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:42 +0200
X-UD-Smtp-Session: l3s3148p1@paURGKNP6lltKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 3/4] mailbox: mailbox-test: initialize struct earlier
Date: Fri, 17 Apr 2026 09:42:35 +0200
Message-ID: <20260417074237.16053-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
References: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The waitqueue must be initialized before the debugfs files are created
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

