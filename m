Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32AEC4361B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Dec 2020 09:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90AD22076A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Dec 2020 09:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439495AbgLNJAz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Dec 2020 04:00:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:46750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439362AbgLNJAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 04:00:55 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607936414;
        bh=swhhn5xZIcjO9raVCw266go1Qkh8PZ2VClGRcUSysT0=;
        h=Subject:From:Date:To:From;
        b=k7fSQXSWVosA090sn1C/wMcKShGUDuDbsahrVIe7NQerHfDBfCRx+iPrMcgmhVteK
         lJd9v7vFnj52JPp32L++rMAovN2H63kzgiWA/4fMHAtiPAlEd0a1zw5VyWNacgubsn
         yd6Png3tSa2M7y+4FUjfsK02Oa19Di14xcuHrSTRMz0/i/IsXLJh6ATkdvv0RfYX11
         NllbWr2FavRRK0bJfDihV7vE2zTQeyVANinckR7fy6Ux+L8Avc2LrTijVgyNuZBFuY
         IGWKxrUWVnQ2uGEYXYNdNSV5R6ssffwzL5B/+uWThF4n9aSgiM5q/mmOWWS8+MDhZY
         ob0VeHtxsTiKQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160793641443.26783.15225885889906433147.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Dec 2020 09:00:14 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: mmc: tmio: improve bringing HW to a sane state with MMC_POWER_OFF
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=391125
  Lore link: https://lore.kernel.org/r/20201125204953.3344-1-wsa+renesas@sang-engineering.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


