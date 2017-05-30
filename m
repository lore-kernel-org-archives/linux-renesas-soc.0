Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55967 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbdE3MvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2017 08:51:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/5] MAINTAINERS: Update files for TMIO/SDHI MMC driver
Date: Tue, 30 May 2017 14:50:50 +0200
Message-Id: <1496148654-20386-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1496148654-20386-1-git-send-email-horms+renesas@verge.net.au>
References: <1496148654-20386-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update files for tmio/sdhi MMC driver to reflect recent filename
changes.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 053c3bdd1fe5..5b4c477573dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12882,7 +12882,7 @@ M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 L:	linux-mmc@vger.kernel.org
 S:	Supported
 F:	drivers/mmc/host/tmio_mmc*
-F:	drivers/mmc/host/sh_mobile_sdhi.c
+F:	drivers/mmc/host/renesas_sdhi*
 F:	include/linux/mfd/tmio.h
 
 TMP401 HARDWARE MONITOR DRIVER
-- 
2.1.4
