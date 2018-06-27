Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:42848 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752199AbeF0GAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 02:00:40 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] pinctrl: sh-pfc: fix a null pointer dereference of drive strength information
Date: Wed, 27 Jun 2018 07:59:59 +0200
Message-Id: <20180627055959.21001-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Not all SoCs describes the drive strength registers. When reading the
sysfs pinconf-pins file on such a SoC this results in a null pointer
dereference. Protect against this dereference and allow reading of the
pinconf-pins by adding a check if the drive strength registers are
described or not.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

---

Hi Geert,

This was found on the Eagle board and is based on the latest 
renesas/devel branch.

Regards,
Niklas

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 654dc20e171b9363..ef837676d0312e8d 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -483,6 +483,9 @@ static u32 sh_pfc_pinconf_find_drive_strength_reg(struct sh_pfc *pfc,
 	const struct pinmux_drive_reg *reg;
 	unsigned int i;
 
+	if (!pfc->info->drive_regs)
+		return 0;
+
 	for (reg = pfc->info->drive_regs; reg->reg; ++reg) {
 		for (i = 0; i < ARRAY_SIZE(reg->fields); ++i) {
 			field = &reg->fields[i];
-- 
2.17.0
