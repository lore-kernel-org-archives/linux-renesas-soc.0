Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688CAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38D162184E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbfCTKou (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:44:50 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:57264 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfCTKot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:44:49 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id qAkn1z00g3XaVaC06AknvX; Wed, 20 Mar 2019 11:44:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YiF-0005N0-ME; Wed, 20 Mar 2019 11:44:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YiF-0005gt-L8; Wed, 20 Mar 2019 11:44:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Improve PINMUX_IPSR_PHYS() documentation
Date:   Wed, 20 Mar 2019 11:44:46 +0100
Message-Id: <20190320104446.21833-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - The IPSR field is meant for documentation only,
  - The function name refers to the pin function, not to the IPSR field.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.2.

 drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 2a6abeb62bab659b..7db5819eea7e6e0d 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -418,8 +418,8 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 /*
  * Describe a pinmux configuration in which a pin is physically multiplexed
  * with other pins.
- *   - ipsr: IPSR field
- *   - fn: Function name, also referring to the IPSR field
+ *   - ipsr: IPSR field (unused, for documentation purposes only)
+ *   - fn: Function name
  *   - psel: Physical multiplexing selector
  */
 #define PINMUX_IPSR_PHYS(ipsr, fn, psel) \
-- 
2.17.1

