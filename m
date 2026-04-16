Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713161A01BE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340077; cv=none; b=Ysd+IxJa7NI3llj2Fzj1dLhl0AIVAOt28hNRLsnqebGprr0xLwMiAcKGTPUGJ2EC+kaw8TSOZcWpVTlNBU/I+PZVdN6i7Dj7cC2eBWRJzFab9wwAJ/320ilq0oscgdaB/fYg014xaIHkUDN4zQ+dLyTwsQn2PM/OrlEn6QJOIbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340077; c=relaxed/simple;
	bh=IT+NlCmHLVTE6Bn99Sj8/QWHf+HwmtyMVzZ5DtwaRec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdodmBSOA/na1OfZ0vOFtPgFvggau1vU8/ByDGnxYJTJcxuMC57fKbaRjCxhmNQj16WEywAdU6k67/ZNC2nzXZ3QwBm63GDVtgdU8ek0dyeZXQc3aqJw6agKgybsMypearIGjyItW75+xmGcUivZ7zVLSoBw8/VUoAsjVCEEN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lSgLP+zP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lSgLP+zP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SZCi506zO5K3gJw2C+jH3iA+bc33710B+OJBYI7JFh4=; b=lSgLP+
	zPgW5ozqDjDIkVoGDAZvqkaXfmIbbohvJird26pkQ4sKn+2P6fgeXG/A2PDWCuI3
	+M4YB2ovMiYuNvOGzs41/ACyh2TGFduG0vIk/WifBEY1x9Qwgkvt4tgajMuGEq4q
	YCYJckGrSnWIzZb+yP3TAZIsDgBcQ/F7P0CO8wROTK1L83MpVkdLE3VkC2HFYrOf
	Mn8tkeqciUZK4R9sS9Qva6pYRKVzPEx5kExVDPYWPgJE/nnFAt8K40lDCcT4/f6h
	uC65H5/C2Gw9tmJCRsf010uG9EZqE+rOLc4fS4vhvsMyB34yu8SdAV+baXCdUjfI
	WqNQzWSvpIjOB0YQ==
Received: (qmail 3513090 invoked from network); 16 Apr 2026 13:47:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2026 13:47:46 +0200
X-UD-Smtp-Session: l3s3148p1@23mkZpJPMoEujnvW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Minjie Du <duminjie@vivo.com>
Subject: [PATCH 1/3] mailbox: mailbox-test: handle channel errors consistently
Date: Thu, 16 Apr 2026 13:47:34 +0200
Message-ID: <20260416114737.36988-2-wsa+renesas@sang-engineering.com>
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

mbox_test_request_channel() returns either an ERR_PTR or NULL. The
callers, however, mostly checked for non-NULL which allows for bogus
code paths when an ERR_PTR is treated like a valid channel. A later
commit tried to fix it in one place but missed the other ones. Because
the ERR_PTR is only used for -ENOMEM once and is converted to
-EPROBE_DEFER anyhow, convert the callee to only return NULL which
simplifies handling a lot and makes it less error prone.

Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Fixes: 9b63a810c6f9 ("mailbox: mailbox-test: Fix an error check in mbox_test_probe()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 5e68f708205c..daf4b6f27d11 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -336,7 +336,7 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 
 	client = devm_kzalloc(&pdev->dev, sizeof(*client), GFP_KERNEL);
 	if (!client)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	client->dev		= &pdev->dev;
 	client->rx_callback	= mbox_test_receive_message;
@@ -393,7 +393,7 @@ static int mbox_test_probe(struct platform_device *pdev)
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
 
-	if (IS_ERR_OR_NULL(tdev->tx_channel) && IS_ERR_OR_NULL(tdev->rx_channel))
+	if (!tdev->tx_channel && !tdev->rx_channel)
 		return -EPROBE_DEFER;
 
 	/* If Rx is not specified but has Rx MMIO, then Rx = Tx */
-- 
2.51.0

