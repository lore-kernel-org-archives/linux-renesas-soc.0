Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F0FC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0932320811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0932320811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbeLMS1U (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:20 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:57756 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbeLMS1T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:19 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id BWTG1z01L3XaVaC01WTG62; Thu, 13 Dec 2018 19:27:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0007es-H8; Thu, 13 Dec 2018 19:27:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0006nq-Ep; Thu, 13 Dec 2018 19:27:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/15] pinctrl: sh-pfc: Fix config register descriptions
Date:   Thu, 13 Dec 2018 19:26:59 +0100
Message-Id: <20181213182714.26094-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains enhancements for config register descriptions
and their handling in the Renesas pinctrl drivers.
  - Patches 1-10 are fixes for config register descriptions, of which all
    but 6 and 10 were found by the pinmux table validation in the RFC
    patches at the end of the series,
  - Patches 11-12 are small improvements for debugging and memory
    consumption,
  - Patches 13-15 are an RFC, to add the option of doing some validation
    of all builtin pinmux tables at runtime.  While these aren't ready
    for prime-time yet, they were very valuable in finding most of the
    issues fixed above.  Hence I think it would be good to integrate an
    evolved form of them later, to help catching bugs early.
    Note that patches 13 and 14 are incomplete (the real ones are boring
    and very large), but just serve as an example.

Probably I will queue the most important fixes in sh-pfc-for-v4.21.
The rest will have to wait for v4.22.

Thanks for your comments!

Geert Uytterhoeven (15):
  pinctrl: sh-pfc: r8a77994: Remove bogus IPSR9 field
  pinctrl: sh-pfc: r8a779970: Add missing MOD_SEL0 field
  pinctrl: sh-pfc: r8a779980: Add missing MOD_SEL0 field
  pinctrl: sh-pfc: sh7734: Add missing IPSR11 field
  pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 SEL_I2C1 field width
  pinctrl: sh-pfc: r8a77995: Remove bogus SEL_PWM[0-3]_3 configurations
  pinctrl: sh-pfc: sh7264: Fix PFCR3 and PFCR0 register configuration
  pinctrl: sh-pfc: sh7269: Add missing PCIOR0 field
  pinctrl: sh-pfc: sh7734: Remove bogus IPSR10 value
  pinctrl: sh-pfc: sh7734: Fix shifted values in IPSR10
  pinctrl: sh-pfc: Print actual field width for variable-width fields
  pinctrl: sh-pfc: Make pinmux_cfg_reg.var_field_width[] variable-length
  [RFC/INCOMPLETE] pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG() macro
  [RFC/INCOMPLETE] pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG_VAR() macro
  [RFC] pinctrl: sh-pfc: Validate pinmux tables at runtime when
    debugging

 drivers/pinctrl/sh-pfc/Kconfig           |  36 ----
 drivers/pinctrl/sh-pfc/Makefile          |  13 ++
 drivers/pinctrl/sh-pfc/core.c            | 104 +++++++++++-
 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  67 +++++---
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |  20 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |  16 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 135 ++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 101 ++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     | 117 +++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 131 ++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 155 ++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     | 134 ++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 126 ++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 124 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 129 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 129 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 129 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  67 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |  75 +++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 108 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 105 ++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7203.c      | 124 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7264.c      | 191 +++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-sh7269.c      | 206 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  12 +-
 drivers/pinctrl/sh-pfc/pfc-sh7720.c      |  72 ++++----
 drivers/pinctrl/sh-pfc/pfc-sh7722.c      | 128 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7723.c      | 108 ++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7724.c      | 112 ++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      | 144 +++++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7757.c      | 140 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-sh7785.c      |  72 ++++----
 drivers/pinctrl/sh-pfc/pfc-sh7786.c      |  44 ++---
 drivers/pinctrl/sh-pfc/pfc-shx3.c        |  16 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  68 ++++++--
 35 files changed, 1873 insertions(+), 1585 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
