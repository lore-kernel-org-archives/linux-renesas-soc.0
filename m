Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2966CC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Mar 2021 09:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECDB56500F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Mar 2021 09:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhCPJKv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Mar 2021 05:10:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232069AbhCPJK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 05:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2BED665006
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615885808;
        bh=jlgJNxF6N02sHwJOpIl9RvjeFMxXUEPNZK0nMAkJ/gA=;
        h=Subject:From:Date:To:From;
        b=BuJwj0hbMOo/yoyRZrmmkDQRgpKDrC42TMDAcQ/aeEeK2PL2ejAmkW5TBE3fW+WYD
         ihhpouN9Y9FELTL1fv3g1B6yt6MHYTXFAml6i8r8V1klC/wYn0i9dBoJebM0/TzqxH
         i//yJDSBmlQJLVL27wXvsgYQqPlgvRsBfX+0UR3p6L5P//JR3zPxpZ15v8mvbICme4
         krkevjp6EA+WdbNFnTU/RLlGU7TIzrPssUw+B3SIpXjP0jL2fHae/2ewwb/06FB3Rt
         Bjwz1Lb9vs++1QV0FqELrnpnrDO3t2TlLMOsNahYQM6TrqPqqAQqyYScNygVeoTtDh
         ujNzesDAuX8/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161588580803.18137.14154587036682883319.git-patchwork-summary@kernel.org>
Date:   Tue, 16 Mar 2021 09:10:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: r8a77980: fix vin4-7 binding
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=447237
  Lore link: https://lore.kernel.org/r/20210312174735.2118212-1-niklas.soderlund+renesas@ragnatech.se

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


