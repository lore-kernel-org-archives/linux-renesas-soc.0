Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:20952 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756309AbcILI5b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 04:57:31 -0400
Message-ID: <57D66DEC.4090607@jinso.co.jp>
Date: Mon, 12 Sep 2016 17:57:16 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        laurent.pinchart+renesas@ideasonboard.com
CC: duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com
Subject: GEN2: Initialization of VSP1 failed at upstream v4.8-rc2
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp> <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
In-Reply-To: <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

As you know the information about Initialization of VSP1 failed at 
upstream v4.8-rc2
  from the report of "The failure summary report of GEN2 for Linux 
v4.8-rc2".
"[    5.237049] vsp1: probe of fe920000.vsp1 failed with error -38
[    5.254664] vsp1: probe of fe928000.vsp1 failed with error -38
[    5.272277] vsp1: probe of fe930000.vsp1 failed with error -38
[    5.289891] vsp1: probe of fe938000.vsp1 failed with error -38"

I have found the patch that causing of this issue:
"94fcdf8 [media] v4l: vsp1: Add FCP support"

In this patch,

"@@ -528,7 +533,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
                         return ret;
         }

-       return 0;
+       return rcar_fcp_enable(vsp1->fcp);
  }"

vsp1_pm_runtime_resume() function should be returned "0" if it success.
I tried to debug this place, and I realize that the rcar_fcp_enable() 
function returned "-38" during Initialization.
That's why the error message occurs.
We know that the rcar_fcp_enable() function also returns 0 on success or 
a negative error code if an error occurs.
So, I am thinking of something just before it happens.

Please have a look at this issue when you have time.

Best regards,
Hiep.
