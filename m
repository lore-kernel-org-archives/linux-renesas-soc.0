Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040DBC7EE23
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 12 Jun 2023 08:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjFLIul (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjFLIul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 04:50:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22F3F4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 01:50:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EB6361207
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 08:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D21A7C433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686559838;
        bh=pdZykpmRdmfhnbjKNwWTk3E4o2fRClxRhOtn2CaLAKQ=;
        h=Subject:From:Date:To:From;
        b=LnCIhfUOcBXmXC64sTryhCLDF+Ia4DAxwY8jywZG4+x52JRfDo/kATpq2UvNFR6wd
         +GNiOnmcsCSCZOYFPtcrAI3uq4WlYtpuStJEM0Sprq7b5Y/Se7MwGdraC/IVCVYxtJ
         Co07IJXbHWbtUPjBm9MHHzLSEXCbLfF0+v14z5QbmF7a+KR45nvy94x0HuD9qZPbmm
         +mDK4KrAFlIFY5Ifp1bZzrHD/4fNBgssxSBQwHfL0NwXOJGnE112dFwZjfwCdANyJO
         XHhS4ydnoDSPTMceVkIYL+uLcSxHSJR/jPB9E2hbMpHeSMtjQjjIEUcp1FesNhe61p
         mHlvHiCAIlVng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8458C395EC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 08:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168655983868.8602.6627890901805913877.git-patchwork-summary@kernel.org>
Date:   Mon, 12 Jun 2023 08:50:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: drm/fb-helper: Fix height, width, and accel_flags in fb_var
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=741083
  Lore link: https://lore.kernel.org/r/2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


