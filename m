Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0B0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B33F020652
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfAPVGI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:08 -0500
Received: from sauhun.de ([88.99.104.3]:34456 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbfAPVGI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:08 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id 235F62C790E;
        Wed, 16 Jan 2019 22:06:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 0/7] i2c: sh_mobile: state machine simplifications
Date:   Wed, 16 Jan 2019 22:05:48 +0100
Message-Id: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While I was working on this driver to debug some issues, re-understanding the
state machine was harder than I expected due to some confusing code. So, I
decided to reorganize this a little to make my life easier. There is potential
for more cleanup, but I propose this as a first step.

No regressions experienced so far on my Renesas Lager board (R-Car H2). This
series is RFT because this needs to be tested on a Gen3 SoC as well, but this
will probably be happening around FOSDEM where I get access to proper HW.
Still, release early...

If you have comments, feel free.

Wolfram Sang (7):
  i2c: sh_mobile: simplify sending address for RX
  i2c: sh_mobile: remove get_data function
  i2c: sh_mobile: drop 'data' argument from i2c_op function
  i2c: sh_mobile: remove is_first_byte function
  i2c: sh_mobile: replace break; with if-block
  i2c: sh_mobile: refactor rx isr
  i2c: sh_mobile: update copyright and comments

 drivers/i2c/busses/i2c-sh_mobile.c | 106 +++++++++++++------------------------
 1 file changed, 37 insertions(+), 69 deletions(-)

-- 
2.11.0

