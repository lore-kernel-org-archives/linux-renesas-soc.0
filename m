Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] soc: renesas: Register SoC device early
Date: Fri, 31 Mar 2017 11:01:54 +0200
Message-Id: <1490950916-9576-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1490950916-9576-1-git-send-email-geert+renesas@glider.be>
References: <1490950916-9576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7795 SYSC driver manages PM Domains, and thus is initialized from
an early_initcall().  However, this means the driver cannot check the
SoC revision, as the SoC device hasn't been registered yet.

Change renesas_soc_init() from a core_initcall() to an early_initcall()
to fix this (renesas-soc.o is listed before rcar-sysc.o in the Makefile).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
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
