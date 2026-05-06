Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3836E496
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051505; cv=none; b=ecgWiN8zmS3As1/cj2ZvYAgfWmr850zjt05un+oDUobPyTg1elRK/af8gvUVd6cVGXVHrEOsRBV68LtW39V/v+fw++nTIPlq6+CwuCk/Zcywe6NICoFoStNI2f7XwiXs5T+lmPka5EaoqEIAnqNv7gBlx7Q2gDtCM7GCr9hStTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051505; c=relaxed/simple;
	bh=10neDbhblG1//qoHC35Hxr+5t29WiZR0KczoM+q5JvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBUk9Y9NPTK7Wsnj3CGHemkvn3jzxbBUbnDL7ELkD9pmqASXEpm9HywoDfCKhxcFSM8jUzKFu5EECcVVvS0jZ8W29tzOjIwJLUkQJ15OXiqgFroHQAp9ZL6aGma7wrkC2nAqOnAZUPVaJs+KMO5rU0Y0FxCOlevey5RVPbBS5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K4bIQYxt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K4bIQYxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=BA5LlGEfCKaqnm
	80+ReCofkFUnXmdPl9UR+EZq47Hos=; b=K4bIQYxtC4t4rAe0G8G39TmUBcqAo2
	m5Ie4qVFGXyf/a4gwpRzJ6Us/A8D+9If+d9P+PtaPOxb+amvAnEXG+yrkQNZWJLa
	laLsC8EnaYwAgRT64Cue0CkNiqmcLLyjpnytQ9pi0QbFTJfGoFF6RWaXYm5zSPM/
	B51l8GXVcsasgPw2iWGO7pgR4VtnBDstBgC9d4VJTvNKNgbHy9Y6jQNkGBsNOQ3B
	VgCIUNF3kp1hDr+zBHnjVdOkKENJBJWGmfWkkTQLe/vhf1/eukDF5z8npQmjCQ+h
	3EftWFYYcDApqQYwjMJgwT4atf9jxLQJAQCtSDMVWGrcKatDeYTkpPLg==
Received: (qmail 579968 invoked from network); 6 May 2026 09:11:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2026 09:11:32 +0200
X-UD-Smtp-Session: l3s3148p1@DVKX3yBRmqYujnsj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: [PATCH v3] mailbox: don't free the channel if the startup callback failed
Date: Wed,  6 May 2026 09:09:47 +0200
Message-ID: <20260506071128.4114-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the optional startup() callbacks fails, we need to clear some states.
Currently, this is done by freeing the channel. This does, however, more
than needed which creates problems. Namely, it is calling the shutdown()
callback. This is totally not intuitive. No user expects that shutdown()
is called when startup() fails, similar to remove() not being called
when probe() fails. Currently, quite some mailbox users register the IRQ
in startup() and free them in shutdown(). These drivers will get a WARN
about freeing an already free IRQ. Other subtle issues could arise from
this unexpected behaviour.

To solve this problem, introduce a helper which does the minimal cleanup
and use it in both, in free_channel() and after startup() failed.

Link: https://sashiko.dev/#/patchset/20260402112709.13002-1-wsa%2Brenesas%40sang-engineering.com # second issue
Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* moved helper function up and made it static (buildbot)
* rebased to v7.1-rc2

 drivers/mailbox/mailbox.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index bbc9fd75a95f..006ea5a5c320 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -327,6 +327,19 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 }
 EXPORT_SYMBOL_GPL(mbox_flush);
 
+static void mbox_clean_and_put_channel(struct mbox_chan *chan)
+{
+	/* The queued TX requests are simply aborted, no callbacks are made */
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		chan->cl = NULL;
+		chan->active_req = MBOX_NO_MSG;
+		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+			chan->txdone_method = MBOX_TXDONE_BY_POLL;
+	}
+
+	module_put(chan->mbox->dev->driver->owner);
+}
+
 static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 {
 	struct device *dev = cl->dev;
@@ -350,10 +363,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 	if (chan->mbox->ops->startup) {
 		ret = chan->mbox->ops->startup(chan);
-
 		if (ret) {
 			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-			mbox_free_channel(chan);
+			mbox_clean_and_put_channel(chan);
 			return ret;
 		}
 	}
@@ -495,15 +507,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (chan->mbox->ops->shutdown)
 		chan->mbox->ops->shutdown(chan);
 
-	/* The queued TX requests are simply aborted, no callbacks are made */
-	scoped_guard(spinlock_irqsave, &chan->lock) {
-		chan->cl = NULL;
-		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
-			chan->txdone_method = MBOX_TXDONE_BY_POLL;
-	}
-
-	module_put(chan->mbox->dev->driver->owner);
+	mbox_clean_and_put_channel(chan);
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-- 
2.51.0

