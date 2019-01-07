Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F47C43444
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE1C62087F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfAGWNm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 17:13:42 -0500
Received: from sauhun.de ([88.99.104.3]:34966 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbfAGWNm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 17:13:42 -0500
Received: from localhost (p54B338A8.dip0.t-ipconnect.de [84.179.56.168])
        by pokefinder.org (Postfix) with ESMTPSA id 31D1D3E48AF;
        Mon,  7 Jan 2019 23:13:39 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] pinctrl: sh-pfc: gen2: initialize TDSEL register for ES1.0
Date:   Mon,  7 Jan 2019 23:13:18 +0100
Message-Id: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

During our SDHI hackathon, we found that Lager was the only Gen2 board
having issues with a stubborn SD card. The issue went away when setting
TDSEL to the expected value mentioned in the H2 documentation which is
sadly not the default value. M2-W, M2-N, and V2H have an expected value
of 0 for TDSEL, so this is why they likely work out of the box (V2H has
non-zero drive strength bit, though). I can't verify those SoCs here, no
boards. E2 has a non-zero expected value as well, so we fix it in this
patch series as well (although on my board the bootloader prepares TDSEL
correctly, but let's not rely on that).

Changes since V1:

* we discussed this with the HW team internally and concluded this is only
  needed for ES1.0 versions of these SoCs. So, setting TDSEL is now
  whitelisted using soc_device_match.

* Chris added to CC
  For two reasons: first, to give him a chance to test this so we don't
  break the RZ series. Second, according to Geert, R-Car E2X and RZ/G1C
  might have the same 'non-zero default value of TDSEL' problem and maybe
  need fixing, too. But we don't have HW to check/test this.

Looking forward to comments!

Thanks,

   Wolfram


Wolfram Sang (2):
  pinctrl: sh-pfc: r8a7790: initialize TDSEL register for ES1.0
  pinctrl: sh-pfc: r8a7794: initialize TDSEL register for ES1.0

 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 17 +++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 16 ++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.11.0

