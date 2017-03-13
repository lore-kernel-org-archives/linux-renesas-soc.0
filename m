Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:60044 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753253AbdCMRNU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 13:13:20 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] soc: renesas: Register SoC device early
Date: Mon, 13 Mar 2017 18:13:15 +0100
Message-Id: <1489425197-22859-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489425197-22859-1-git-send-email-geert+renesas@glider.be>
References: <1489425197-22859-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7795 SYSC driver manages PM Domains, and thus is initialized from
an early_initcall().  However, this means the driver cannot check the
SoC revision, as the SoC device hasn't been registered yet.

Change renesas_soc_init() from a core_initcall() to an early_initcall()
to fix this (renesas-soc.o is listed before rcar-sysc.o in the Makefile).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/renesas-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 330960312296f603..51ed33f3426dddc0 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -254,4 +254,4 @@ static int __init renesas_soc_init(void)
 
 	return 0;
 }
-core_initcall(renesas_soc_init);
+early_initcall(renesas_soc_init);
-- 
2.7.4
