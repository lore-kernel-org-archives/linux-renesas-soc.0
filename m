Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:31533 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751952AbdLNTlK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 14:41:10 -0500
Date: Fri, 15 Dec 2017 03:40:04 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH renesas-drivers] of: overlay: overlay_changeset_release()
 can be static
Message-ID: <20171214194004.GA74176@lkp-sb05>
References: <201712150350.kjmEdqgF%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201712150350.kjmEdqgF%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Fixes: 11de0d24be47 ("of: overlay: kobjectify overlay objects")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 overlay.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index ef7e8a4..7f0255e 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -654,7 +654,7 @@ static inline struct overlay_changeset *kobj_to_ovcs(struct kobject *kobj)
 	return container_of(kobj, struct overlay_changeset, kobj);
 }
 
-void overlay_changeset_release(struct kobject *kobj)
+static void overlay_changeset_release(struct kobject *kobj)
 {
 	struct overlay_changeset *ovcs = kobj_to_ovcs(kobj);
 
