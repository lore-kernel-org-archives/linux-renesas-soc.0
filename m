Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2631B6D08
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624347; cv=none; b=KLA7az33TcouggGvmzp4KXJKXjbYZPleEma5n+ctExpx/e/KZfTevCSS6Cpr2GsNmOnIqMoY4LfXtvwpsuNKBDazMPslXzyc1S/0ezOFtfVRYxUUt5+geoQ2Kl8whFXiKG94kz18RwhhUQsRrC/LshaYY+lzq+h4Yf75148E7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624347; c=relaxed/simple;
	bh=HHdSjwEbTpjaBXf84WCwY8CgCLYhS28Lil7UlO0QRQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyYk2flNBLxxQpSj/wjbss3mxnAep79saQFBUbVt2pSInC0G2URJjDVC7IkJNlx+azMhHmD3LFWOJPSTLMDZyTrSk3YyPrXi2BIsyjors3iJV60bbde3RB/qzO22byspyoI2/AcAhv9qXeJQ+mcarQx0exaUzx4++pp9OUBu6JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OQkd49Oh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OQkd49Oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=99dbmhpHf7K7wK
	GjEtEqs/Sc0hw12NRhJzCL9m6raLQ=; b=OQkd49OheMNlTuhn5uYEU2qjYuNcj4
	19p/3GtzFKFBvXhW0KiQ2kdGPShwjaM9VO0Yn1Ssb0WpdKzN7hq8m0+BIPitb+2X
	OSjE/0vTU+9KvULtv9sTLJmhJRjaGw3rttWVYFDrAB4L0Q/OBa4gmM35HolAtf0R
	Vt4MpnHZ4OjF6ldKAoL/611DhUisCXoMnOvLcFG7EKvXk1zRdamo+evv3lK40FZa
	T9Z/l4MoEyf70GcZIzlmcOvlcYgZG5BM+wUwUfMFtox3/ZoLthteaCYesTItqLSK
	DrxH8JDYBFyevBfKqVkCVDrG7AqtbACUSRTDpl1lzH/jwhhBv53SslOw==
Received: (qmail 235186 invoked from network); 27 Mar 2026 16:12:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 16:12:22 +0100
X-UD-Smtp-Session: l3s3148p1@a+l/7QJOP6ZUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] mailbox: test: really ignore optional memory resources
Date: Fri, 27 Mar 2026 16:11:44 +0100
Message-ID: <20260327151217.5327-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory resources are optional but if the resource is empty
devm_platform_get_and_ioremap_resource() prints an error nonetheless.
Refactor the code to check the resources locally first and process them
only if they are present. The -EBUSY error message of ioremap_resource()
is still kept because it is correct. The comment which explains that a
plain ioremap() is tried as a workaround is turned into a info message.
So, a user will be informed about it, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v4:
* rebased to 7.0-rc5
* add tag (Thanks, Geert!)

 drivers/mailbox/mailbox-test.c | 37 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3a28ab5c42e5..058c0fe4b9c2 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -355,11 +355,27 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 	return channel;
 }
 
+static void __iomem *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
+{
+	struct resource *res;
+	void __iomem *mmio;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, res_num);
+	if (!res)
+		return NULL;
+
+	mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (PTR_ERR(mmio) == -EBUSY) {
+		dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
+		return devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	}
+
+	return IS_ERR(mmio) ? NULL : mmio;
+}
+
 static int mbox_test_probe(struct platform_device *pdev)
 {
 	struct mbox_test_device *tdev;
-	struct resource *res;
-	resource_size_t size;
 	int ret;
 
 	tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
@@ -367,23 +383,12 @@ static int mbox_test_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* It's okay for MMIO to be NULL */
-	tdev->tx_mmio = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (PTR_ERR(tdev->tx_mmio) == -EBUSY) {
-		/* if reserved area in SRAM, try just ioremap */
-		size = resource_size(res);
-		tdev->tx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->tx_mmio)) {
-		tdev->tx_mmio = NULL;
-	}
+	tdev->tx_mmio = mbox_test_ioremap(pdev, 0);
 
 	/* If specified, second reg entry is Rx MMIO */
-	tdev->rx_mmio = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (PTR_ERR(tdev->rx_mmio) == -EBUSY) {
-		size = resource_size(res);
-		tdev->rx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->rx_mmio)) {
+	tdev->rx_mmio = mbox_test_ioremap(pdev, 1);
+	if (!tdev->rx_mmio)
 		tdev->rx_mmio = tdev->tx_mmio;
-	}
 
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
-- 
2.51.0

