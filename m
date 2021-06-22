Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE36C2B9F4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jun 2021 07:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C22906128A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jun 2021 07:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFVHwX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 03:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhFVHwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 03:52:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 94A2C611AF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624348203;
        bh=PzaF+zGkr6Ae9Y1WQqylS8CJimkpTBLo2NxtIEN4iXA=;
        h=Subject:From:Date:To:From;
        b=CPSqtiMrzlwkew7oyE08LUEPolSS4DCw40L3wOmuPSG4y1beGcs2GKjfnUFafZCOa
         c7bWkuJTcixbHM2EoNULnY5lWNIrAkIa0ec5IgGCT7ExRWknL8yxAxyWsZvjT/Yrx/
         12yIakx/db0uhkKatRS/fO/niopOwCDe19/Hi5fNENrKNH3YxnEqNxsGcIp/xlm0pV
         xDZKH2XYDS0h9hgeSHFPVhOZaFMYpDjdoJK02hn7kvtqbb3CAW1xJYa/tRc/89/GDB
         iyoHNE3Rw1fWzbSp+TmpJFylBOkOWL1AyJLdKBNrrcy64KycZMTsxTqTQW3N+pQ1Dh
         OImIeBipNQ+Iw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162434820349.16300.14863477723459333574.git-patchwork-summary@kernel.org>
Date:   Tue, 22 Jun 2021 07:50:03 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: salvator-x(s): Factor out common optional parts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=495565
  Lore link: https://lore.kernel.org/r/cover.1623087028.git.geert+renesas@glider.be
    Patches: [1/4] arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
             [2/4] arm64: dts: renesas: salvator-x(s): Factor out SATA parts
             [3/4] arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
             [4/4] arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


