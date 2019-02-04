Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3ADC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 22:00:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A6B520818
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 22:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfBDWAS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 17:00:18 -0500
Received: from sauhun.de ([88.99.104.3]:52148 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfBDWAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 17:00:18 -0500
Received: from localhost (host-78-129-117-189.dynamic.voo.be [78.129.117.189])
        by pokefinder.org (Postfix) with ESMTPSA id 6E6254A16D9;
        Mon,  4 Feb 2019 23:00:16 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: sh_mobile: updates to compatibles
Date:   Mon,  4 Feb 2019 23:00:08 +0100
Message-Id: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As I could finally use a logic analyzer on a Gen3 Ebisu board and
measure, we can switch now to better formulas for clock generation and
add some sorting to compatibles before.

Wolfram Sang (2):
  i2c: sh_mobile: sort compatible entries
  i2c: sh_mobile: use new clock calculation formulas for Gen3

 drivers/i2c/busses/i2c-sh_mobile.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.19.1

