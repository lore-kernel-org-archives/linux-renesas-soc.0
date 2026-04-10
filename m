Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4BA7E792
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826977; cv=none; b=D6Wu3+6QigQSpaIFkTo9HomMKqY51idXH2DGHRKXDJAH+L+K1mmRqc/vN2BE4OG/HEr29TRHOu5dPJ8QSpZjMhKUhznNsPqeOSaEPgHmBI2ZGNySOyZBbLHr77ZRLDEdhwKoztKC56TSiabwocDNNpeMT0MZZVX+V/WfEgcG52A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826977; c=relaxed/simple;
	bh=DiaDuE05fiTL0ROA2sT8a6cVS4ijB2qulbaDf3/eqSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vv4QS7w3R7YzcgiaDGEx3Z+C2eTSndxy8ThiCLabn1c3UgWC4Rb8uPs294bLVwNc9rjiPVe3dloB3wsZqMzYFUC8HK4JO7xbbKSSLgi0LQNc6Qym1MPB6eCkqvaQ/HMJ9KPe5suHd8MgbpdkpCgom+e+rKc3OE/0IKmtnxUV+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OUUdMbTf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OUUdMbTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=C4y9THavzv8CFn
	Pnx2dywc2t/WMh0cEtD8CCJXJwDFM=; b=OUUdMbTfDdVbxcmzCnInga1CO5AXQB
	5UiN1yk4xL5SMrKjfvowH5uDjRajsBjjlC+04RfSnWJ2g2JkDD44xMOGHS8wf8o8
	XVzuSB3VIbWN/FAv0QneVOWKboI7w/HycgsHm/ZqF1qQMrkcjy9WzmBQrqAf4I2/
	fdZTbZ/2Y7sGJxSED17NZyG/UH+iurFy2Z1XllvyByv18FN8TXuDwjeEHno8fdMg
	RjEe98cta1ULyTsQn/1GTPtqtINnq8cYoPbznzPiCQnFVEtxjUxxc4dVtcXy5vi6
	gPsErt0tZRA0+hIgKxsyXkPGO7g5BpqUxd/01JmSvEAKJbPlFPqjXfPw==
Received: (qmail 1257029 invoked from network); 10 Apr 2026 15:16:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2026 15:16:13 +0200
X-UD-Smtp-Session: l3s3148p1@NKXj7xpPB7FUszZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mailbox: add list of used channels to debugfs
Date: Fri, 10 Apr 2026 15:15:03 +0200
Message-ID: <20260410131604.42267-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During development, it is useful to see which mailboxes are currently
obtained. Use a seq-file in debugfs to list the currently registered
controllers and their used channels. Example output from a Renesas R-Car
X5H based system:

189e0000.system-controller:
   0: c1000000.mailbox_test_send_to_recv
   1: c1000100.mailbox_test_recv_to_send
 128: c1000100.mailbox_test_recv_to_send
 129: c1000000.mailbox_test_send_to_recv
189e1000.system-controller:
   4: scmi_dev.1
   5: scmi_dev.2

Note that mailbox controllers currently can be instantiated at any
initcall stage. So, per-controller debugfs handling was discarded
because it is not clear when to create the root "mailbox"-debugfs entry.
A central file was chosen, similar to the GPIO subsystem, which is
independent of the initcall stage because it will be accessed only when
userspace is available anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox.c | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 30eafdf3a91e..15b220991632 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
 static LIST_HEAD(mbox_cons);
@@ -633,3 +635,52 @@ int devm_mbox_controller_register(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_mbox_controller_register);
+
+#ifdef CONFIG_DEBUG_FS
+static void *mbox_seq_start(struct seq_file *s, loff_t *pos)
+{
+	mutex_lock(&con_mutex);
+	return seq_list_start(&mbox_cons, *pos);
+}
+
+static void *mbox_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	return seq_list_next(v, &mbox_cons, pos);
+}
+
+static void mbox_seq_stop(struct seq_file *s, void *v)
+{
+	mutex_unlock(&con_mutex);
+}
+
+static int mbox_seq_show(struct seq_file *seq, void *v)
+{
+	const struct mbox_controller *mbox = list_entry(v, struct mbox_controller, node);
+
+	seq_printf(seq, "%s:\n", dev_name(mbox->dev));
+
+	for (unsigned int i = 0; i < mbox->num_chans; i++) {
+		struct mbox_chan *chan = &mbox->chans[i];
+
+		if (chan->cl)
+			seq_printf(seq, " %3u: %s\n", i, dev_name(chan->cl->dev));
+	}
+
+	return 0;
+}
+
+static const struct seq_operations mbox_sops = {
+	.start = mbox_seq_start,
+	.next = mbox_seq_next,
+	.stop = mbox_seq_stop,
+	.show = mbox_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(mbox);
+
+static int __init mbox_init(void)
+{
+	debugfs_create_file("mailbox_summary", 0444, NULL, NULL, &mbox_fops);
+	return 0;
+}
+subsys_initcall(mbox_init);
+#endif	/* DEBUG_FS */
-- 
2.51.0

