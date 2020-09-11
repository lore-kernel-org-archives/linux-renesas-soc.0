Return-Path: <SRS0=JlV5=CU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4463C43461
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 09:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88DAA20659
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599816032;
	bh=POSNF514W8yJBikwda/nw1kW2E64wdZMlJfzJ6xAsF0=;
	h=Subject:From:Date:To:List-ID:From;
	b=Vc0gCu9B4JIrDwJMhqwGMrAgvVJ1yckmBXZxyFAUAgjc68+2U8H6Eeih0+L2gaQkY
	 BxEvYywXi+8SSRMuGCcFod2By61qSTatGKDMZl5gDHdrIg/Lvq88WyooJqW5P9qO87
	 Wj4ReWtAiCH/UlAG8Mo6kBJz/qYcVgJZ1pEQn084=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgIKJUc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 05:20:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgIKJUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 05:20:31 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599816030;
        bh=POSNF514W8yJBikwda/nw1kW2E64wdZMlJfzJ6xAsF0=;
        h=Subject:From:Date:To:From;
        b=kPbQuw20912iRPQ2BCrUKAeWGZqrtQ4gncjT4687PfZsEp9uIqlFqT8pDnOrUlyVb
         A9veZ654idrFFdnkMIcHUpjwPpjH5VYahdQX1IDx+PadmsZmc7+B9CVxdrELG4KPIu
         JZ8DWkHE75pf7u/H7jTi5YNzfYI2Rtk5CoAHcRAs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159981603075.8325.5198552482943352475.git-patchwork-summary@kernel.org>
Date:   Fri, 11 Sep 2020 09:20:30 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: Fix pin controller node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=336507
  Link: <20200821112433.5652-1-geert+renesas@glider.be>

Patch: ARM: dts: renesas: Fix pin controller node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=336515
  Link: <20200821112351.5518-1-geert+renesas@glider.be>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
