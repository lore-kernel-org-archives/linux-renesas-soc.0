Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:60262 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbeHQGnq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 02:43:46 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH 0/2] Add support Audio's pins for r8a77965.
Date: Fri, 17 Aug 2018 12:02:36 +0900
Message-Id: <1534474958-13417-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

These patches based on the file drivers/pinctrl/sh-pfc/pfc-r8a7796.c.
Although the current renesas-drives tree r8a77965.dtsi has not yet configured for the Sound-driver, but I have manually configured and tested for this.
Patches were be tested. 


Hoan Nguyen An (2):
  pinctrl: sh-pfc: r8a77965: add Audio clock pin support
  pinctrl: sh-pfc: r8a77965: add Audio SSI pin support

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 392 ++++++++++++++++++++++++++++++++++
 1 file changed, 392 insertions(+)

-- 
2.7.4
