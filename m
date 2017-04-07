Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59434 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932127AbdDGSO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 14:14:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] soc: renesas: Register SoC device early
Date: Fri,  7 Apr 2017 14:14:19 -0400
Message-Id: <b1d134ba9de2b7a136406530e34fc8b110ba6efd.1491588035.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491588035.git.horms+renesas@verge.net.au>
References: <cover.1491588035.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The r8a7795 SYSC driver manages PM Domains, and thus is initialized from
an early_initcall().  However, this means the driver cannot check the
SoC revision, as the SoC device hasn't been registered yet.

Change renesas_soc_init() from a core_initcall() to an early_initcall()
to fix this (renesas-soc.o is listed before rcar-sysc.o in the Makefile).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/renesas-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 330960312296..51ed33f3426d 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -254,4 +254,4 @@ static int __init renesas_soc_init(void)
 
 	return 0;
 }
-core_initcall(renesas_soc_init);
+early_initcall(renesas_soc_init);
-- 
2.7.0.rc3.207.g0ac5344
