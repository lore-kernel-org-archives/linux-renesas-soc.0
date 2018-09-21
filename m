Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45604 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbeIUULr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 16:11:47 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] kernel/bounds: Provide prototype for foo
Date: Fri, 21 Sep 2018 15:22:33 +0100
Message-Id: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

kernel/bounds.c is recompiled on every build, and shows the following
warning when compiling with W=1:

  CC      kernel/bounds.s
linux/kernel/bounds.c:16:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
 void foo(void)
      ^~~

Provide a prototype to satisfy the compiler.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: stable@vger.kernel.org

---
I compile all of my incremental builds with W=1, which allows me to know
instantly if I add a new compiler warning in code I generate.

This warning always comes up and seems trivial to clean up.
---
 kernel/bounds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bounds.c b/kernel/bounds.c
index c373e887c066..60136d937800 100644
--- a/kernel/bounds.c
+++ b/kernel/bounds.c
@@ -13,6 +13,8 @@
 #include <linux/log2.h>
 #include <linux/spinlock_types.h>
 
+void foo(void);
+
 void foo(void)
 {
 	/* The enum constants to put into include/generated/bounds.h */
-- 
2.17.1
