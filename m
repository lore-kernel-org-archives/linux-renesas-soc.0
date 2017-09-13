Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170913192913.138491844@cogentembedded.com>
Date: Wed, 13 Sep 2017 22:28:53 +0300
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] MAINTAINERS: review Renesas DT bindings as well
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=MAINTAINERS-review-Renesas-DT-bindings-as-well.patch
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When adding myself  as a reviewer for  the Renesas  Ethernet drivers
I somehow forgot about the bindings -- I want to review them as well.

Fixes: 8e6569af3a1b ("MAINTAINERS: add myself as Renesas Ethernet drivers reviewer")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net.git' repo.

 MAINTAINERS |    2 ++
 1 file changed, 2 insertions(+)

Index: net/MAINTAINERS
===================================================================
--- net.orig/MAINTAINERS
+++ net/MAINTAINERS
@@ -11379,6 +11379,8 @@ RENESAS ETHERNET DRIVERS
 R:	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/renesas,*.txt
+F:	Documentation/devicetree/bindings/net/sh_eth.txt
 F:	drivers/net/ethernet/renesas/
 F:	include/linux/sh_eth.h
 
