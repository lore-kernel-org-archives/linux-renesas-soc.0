Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:34416 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdCRUw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Mar 2017 16:52:56 -0400
Received: by mail-wr0-f173.google.com with SMTP id l37so70890735wrc.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Mar 2017 13:52:29 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sat, 18 Mar 2017 21:52:26 +0100
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: sh-pfc: Print correct pinmux info name
Message-ID: <20170318205226.GA11403@x230>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-pinctrl-sh-pfc-Print-correct-pinmux-info-name.patch"

>From cce7953dac965d620bb4fe5a456cffe40793f39b Mon Sep 17 00:00:00 2001
From: Eugeniu Rosca <erosca@de.adit-jv.com>
Date: Tue, 28 Feb 2017 13:38:36 +0100
Subject: [PATCH] pinctrl: sh-pfc: Print correct pinmux info name

commit 0c151062f32c ("sh-pfc: Add support for SoC-specific
initialization") allows defining SoC specific init functions.
Such custom functions can register new pinmux info structures.
Here is an example:

static int my_pinmux_init(struct sh_pfc *pfc)
{
    if (my_criteria())
        pfc->info = &new_pinmux_info;
}

A side effect of the pfc->info update in the above example is that
the `const struct sh_pfc_soc_info *info` pointer used in the probe
routine becomes outdated. One consequence of it is printing the wrong
pinmux info structure name at the end of `sh_pfc_probe()`. Fix this.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/pinctrl/sh-pfc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 6399eb1feb12..37fc70fb8e4d 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -703,7 +703,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pfc);
 
-	dev_info(pfc->dev, "%s support registered\n", info->name);
+	dev_info(pfc->dev, "%s support registered\n", pfc->info->name);
 
 	return 0;
 }
-- 
2.12.0


--DocE+STaALJfprDB--
