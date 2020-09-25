Return-Path: <SRS0=OCes=DC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70910C4363D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Sep 2020 07:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0208B20717
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Sep 2020 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601019630;
	bh=Vq8zRwh2vXJOVfnz3XbV94nBa3Kor3xmttcMEg2cLBM=;
	h=Subject:From:Date:To:List-ID:From;
	b=c/4BkQ/B/MS7iPz2Eht5v5SbNCWS5RhIwcIAJtosCwYCznDrEw47zQbLv+rKxFKd3
	 ycqlqK/CxJOK8LWT3WPWlGTIR0J1MxaSMxBZTI8HwafESgYmQqBD3QF7GVfvNaL1G7
	 QSlBEPlX+csDVPEWSCR2pov99Bo/yAs+waZc2gX0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgIYHk3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Sep 2020 03:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgIYHk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 03:40:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601019629;
        bh=Vq8zRwh2vXJOVfnz3XbV94nBa3Kor3xmttcMEg2cLBM=;
        h=Subject:From:Date:To:From;
        b=mOs/cISc0PdkP6/6x74Aps5Aa2pxxGCmEF3r9CbyuTeTazGiBdi84ES29gt2172Co
         IH09XUmkk5ymb+vDzwcHTJ952YEusGSxMtFez539aIhNg2kbpZX4brClqKfbIM8QQi
         syjy1TRw8RqKV97vxY4o+mblo11n/4sSb6ZIyFeo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160101962909.28293.5466159455215683184.git-patchwork-summary@kernel.org>
Date:   Fri, 25 Sep 2020 07:40:29 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=354693
  Link: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
