Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078A946A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081707; cv=none; b=IIa9LsmQlbIhvEvQgaw2CRIVoT8FZGH5c5v/cOBtea+ALq0wZcwCQVjSFiqvXnK3kkUmn6qT+5xbjCmIrn0hq+4ZW441GRb0gC13w+/WEoWyxjVSHDCjMFc8WBJssVeQfcT2Kn+VZAde4RRSzMDbBZwi2D57HKPDGcECAo4rMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081707; c=relaxed/simple;
	bh=rXeAs+pxXWhQLsfwth7Q5G2j6R0vKHmr919a4IRuB5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/9Ey5/THCUUcZshW5sb6/uUL3CUp//zuf4F9WT+lzm2oZa6VUv8RyR1XDX9EqgTHlbWFa4d2ePL32EQhrdDN7Gk/zwGzWS2/wgz7Df4Dqw3MXzaC5bfvzz7A/B+p2MlbHFL2mYT6mVbJ1xipDrNSuMX8wbxxQ4PQJXVmMcKw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fbOGQr7o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fbOGQr7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zCrjZ2kxQ8gV8Q
	SJ8ayX8lL/M6i1tXw+LcC/RYBjBfU=; b=fbOGQr7oyjlq3kBrYllO5Pvc8YdbI4
	rtA7spjcfCrsyxpGnGehaY0bF+VDm8SzcsBnLVP0kPJdyGmD2Wx16UgoOrm3+8bj
	l+oMsIBYqiPD3I79M4oOKg4BGvwoGAIwnBvMoGRWhdm+8HfG7j8vql+lDzXwMJbM
	zzKUzirICe3AfvSWtEfdukysnvu6XWVf3Exe3nVrLg3td21H52I7tniSrDUlAIpp
	guRXlFyejRkn3mWGKtquw26HzBKecghKW9TM6vykmErzH4xWLJV/CXl9TbJ+zSuS
	M8gTfqTOqwUazch/UEQm4nfRpnvE9YZRqTFL50dgG8KGymWsfK4zX0xg==
Received: (qmail 2282743 invoked from network); 13 Apr 2026 14:01:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 14:01:43 +0200
X-UD-Smtp-Session: l3s3148p1@Z6UCP1ZPOKgujnvz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v3] mailbox: add list of used channels to debugfs
Date: Mon, 13 Apr 2026 14:00:30 +0200
Message-ID: <20260413120139.36287-2-wsa+renesas@sang-engineering.com>
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

Changes since v2:
* rebased on top of linux-next
  (used the wrong branch previously, I am sorry about that!)

 drivers/mailbox/mailbox.c | 57 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 138ffbcd4fde..d3a29e361f33 100644
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
@@ -633,3 +635,58 @@ int devm_mbox_controller_register(struct device *dev,
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
+		scoped_guard(spinlock_irqsave, &chan->lock) {
+			if (chan->cl) {
+				struct device *cl_dev = chan->cl->dev;
+
+				seq_printf(seq, " %3u: %s\n", i,
+					   cl_dev ? dev_name(cl_dev) : "NULL device");
+			}
+		}
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

