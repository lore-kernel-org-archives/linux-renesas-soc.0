Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:33905 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754306AbdLNXoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 18:44:30 -0500
Date: Fri, 15 Dec 2017 07:44:21 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH renesas-drivers] [RFC] of: dead_aliases_lookup can be
 static
Message-ID: <20171214234421.GA44958@lkp-sb05>
References: <201712150710.pTXUwb8r%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201712150710.pTXUwb8r%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Fixes: 19e0da502da1 ("[RFC] of: Add of_alias_destroy()")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5d3a0ad..1f3f84c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1568,7 +1568,7 @@ void of_alias_create(struct property *pp,
 }
 
 #ifdef CONFIG_OF_DYNAMIC
-LIST_HEAD(dead_aliases_lookup);
+static LIST_HEAD(dead_aliases_lookup);
 
 void of_alias_destroy(const char *name)
 {
