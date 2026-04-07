Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109113A75AA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557043; cv=none; b=PrKeJLOaB/OAbfyqiVMfX60yEf74q7FpnDw59yAM4576bmgWjKCDWiv0OOjd3elcQ/CnzhyC90VD8bq8DU7P6GZxvf3tgtm2jlCpJJcAPyznL3W8shXiMcna8GJc81qE+h2w179BtnYTZ078o1FOzV+X87F+alN/+XYATw5caL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557043; c=relaxed/simple;
	bh=WzMTSA4hOrD9ewg7rAEHEJVvmQbWLf0BpIxMrdbzANQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/FcjBx0h4y4uEyGGavzkHiNkxO+Ejz/zuyTlPCMHL4w7Tmaz9I7an/2/4fXaxNegBp8KGmRmI4Yg7h4CJlricR9VviOvdnv4ivzmsDb6PUYkHu2YG4Q31Co5CU8k9AvacGa5sO+ExDrWHnpsgVZf6OyYGOeL+HQsz6ND6UnKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y4wLqoo9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y4wLqoo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=OGq+odBcPRpZvx
	ss1wi9faG05mqpWlKOElOyjMSQX6U=; b=Y4wLqoo90qoPyqK4le3/AMXzO9ykbt
	jvAeDwN2AIQ0gXl3cIezGHUBWkrilbb4iSwnjFngehnIycyGSP3Mki5Yeze4ZB50
	Nt5pBTY2THD7Q7eRk3jM8QFX6IrgdsXSaW/ElOIuPDFFAqmm37ewBVoeOFIqC90T
	4pCLpraVNbn+AULLr8nh+T7kB9ffGuUje/Z6/WDGWbwL/6AXFVE6Vb1Fu6famUTA
	0VdQmk9UARtgbo3gg2f8gcpFDdsWlrNF25KXeS1YG+JI2aliQEe/3U/WfpvS9oa3
	/gdNVjlSVWNF/tTPJM80uU4wnaKdnKP4FBad4kFCAsAPU8ZHdrKB5VXg==
Received: (qmail 4189844 invoked from network); 7 Apr 2026 12:17:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2026 12:17:17 +0200
X-UD-Smtp-Session: l3s3148p1@pmh0FtxOhroujns2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: [RFC PATCH] mailbox: don't free the channel if the startup callback failed
Date: Tue,  7 Apr 2026 12:13:11 +0200
Message-ID: <20260407101714.39990-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the optional startup callbacks fails, we need to clear some states.
Currently, this is done by freeing the channel. This does, however, much
more than needed which creates problems.

One thing is calling the shutdown callback. This is totally not
intuitive. No user expects that shutdown() is called when startup()
fails. E.g. quite some mailbox users register the IRQ in startup() and
free them in shutdown(). These drivers will get a WARN about freeing an
already free IRQ.

A second thing is that module_put is called. This should also not be
done when startup() fails. It breaks the expected symmetry that
request_channel() gets the module and only free_channel() puts it again.

To solve these problems, do only the required cleanups manually when
startup() fails and do not use free_channel() as a helper.

Link: https://sashiko.dev/#/patchset/20260402112709.13002-1-wsa%2Brenesas%40sang-engineering.com # second issue
Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch is RFC because I am still somewhat new to the mailbox
subsystem and might miss something. However, I think the Sashiko comment
in the above Link-tag is correct. I could reproduce the WARN with the
Renesas MFIS driver and injecting an error when obtaining the irq.
Looking at other drivers, I see this problem as well.

 drivers/mailbox/mailbox.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index a7a690acd90d..dcde4efa5be8 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -353,7 +353,11 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 		if (ret) {
 			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-			mbox_free_channel(chan);
+			scoped_guard(spinlock_irqsave, &chan->lock) {
+				chan->cl = NULL;
+				if (chan->txdone_method == TXDONE_BY_ACK)
+					chan->txdone_method = TXDONE_BY_POLL;
+			}
 			return ret;
 		}
 	}
-- 
2.47.3

