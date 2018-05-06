Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37594 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751327AbeEFLYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 May 2018 07:24:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: trivial@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] powerpc/watchdog: fix typo 'can by' to 'can be'
Date: Sun,  6 May 2018 13:23:46 +0200
Message-Id: <20180506112404.24872-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
References: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/powerpc/kernel/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 6256dc3b0087d2..591f7c3af4ffcd 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -64,7 +64,7 @@
  * means the CPU(s) with their bit still set in the pending mask have had
  * their heartbeat stop, and action is taken.
  *
- * Some platforms implement true NMI IPIs, which can by used by the SMP
+ * Some platforms implement true NMI IPIs, which can be used by the SMP
  * watchdog to detect an unresponsive CPU and pull it out of its stuck
  * state with the NMI IPI, to get crash/debug data from it. This way the
  * SMP watchdog can detect hardware interrupts off lockups.
-- 
2.11.0
