Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:38024 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbdHMTIR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2017 15:08:17 -0400
Received: by mail-lf0-f53.google.com with SMTP id y15so32355080lfd.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2017 12:08:16 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170813190811.352748420@cogentembedded.com>
Date: Sun, 13 Aug 2017 22:07:39 +0300
To: linux-serial@vger.kernel.org ("open list:SERIAL DRIVERS")
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] serial: sh-sci: use of_property_read_bool()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=serial-sh-sci-use-of_property_read_bool.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use more compact of_property_read_bool() call for a boolean property
instead  of of_find_property() call in sci_parse_dt().

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'tty-next' branch of GregKH's 'tty.git' repo.

 drivers/tty/serial/sh-sci.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: tty/drivers/tty/serial/sh-sci.c
===================================================================
--- tty.orig/drivers/tty/serial/sh-sci.c
+++ tty/drivers/tty/serial/sh-sci.c
@@ -3073,8 +3073,7 @@ static struct plat_sci_port *sci_parse_d
 	p->type = SCI_OF_TYPE(match->data);
 	p->regtype = SCI_OF_REGTYPE(match->data);
 
-	if (of_find_property(np, "uart-has-rtscts", NULL))
-		sp->has_rtscts = true;
+	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 
 	return p;
 }
