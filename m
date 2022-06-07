Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8714C43334
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbiFGIkR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbiFGIkQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:40:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9D03E0D0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:40:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 02285B81DB5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 08:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1F1BC385A5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654591212;
        bh=o9fz+4jsBzDcMgTf4GtguswY6oEBIF1LhcgkEG9v5Us=;
        h=Subject:From:Date:To:From;
        b=e1x48j0hTTEdsrfZRwgUGzClq+pLrGc3G9AsT10L0CmE0hgaMB2cHEqWiCHfeIyVz
         S2YAB+rL2FM0XflzP9Fs1FzbfVDwzt8FT0ZO2WcJ//1xS5MpOwYaCQHokxmBPvw/pc
         ytTF1ZMFHnRuxS9xY7p9NRFMeQZ2PiFNqhNPU9t0x58Dm8SV/tD2Si4UlfmWll7Uxb
         aKRAuRoIcQtvyXj6bjtdle1r8xR3G6ye9LFzRWNipC7QzOr71LDgKCwn0jGKcAP6Pa
         t5Lgz1Hpcms9pVDgRY2LNlFmYt/1vwjrZzEW95Vyo3G2o3DiWyHQuTH2xcLodMy2fR
         WoEFin56YF5jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9FEA4E737E2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 08:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165459121255.3364.15105873811546716152.git-patchwork-summary@kernel.org>
Date:   Tue, 07 Jun 2022 08:40:12 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: r8a779f0: Add IPMMU support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=645858
  Lore link: https://lore.kernel.org/r/20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
             [v2,2/2] arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes

Series: arm64: dts: renesas: r8a779f0: Add IPMMU nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=608277
  Lore link: https://lore.kernel.org/r/20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
             [2/2] arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


