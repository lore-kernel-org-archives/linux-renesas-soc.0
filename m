Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C006BC43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 934C12147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfAGQX1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 11:23:27 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:44764 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730183AbfAGQX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 11:23:27 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id MUPM1z00X3XaVaC01UPMty; Mon, 07 Jan 2019 17:23:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-0008Fw-Dj; Mon, 07 Jan 2019 17:23:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-00043L-Cd; Mon, 07 Jan 2019 17:23:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 1/4] serial: sh-sci: Extract sci_dma_rx_chan_invalidate()
Date:   Mon,  7 Jan 2019 17:23:17 +0100
Message-Id: <20190107162320.15530-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107162320.15530-1-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The cookies and channel pointer for the DMA receive channel are
invalidated in two places, and one more is planned.
Extract this functionality in a common helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - New.
---
 drivers/tty/serial/sh-sci.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 8df0fd8245203f8b..4c75468680cb547d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1243,12 +1243,22 @@ static int sci_dma_rx_find_active(struct sci_port *s)
 	return -1;
 }
 
+static void sci_dma_rx_chan_invalidate(struct sci_port *s)
+{
+	unsigned int i;
+
+	s->chan_rx = NULL;
+	for (i = 0; i < ARRAY_SIZE(s->cookie_rx); i++)
+		s->cookie_rx[i] = -EINVAL;
+	s->active_rx = 0;
+}
+
 static void sci_rx_dma_release(struct sci_port *s)
 {
 	struct dma_chan *chan = s->chan_rx_saved;
 
-	s->chan_rx_saved = s->chan_rx = NULL;
-	s->cookie_rx[0] = s->cookie_rx[1] = -EINVAL;
+	s->chan_rx_saved = NULL;
+	sci_dma_rx_chan_invalidate(s);
 	dmaengine_terminate_sync(chan);
 	dma_free_coherent(chan->device->dev, s->buf_len_rx * 2, s->rx_buf[0],
 			  sg_dma_address(&s->sg_rx[0]));
@@ -1367,10 +1377,7 @@ static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
 		spin_lock_irqsave(&port->lock, flags);
 	if (i)
 		dmaengine_terminate_async(chan);
-	for (i = 0; i < 2; i++)
-		s->cookie_rx[i] = -EINVAL;
-	s->active_rx = 0;
-	s->chan_rx = NULL;
+	sci_dma_rx_chan_invalidate(s);
 	sci_start_rx(port);
 	if (!port_lock_held)
 		spin_unlock_irqrestore(&port->lock, flags);
-- 
2.17.1

