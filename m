Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: laurent.pinchart@ideasonboard.com,
	mchehab@osg.samsung.com,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH RFC 2/2] MAINTAINERS: Add support for FDP driver
Date: Thu,  9 Jun 2016 18:37:59 +0100
Message-Id: <1465493879-5419-3-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1465493879-5419-1-git-send-email-kieran@bingham.xyz>
References: <1465493879-5419-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66de4da2d244..bc083b58e478 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7312,6 +7312,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/renesas,vsp1.txt
 F:	drivers/media/platform/vsp1/
 
+MEDIA DRIVERS FOR RENESAS - FDP1
+M:	Kieran Bingham <kieran@bingham.xyz>
+L:	linux-media@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Supported
+F:	Documentation/devicetree/bindings/media/renesas,fdp1.txt
+F:	drivers/media/platform/rcar_fdp1.c
+
 MEDIA DRIVERS FOR ASCOT2E
 M:	Sergey Kozlov <serjk@netup.ru>
 L:	linux-media@vger.kernel.org
-- 
2.7.4
