Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B23783D3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411766; cv=none; b=nJDrHo+HHcdeDooRDfwao6/XiIJUEanGh6ofCF/OKXjsaqWO3kve9rqZQ6Fbd3yfnJQ4K4+Pr6vTSq+pOETgCEA9O050KdPiC1qj9bx1N5om6SakOVGNiyYKhHq9cGUGobfV17ESa9yPP3yGNwk39hQE93QiIBi2xeDsjU+2Xww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411766; c=relaxed/simple;
	bh=0q6zAkbE2SG9nRMwwFfGhKrIGBhyItuN03BV0g+m0p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ob9ZHcvFD6F0cEJ9s83/SzXNS6ezXuxXDRA7i9NqXxFh4Qz7Ep621nUpOFr8ZqmO2oHFq2xaYBr+5yL9uzC8HLwsBKAeYW/cSDHiKlJXSqhjgiY8WJYMeW6Kl6h9eq6EMSx91Ki+UuBvBbg3/q6J9RlpNT3ue9YgF8dBEx+mgbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DDiekaWM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DDiekaWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9Q3+CBtz2OVL7c9MekVC9pbheFy+g+zG2ak1DrBaRRs=; b=DDieka
	WM7/PDEVBv61eBVusqtwcM6Tp9BUhO8icFimvm8uHOtM6BmMoftLpKp+cZkxZAuE
	f+YYENuhbGJmrxKsq9elBd9SGZJzG3nXCLf9Jh5mLh5XKr3tSVa0QRjEncm+s79m
	6aFqnNqNXpXmhPUdE2xTSDjo1p9OIfhN4yiBQhU2PgYSEQED57oy7VlNrXn9t77U
	wKvljkrt1laisGquBkoZ7yF4p/adpCQvhOzT77cAwDa4A3a8Y5cH51Csn2lpUaH/
	Q47Su6nmgXz++9rpM0DAWqBbS23qb9wo6QeXd7X1FPpqNTpSsf4+FZutztHT++Dq
	m8fW8CMtvc6cjLNw==
Received: (qmail 3855983 invoked from network); 17 Apr 2026 09:42:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:41 +0200
X-UD-Smtp-Session: l3s3148p1@NNsCGKNP6jxtKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 2/4] mailbox: mailbox-test: don't free the reused channel
Date: Fri, 17 Apr 2026 09:42:34 +0200
Message-ID: <20260417074237.16053-3-wsa+renesas@sang-engineering.com>
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

