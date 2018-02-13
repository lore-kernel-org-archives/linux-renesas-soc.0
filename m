Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:49662 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934210AbeBMQlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 11:41:25 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Alexander Graf <agraf@suse.de>
Cc: qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] device_tree: Increase FDT_MAX_SIZE to 128 KiB
Date: Tue, 13 Feb 2018 17:41:17 +0100
Message-Id: <1518540077-14481-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It is not uncommon for a contemporary FDT to be larger than 64 KiB,
leading to failures loading the device tree from sysfs:

    qemu-system-aarch64: qemu_fdt_setprop: Couldn't set ...: FDT_ERR_NOSPACE

For reference, the largest arm64 DTB created from the Linux sources is
70 KiB large (93 KiB when built with symbols/fixup support).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index a24ddff02bdd857c..1ba9b8e0a49e6bbc 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -29,7 +29,7 @@
 
 #include <libfdt.h>
 
-#define FDT_MAX_SIZE  0x10000
+#define FDT_MAX_SIZE  0x20000
 
 void *create_device_tree(int *sizep)
 {
-- 
2.7.4
