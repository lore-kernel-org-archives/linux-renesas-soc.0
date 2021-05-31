Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9612C47082
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 31 May 2021 09:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84FED606A5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 31 May 2021 09:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhEaJWW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 31 May 2021 05:22:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231134AbhEaJWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 05:22:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9DFB0606A5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622452833;
        bh=7rbgU30+14tE/zUh6qhne/9A/G2axJCp5ipKZ3yDRy8=;
        h=Subject:From:Date:To:From;
        b=fSsTRcxuLfqG/TDlI7oq6OQfth/t6yxFXCJK4Y+fctMOi+S4CpHHhPNoROGe/4tKF
         kfHn0IzbyGNDUNuAFWkfIxCNWUNE8mbm23KdGXJeFWEoW4JufPA3LG5MNpuwjqKMct
         pni8Dadvvi+cBsQjwVOsYgxlTFY5Brpx7/u4j/5Xh7HlXqXuvMIJdKhZb/oQKJas4i
         63XSCWJtywXtDMD3AAeVi2rsKCyt5mXgRK0wzLqDBUypsRGfJ4ldt8ebT5j/gpdHN+
         Bb0bxk5FflQNftD7mDc2j1zzV5ZHKmDcu5bwQlesk531RKphWL04X2yn2k1x/+DRNW
         kGZl576upCkuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162245283352.30024.7193784307707843369.git-patchwork-summary@kernel.org>
Date:   Mon, 31 May 2021 09:20:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: usb: gadget: udc: renesas_usb3: Fix a race in usb3_start_pipen()
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=487235
  Lore link: https://lore.kernel.org/r/20210524060155.1178724-1-yoshihiro.shimoda.uh@renesas.com
Patch: arm64: dts: renesas: Add missing opp-suspend properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=489573
  Lore link: https://lore.kernel.org/r/45a061c3b0463aac7d10664f47c4afdd999da50d.1619699721.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=475153
  Lore link: https://lore.kernel.org/r/b9e9db907514790574429b83d070c823b36085ef.1619699909.git.geert+renesas@glider.be

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


