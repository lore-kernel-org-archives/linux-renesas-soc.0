Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA9CC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:04:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BFAC20844
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfAVKEE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 05:04:04 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:50142 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbfAVKED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 05:04:03 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id TN401z00K3XaVaC06N40hU; Tue, 22 Jan 2019 11:04:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1glsuW-0000Tm-H9; Tue, 22 Jan 2019 11:04:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1glsuW-00033g-EQ; Tue, 22 Jan 2019 11:04:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: rcar: Fix clients using i2c from suspend callback
Date:   Tue, 22 Jan 2019 11:03:57 +0100
Message-Id: <20190122100357.11712-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When doing s2idle/s2ram on Salvator-X(S):

    WARNING: CPU: 2 PID: 971 at drivers/i2c/i2c-core-base.c:1869 __i2c_transfer+0x608/0x910
    CPU: 2 PID: 971 Comm: s2idle Not tainted 5.0.0-rc3-arm64-renesas-01306-g29a4a00795034c7f #155
    Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
    pstate: 20000005 (nzCv daif -PAN -UAO)
    pc : __i2c_transfer+0x608/0x910
    lr : i2c_smbus_xfer_emulated+0x158/0x5b0
    sp : ffff000011f8b760
    x29: ffff000011f8b760 x28: 0000000000000000
    x27: 0000000000000000 x26: ffff8006fa93f088
    x25: 0000000000000001 x24: 0000000000000001
    x23: ffff000011f8b830 x22: 0000000000000002
    x21: ffff000010e23000 x20: 0000000000000000
    x19: ffff8006fa93f088 x18: 0000000000000400
    x17: 0000000000000001 x16: 0000000000000019
    x15: 0000000000000400 x14: 0000000000000400
    x13: 0000000000000000 x12: 0000000000000000
    x11: 0000000000000000 x10: ffff000010e23708
    x9 : 0000000000000000 x8 : 0000000000000001
    x7 : 000000000000004f x6 : ffff000011f8b996
    x5 : 0000000000000002 x4 : 0000000000000001
    x3 : 0000000000000001 x2 : 0000000000000002
    x1 : ffff000011f8b830 x0 : ffff8006fa93f088
    Call trace:
     __i2c_transfer+0x608/0x910
     i2c_smbus_xfer_emulated+0x158/0x5b0
     __i2c_smbus_xfer+0x17c/0x818
     i2c_smbus_xfer+0x64/0x98
     i2c_smbus_read_byte_data+0x40/0x70
     cs2000_bset.isra.1+0x2c/0x68
     __cs2000_set_rate.constprop.7+0x80/0x148
     cs2000_resume+0x18/0x20
     dpm_run_callback+0x74/0x330
     device_resume_early+0xd4/0x120
     dpm_resume_early+0x158/0x4f8
     suspend_devices_and_enter+0x36c/0xd98
     pm_suspend+0x628/0xaa0
     state_store+0x88/0x110
     kobj_attr_store+0x14/0x28
     sysfs_kf_write+0x4c/0x70
     kernfs_fop_write+0x134/0x208
     __vfs_write+0x30/0x180
     vfs_write+0xa4/0x1b0
     ksys_write+0x60/0xd8
     __arm64_sys_write+0x18/0x20
     el0_svc_common+0x74/0x128
     el0_svc_handler+0x24/0x80
     el0_svc+0x8/0xc
    irq event stamp: 0
    hardirqs last  enabled at (0): [<0000000000000000>]           (null)
    hardirqs last disabled at (0): [<ffff0000100dfe44>] copy_process.isra.6.part.7+0x424/0x1c78
    softirqs last  enabled at (0): [<ffff0000100dfe44>] copy_process.isra.6.part.7+0x424/0x1c78
    softirqs last disabled at (0): [<0000000000000000>]           (null)
    ---[ end trace 6be6f172c203362d ]---
    dpm_run_callback(): cs2000_resume+0x0/0x20 returns -108
    PM: Device 2-004f failed to resume early: error -108

On second resume, the sound driver fails with:

    cs2000-cp 2-004f: pll lock failed
    rcar_sound ec500000.sound: can't use clk 1

As the CS2000 clock driver needs to send I2C messages during suspend,
the I2C controller driver should be suspended later, and resumed
earlier.  Fix this by using the noirq sleep ops instead of the normal
sleep ops, which are called after the late sleep ops, as used by the
CS2000 clock driver.

Fixes: 18569fa89a4db9ed ("i2c: rcar: add suspend/resume support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The various I2C drivers seem to use a mix of normal, late, and noirq
sleep ops.

For this particular use case, both the late and noirq sleep ops work,
but that may depend on link order.

Given the comment about wake-up sources in commit 57186fe3db3ec462
("i2c: exynos5: Properly use the "noirq" variants of suspend/resume"),
perhaps all of them should use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() instead?
---
 drivers/i2c/busses/i2c-rcar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 1d6390eed861aea3..d6c0f50a6dabce99 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1034,7 +1034,9 @@ static int rcar_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rcar_i2c_pm_ops, rcar_i2c_suspend, rcar_i2c_resume);
+static const struct dev_pm_ops rcar_i2c_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend, rcar_i2c_resume)
+};
 
 #define DEV_PM_OPS (&rcar_i2c_pm_ops)
 #else
-- 
2.17.1

