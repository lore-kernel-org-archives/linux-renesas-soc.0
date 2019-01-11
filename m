Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3BBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C016A2133F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732322AbfAKM1O (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:27:14 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:51008 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732287AbfAKM1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:27:14 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id P0TC1z00P3XaVaC060TCyg; Fri, 11 Jan 2019 13:27:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0006Iw-Ga; Fri, 11 Jan 2019 13:27:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0008Qs-EO; Fri, 11 Jan 2019 13:27:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] pinctrl: sh-pfc: rcar-gen3: Deduplicate remaining VIN pin definitions
Date:   Fri, 11 Jan 2019 13:27:01 +0100
Message-Id: <20190111122705.32365-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi,

As of commit 50f3f2d73e3426ba ("pinctrl: sh-pfc: Reduce kernel size for
narrow VIN channels"), the infrastructure is available to avoid
duplication of pin definitions for narrow Video IN (VIN) channels.
Make use of his to deduplicate the remaining VIN pin definitions on
R-Car Gen3 SoCS.

This is similar to what was done before for the wide VIN channels e.g.
commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
definitions").

This reduces kernel size for an R-Car Gen3 kernel by almost 1 KiB.

I plan to queue these in sh-pfc-for-v5.1.

Thanks!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: r8a7795: Deduplicate VIN5 pin definitions
  pinctrl: sh-pfc: r8a7796: Deduplicate VIN5 pin definitions
  pinctrl: sh-pfc: r8a77970: Deduplicate VIN[01] pin definitions
  pinctrl: sh-pfc: r8a77980: Deduplicate VIN1 pin definitions

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  90 ++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  90 ++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 128 +++++++++-----------------
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c |  64 +++++--------
 4 files changed, 115 insertions(+), 257 deletions(-)

-- 
2.17.1

