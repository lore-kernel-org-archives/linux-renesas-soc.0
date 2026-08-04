Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6842FCDA;
	Tue,  4 Aug 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830514; cv=none; b=DNRnqEbzGvxnVwVlT2h/6ByXfRO2jH/2BseK2QcqF2mfBUkycAnHuziFZG/f7xoB28vhZHLYQUkKtIq7MtLhDkrthmVHYUmhNvOZpVJqynpbza9aIDVG4+Dy4zgsR0AjyXmMIwhq0usgsOd+OhPxvGtdG6l9djbARf5KA6Ofn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830514; c=relaxed/simple;
	bh=rMrulHIcxonWSbaAqZ3XRVAch9cm72s0Navi2WYu1T4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=htV7hki7IpCvR8cqMbwOB60k/G8LjQkho98e/100KUnud6a8phtATZXQb5Qj6h9BdUMyBROVnMbUCZ4aZfyqOsnM8pxCLhC8GmI8VnkR2w1eOF0h1I4zMpNnZJ2FMPgFF68yABJiX495pbZ9mEsu3f8CZ+7U68JnKi9vKSXpp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b97856108fda11f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:06757633-1992-4a87-b94c-4273af87387e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:9857d5b3b115e6258089169eafab1f3b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b97856108fda11f1aa26b74ffac11d73-20260804
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 743126441; Tue, 04 Aug 2026 16:01:40 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in rcar_gen3_phy_usb2_remove due to race condition
Date: Tue,  4 Aug 2026 16:01:36 +0800
Message-Id: <d265021fb7fe432e32eedbe9e075fb041c15cbe6.1785830417.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rcar_gen3_phy_usb2_probe, &channel->work is bound with
rcar_gen3_phy_usb2_work. rcar_gen3_phy_usb2_irq can schedule this work
on system_wq via rcar_gen3_device_recognition(), and the role sysfs
store can also schedule it via rcar_gen3_init_for_host() /
rcar_gen3_init_for_peri().

If we remove the device, rcar_gen3_phy_usb2_remove makes cleanup and
the memory allocated for channel with devm_kzalloc() is released by
the devm cleanup after the remove callback returns, while the work
mentioned above may still be pending or running. The sequence of
operations that may lead to a UAF bug is as follows:

CPU0                                      CPU1

                                          | rcar_gen3_phy_usb2_irq
                                          | rcar_gen3_device_recognition
                                          | rcar_gen3_init_for_host
                                          | schedule_work(&ch->work)
rcar_gen3_phy_usb2_remove                 |
device_remove_file(&pdev->dev,            |
                   &dev_attr_role)        |
// remove returns                         |
// devm cleanup: free_irq,                |
// kfree(channel)                         |
                                          | rcar_gen3_phy_usb2_work
                                          | // use ch (use-after-free)

Fix it by disabling the OTG interrupts, so the IRQ handler cannot
schedule new work, and canceling the work before the remaining cleanup
in rcar_gen3_phy_usb2_remove and the devm release of channel.

Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in interrupt")
Assisted-by: Codex:deepseek-v4-flash
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..fa0e680a4b91 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1067,8 +1067,16 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->is_otg_channel)
+	if (channel->is_otg_channel) {
+		/* Disable OTG interrupts so the IRQ handler cannot
+		 * schedule new work.
+		 */
+		rcar_gen3_control_otg_irq(channel, 0);
+
 		device_remove_file(&pdev->dev, &dev_attr_role);
+
+		cancel_work_sync(&channel->work);
+	}
 }
 
 static int rcar_gen3_phy_usb2_suspend(struct device *dev)
-- 
2.25.1

