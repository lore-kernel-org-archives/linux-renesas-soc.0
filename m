Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870F6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E15C2146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfCTK0d (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:26:33 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:56862 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfCTK0d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:26:33 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id qASX1z00N3XaVaC01ASXha; Wed, 20 Mar 2019 11:26:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YQZ-0005HQ-IW; Wed, 20 Mar 2019 11:26:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YQZ-0005BP-GX; Wed, 20 Mar 2019 11:26:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza1: Remove unneeded spinlock acquisitions
Date:   Wed, 20 Mar 2019 11:26:29 +0100
Message-Id: <20190320102629.19865-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

rza1_get_bit() is just a single register read.  Hence there's no need to
synchronize it with other register writes to the same bank.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.2.

 drivers/pinctrl/pinctrl-rza1.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 9cfe9d0520acaf61..021e37b7689e4fda 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -620,14 +620,7 @@ static void rza1_pin_reset(struct rza1_port *port, unsigned int pin)
 static inline int rza1_pin_get_direction(struct rza1_port *port,
 					 unsigned int pin)
 {
-	unsigned long irqflags;
-	int input;
-
-	spin_lock_irqsave(&port->lock, irqflags);
-	input = rza1_get_bit(port, RZA1_PM_REG, pin);
-	spin_unlock_irqrestore(&port->lock, irqflags);
-
-	return !!input;
+	return !!rza1_get_bit(port, RZA1_PM_REG, pin);
 }
 
 /**
@@ -671,14 +664,7 @@ static inline void rza1_pin_set(struct rza1_port *port, unsigned int pin,
 
 static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
 {
-	unsigned long irqflags;
-	int val;
-
-	spin_lock_irqsave(&port->lock, irqflags);
-	val = rza1_get_bit(port, RZA1_PPR_REG, pin);
-	spin_unlock_irqrestore(&port->lock, irqflags);
-
-	return val;
+	return rza1_get_bit(port, RZA1_PPR_REG, pin);
 }
 
 /**
-- 
2.17.1

