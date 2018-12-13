Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFFCC67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDD342086D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD342086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbeLMQ3E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:29:04 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:47926 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbeLMQ3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 11:29:04 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BUV21z00t3XaVaC01UV2lL; Thu, 13 Dec 2018 17:29:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0006KF-OK; Thu, 13 Dec 2018 17:29:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0003ho-Lu; Thu, 13 Dec 2018 17:29:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] pinctrl: sh-pfc: Fix number of pins/marks mismatches
Date:   Thu, 13 Dec 2018 17:28:49 +0100
Message-Id: <20181213162855.14190-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series fixes several mismatches between the number of pins
and the number of marks in pin groups for Renesas SoCs.  All of these
have been detected by the last patch in the series, which adds a
build-time check for this particular case.

I believe none of the affected pins groups are configured by the
DTS files supplied with the kernel. 

I intend to queue this up in sh-pfc-for-v4.21, as I will probably have
other fixes to send a PR for anyway.

Thanks for your comments!

Geert Uytterhoeven (6):
  pinctrl: sh-pfc: r8a7740: Add missing REF125CK pin to gether_gmii
    group
  pinctrl: sh-pfc: r8a7740: Add missing LCD0 marks to lcd0_data24_1
    group
  pinctrl: sh-pfc: r8a7791: Remove bogus ctrl marks from qspi_data4_b
    group
  pinctrl: sh-pfc: r8a7791: Remove bogus marks from vin1_b_data18 group
  pinctrl: sh-pfc: sh73a0: Add missing TO pin to tpu4_to3 group
  pinctrl: sh-pfc: Validate pins/marks in pin group at build time

 drivers/pinctrl/sh-pfc/pfc-r8a7740.c | 3 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 6 +-----
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c  | 1 +
 drivers/pinctrl/sh-pfc/sh_pfc.h      | 3 ++-
 4 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
