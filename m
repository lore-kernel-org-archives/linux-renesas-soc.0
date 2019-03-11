Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698D1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 307782148D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfCKWeS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 18:34:18 -0400
Received: from sauhun.de ([88.99.104.3]:33330 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfCKWeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 18:34:18 -0400
Received: from localhost (p54B3359D.dip0.t-ipconnect.de [84.179.53.157])
        by pokefinder.org (Postfix) with ESMTPSA id B89B12C08C3;
        Mon, 11 Mar 2019 23:34:15 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 0/2] tools: improvements to handling restricted addresses
Date:   Mon, 11 Mar 2019 23:33:33 +0100
Message-Id: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For debugging, I needed to use the restricted address range. That's when I
noticed that the docs for i2ctransfer were missing an update (patch 1). But
even more surprising, I noticed that the reserved addresses 0x03-0x07 were not
restricted. It seems we all are so used to our lovely i2c-tools that nobody
(including me) never questioned that :) But it should be fixed (patch 2), I
think.

Open for comments. Happy hacking!


Wolfram Sang (2):
  tools: i2ctransfer: man: mention -a everywhere
  tools: restrict all addresses defined by the standard

 CHANGES             |  2 ++
 tools/i2cbusses.c   |  2 +-
 tools/i2cdetect.8   |  2 +-
 tools/i2cdetect.c   |  2 +-
 tools/i2cdump.8     |  4 ++--
 tools/i2cdump.c     |  2 +-
 tools/i2cget.8      |  4 ++--
 tools/i2cget.c      |  2 +-
 tools/i2cset.8      |  4 ++--
 tools/i2cset.c      |  2 +-
 tools/i2ctransfer.8 | 12 +++++++-----
 11 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.11.0

