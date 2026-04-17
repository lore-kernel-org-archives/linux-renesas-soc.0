Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D437A4AF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411766; cv=none; b=VCW3AmOzBjAPnmrsApNycg0pmGfU+3uhYUrPqdgz5KdbLGMFn491seeZUWNewJocmXN0T36K8P8/KayKToVgWLVYCZCkXHtaoQX4ZBTiNxJekkamRK4cfxjgVySET/n8zndlzAC+K/TW9X8eAQKCcw57IMkv7+z4rVDj7BUVrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411766; c=relaxed/simple;
	bh=+vgEkieG5Z9Qf+OlzIt61SgEsO/ihWEqCLPih5uvYOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uV2BWpcPU8CAr+PG9Wwhg+Ay2+a6or2ywCXq3C4XBVBdz46z/WLXvlwpuuGzNUiuSWKWuigd6vVLPvo4KDizCY/MlMMEq27kuhWmLyd4u9vDJsYCvfgGVDBJeWIWPoeVj+veguCWtCLVL/BjucAMOtbIdKjiiQxI8MVHjCnzGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FhGZsAw8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FhGZsAw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=23AIyKmewb4aRL/ytqe4GU7fSGbIP3y9jZWV3lvCF1o=; b=FhGZsA
	w8RADcwFHnzFmn2ZA5wZZkwI47UtlkP4L6rfwUS2hD38nULyaCVIm3L6vhQ6EW38
	b+GZKjnvEB5v/HhDqMgcEflrOgrk7CegJgxdb/WvTCwUVOaPGk8FBn9QvXLtamlY
	3VG/4Rrxon106cpSmkGryeIAWrlfReocEDleoLm4HdllhSjW7Ayb4JYbY3aeCT9M
	W1IgPrMXUMCp8GRjRbEn0TCgcVLFaDkvY7Liz7MokZ8wUrupaaQI3EtYGiywDOfc
	B6fz1q+yDWYi2v6mB1sASR3jI5HjGrBk10/Cp7k4NTUkduqS7ocxdGdk+fokglYG
	6n08ZPDnwmV3tthQ==
Received: (qmail 3855937 invoked from network); 17 Apr 2026 09:42:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@fcrzF6NPD1NtKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Minjie Du <duminjie@vivo.com>
Subject: [PATCH v2 1/4] mailbox: mailbox-test: handle channel errors consistently
Date: Fri, 17 Apr 2026 09:42:33 +0200
Message-ID: <20260417074237.16053-2-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

