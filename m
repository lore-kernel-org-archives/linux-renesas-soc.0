Return-Path: <SRS0=RXSY=2V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF92FC2D0C2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 10:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78F6520718
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577786423;
	bh=BqBgMHDITFOTnsoH9DNvl3DjoMb9z1AQFiSWQWQNWwk=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=rc4IuUjFdg83Q6gcG0jTeu/QpR27xj0MVqCkFCvt0c0iyS0GWaaOSQTA8kgJS/uXW
	 wjYUv3Cs/BxpA2YiPervaYZzbezY9Bzj1vdsKIaitjS+nCoS4moqiZAbi66e0kwbKC
	 pbyyDr1FQILtb4hayIGYkyaPzOY7JlIh6rg3keD4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLaKAX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 31 Dec 2019 05:00:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:39472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfLaKAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Dec 2019 05:00:22 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577786422;
        bh=BqBgMHDITFOTnsoH9DNvl3DjoMb9z1AQFiSWQWQNWwk=;
        h=Subject:From:Date:References:To:From;
        b=LAb6MJJfyOTYG+mbXvRtcHfRsaZSfts6coV2BYGrOO9fumnc7gsS5953Fw38WycCd
         /R8stgFIak5OKRRWZ0yhpBkV8BtyVNK/kNEDrSrZi3xvtfp5dD8ndGzd5FpP/r9NVW
         m8xRaZpt88K63Qaj3HC21glIuK/C0WgabS2ov35E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157778642227.30877.16877800949193588043.git-patchwork-summary@kernel.org>
Date:   Tue, 31 Dec 2019 10:00:22 +0000
References: <20191213162736.2160-1-geert+renesas@glider.be>,
 <20191213162712.2056-1-geert+renesas@glider.be>,
 <20191213162604.1890-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: sh73a0: Add missing clock-frequency for fixed clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216451

Patch: ARM: dts: r8a7778: Add missing clock-frequency for fixed clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216447

Patch: ARM: dts: rcar-gen2: Add missing mmio-sram bus properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216445

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
