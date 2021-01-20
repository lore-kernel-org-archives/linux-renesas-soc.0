Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2EDC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Jan 2021 00:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F43223108
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Jan 2021 00:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbhATAuw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:50:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730549AbhATAuu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 19:50:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C15B623109;
        Wed, 20 Jan 2021 00:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611103809;
        bh=LtxxyRIHpoZ8pyHYd8BJeEaCUydeJtYDQL+hjWN0aIo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=risNMGVbLJGgt5RVQssCjMl9yj+0u24htDhumTh/XAJbj66H0MA2IU4E/6XwsgYmw
         3NzpDChv9L0szesGt3aqrMDDAZfQTpfc4uwGXjnLb+odpgN9QIOFSTFVZ+w59S8Z8h
         ecyxPMgUju2IEjN9if0SOF41lYEleppeKY9qUx1hmMEOWxdGJRL0BfqXihAtKPsN0J
         ovTY4jijhAMJqf+EUTZppGg2DNGFfuZhm+ffAyj0NSUwn9sRhqxTIXrGM0nDD2uXvn
         l0AskOuujthgU4yAe65D6cJutxMBBD1z8Jkbr9UGqsmKi302euKOr66Kb6RlVxD57e
         kAXR+TLwNm7kA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] sh_eth: Fix power down vs. is_opened flag ordering
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161110380973.31620.4370293921348341314.git-patchwork-notify@kernel.org>
Date:   Wed, 20 Jan 2021 00:50:09 +0000
References: <20210118150812.796791-1-geert+renesas@glider.be>
In-Reply-To: <20210118150812.796791-1-geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     sergei.shtylyov@gmail.com, davem@davemloft.net, kuba@kernel.org,
        horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 18 Jan 2021 16:08:12 +0100 you wrote:
> sh_eth_close() does a synchronous power down of the device before
> marking it closed.  Revert the order, to make sure the device is never
> marked opened while suspended.
> 
> While at it, use pm_runtime_put() instead of pm_runtime_put_sync(), as
> there is no reason to do a synchronous power down.
> 
> [...]

Here is the summary with links:
  - sh_eth: Fix power down vs. is_opened flag ordering
    https://git.kernel.org/netdev/net/c/f6a2e94b3f9d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


