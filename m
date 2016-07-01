Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Peter Chen <peter.chen@nxp.com>
To: <linux-renesas-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>
CC: Peter Chen <peter.chen@nxp.com>, Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 2/7] arm: mach-shmobile: pm-rmobile: add missing of_node_put after calling of_parse_phandle
Date: Fri, 1 Jul 2016 17:41:56 +0800
Message-ID: <1467366121-14120-3-git-send-email-peter.chen@nxp.com>
In-Reply-To: <1467366121-14120-1-git-send-email-peter.chen@nxp.com>
References: <1467366121-14120-1-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

of_node_put needs to be called when the device node which is got
from of_parse_phandle has finished using.

Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/mach-shmobile/pm-rmobile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-shmobile/pm-rmobile.c b/arch/arm/mach-shmobile/pm-rmobile.c
index c0b05e9..8eb2cb6 100644
--- a/arch/arm/mach-shmobile/pm-rmobile.c
+++ b/arch/arm/mach-shmobile/pm-rmobile.c
@@ -209,6 +209,7 @@ static void __init add_special_pd(struct device_node *np, enum pd_types type)
 	special_pds[num_special_pds].pd = pd;
 	special_pds[num_special_pds].type = type;
 	num_special_pds++;
+	of_node_put(pd);
 }
 
 static void __init get_special_pds(void)
-- 
1.9.1
