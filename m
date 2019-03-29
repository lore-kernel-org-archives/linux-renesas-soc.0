Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF775C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA76A21773
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbfC2JKb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:10:31 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57764 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728700AbfC2JKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 05:10:31 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id tlAT1z00X3XaVaC06lATp7; Fri, 29 Mar 2019 10:10:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9nWt-0001Wz-Gn; Fri, 29 Mar 2019 10:10:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9nWt-0004wV-EV; Fri, 29 Mar 2019 10:10:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Fix HSCIF RX sampling point adjustment
Date:   Fri, 29 Mar 2019 10:10:26 +0100
Message-Id: <20190329091026.18958-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The calculation of the sampling point has min() and max() exchanged.
Fix this by using the clamp() helper instead.

Fixes: 63ba1e00f178a448 ("serial: sh-sci: Support for HSCIF RX sampling point adjustment")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 060fcd42b6d56010..2bdaeba5d527a6ce 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2529,7 +2529,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 				 * last stop bit; we can increase the error
 				 * margin by shifting the sampling point.
 				 */
-				int shift = min(-8, max(7, deviation / 2));
+				int shift = clamp(deviation / 2, -8, 7);
 
 				hssrr |= (shift << HSCIF_SRHP_SHIFT) &
 					 HSCIF_SRHP_MASK;
-- 
2.17.1

