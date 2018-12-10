Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCAAC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAAF42084C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAF42084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbeLJSV7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:21:59 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40762 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbeLJSV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:21:58 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id AJMv1z00a3XaVaC01JMvoq; Mon, 10 Dec 2018 19:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-00021O-RQ; Mon, 10 Dec 2018 19:21:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-0005JD-QO; Mon, 10 Dec 2018 19:21:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/4] serial: sh-sci: Fix crash in rx_timer_fn() on PIO fallback
Date:   Mon, 10 Dec 2018 19:21:52 +0100
Message-Id: <20181210182154.20357-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181210182154.20357-1-geert+renesas@glider.be>
References: <20181210182154.20357-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210182152.05FXWy6V4XYVqALFFvHT8GmIM-O3Oz9vcWv6cGkF9fQ@z>

When falling back to PIO, active_rx must be set to a different value
than cookie_rx[i], else sci_dma_rx_find_active() will incorrectly find a
match, leading to a NULL pointer dereference in rx_timer_fn() later.

Use zero instead, which is the same value as after driver
initialization.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Split in multiple patches.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 2a08039f792235e5..e353e03ce2602559 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1369,7 +1369,7 @@ static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
 		dmaengine_terminate_async(chan);
 	for (i = 0; i < 2; i++)
 		s->cookie_rx[i] = -EINVAL;
-	s->active_rx = -EINVAL;
+	s->active_rx = 0;
 	s->chan_rx = NULL;
 	sci_start_rx(port);
 	if (!port_lock_held)
-- 
2.17.1

