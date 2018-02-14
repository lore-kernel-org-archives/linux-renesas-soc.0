Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:53328 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967729AbeBNNN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 08:13:58 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Alexander Graf <agraf@suse.de>
Cc: qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] device_tree: Increase FDT_MAX_SIZE to 1 MiB
Date: Wed, 14 Feb 2018 14:13:55 +0100
Message-Id: <1518614035-9907-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It is not uncommon for a contemporary FDT to be larger than 64 KiB,
leading to failures loading the device tree from sysfs:

    qemu-system-aarch64: qemu_fdt_setprop: Couldn't set ...: FDT_ERR_NOSPACE

Hence increase the limit to 1 MiB, like on PPC.

For reference, the largest arm64 DTB created from the Linux sources is
70 KiB large (93 KiB when built with symbols/fixup support).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Enlarge from 128 KiB to 1 MiB, as suggested by Peter Maydell.
---
 device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index a24ddff02bdd857c..9eb5fae7381fe885 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -29,7 +29,7 @@
 
 #include <libfdt.h>
 
-#define FDT_MAX_SIZE  0x10000
+#define FDT_MAX_SIZE  0x100000
 
 void *create_device_tree(int *sizep)
 {
-- 
2.7.4
