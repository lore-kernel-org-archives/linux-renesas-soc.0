Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58382 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbeLAAEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 19:04:10 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>,
        Chris Ball <chris@printf.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH mmc-utils] use proper type for RPMB blocks_cnt
Date: Fri, 30 Nov 2018 13:54:47 +0100
Message-Id: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The JEDEC standard is confusing. The number of max blocks for reading
RPMB is determined by CMD23 which can hold an unsigned int and not only
u16. It is true that the current maximum is 64K of blocks, yet this may
be extended in the future. Let's not apply a limit here which should be
checked by the card.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

It is a bit academic, since we will be limited by MMC_IOC_MAX_BYTES in the
kernel anyhow. Still, because this is a subtle issue, I think it is worth
documenting the proper use.

 mmc_cmds.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mmc_cmds.c b/mmc_cmds.c
index 44623fe..69485e9 100644
--- a/mmc_cmds.c
+++ b/mmc_cmds.c
@@ -2070,7 +2070,12 @@ int do_rpmb_read_counter(int nargs, char **argv)
 int do_rpmb_read_block(int nargs, char **argv)
 {
 	int i, ret, dev_fd, data_fd, key_fd = -1;
-	uint16_t addr, blocks_cnt;
+	uint16_t addr;
+	/*
+	 * for reading RPMB, number of blocks is set by CMD23 only, the packet
+	 * frame field for that is set to 0. So, the type is not u16 but uint!
+	 */
+	unsigned int blocks_cnt;
 	unsigned char key[32];
 	struct rpmb_frame frame_in = {
 		.req_resp    = htobe16(MMC_RPMB_READ),
-- 
2.11.0
