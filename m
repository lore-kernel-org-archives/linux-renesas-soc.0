Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28521 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbeH3GjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 02:39:03 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: wsa@sang-engineering.com, niklas.soderlund+renesas@ragnatech.se,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] thermal: rcar: reduce inaccuracy in the calculate rounding for temperature conversion
Date: Thu, 30 Aug 2018 11:39:03 +0900
Message-Id: <1535596744-16598-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

This patch to avoid and reduce the inaccuracy in the calculation when DIV_ROUND() and then calculates the conversion, I think, should change the order: calculate the conversion and then DIV_ROUND().
Although I'm not sure there will be an error, but I have encountered problems when troubleshooting interrupts not counting up.

Hoan Nguyen An (1):
  thermal: rcar: reduce inaccuracy in calculate rounding

 drivers/thermal/rcar_gen3_thermal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.7.4
