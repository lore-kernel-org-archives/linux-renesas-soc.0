Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87914C74A5B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Mar 2023 04:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjCPElD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Mar 2023 00:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCPElB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 00:41:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C00AB8B9;
        Wed, 15 Mar 2023 21:40:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 264EFB81FDA;
        Thu, 16 Mar 2023 04:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C942CC433EF;
        Thu, 16 Mar 2023 04:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678941620;
        bh=CI/jDcchkOY09lH85COlbRa7cL1/vlG1PeNrkN0d3tQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IkotVgDZDM2oo6XOgQPxN3ZC8kgVz+e0DU3V/qZJhWCsx7tMe34o/yrfp9yaH5XMJ
         k8FVRVFtwG+GQPw1KCbHds5wjxlb1ZdD1dx5E+Zh6usEgdG7fnjD/LvbBrYAvj99FF
         QwXqxSdMDnghJBTL1levnABKAtdu3YSsahLHi0k6XneBmdOt6wH2KQ78gX+nfLafTf
         /0qyC+TdlpI16K0UHnTwpCr0vJtiKfeKgjHKYWKc2lKgOZ9yIpaX1+HGZyJnKCxqIj
         8n1j9SQnsEEgTHiLvTI8kvwpVNwtjzhk9S9VFXr6b6YU4/NJxYRoFgBgc44Rc4HKJV
         rlb8dpSZ7ShjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADE70E66CBF;
        Thu, 16 Mar 2023 04:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND net-next] net: phy: micrel: drop superfluous use of temp
 variable
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167894162070.2389.2148357333192070709.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Mar 2023 04:40:20 +0000
References: <20230314124928.44948-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230314124928.44948-1-wsa+renesas@sang-engineering.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        andrew@lunn.ch, geert+renesas@glider.be, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 14 Mar 2023 13:49:27 +0100 you wrote:
> 'temp' was used before commit c0c99d0cd107 ("net: phy: micrel: remove
> the use of .ack_interrupt()") refactored the code. Now, we can simplify
> it a little.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next] net: phy: micrel: drop superfluous use of temp variable
    https://git.kernel.org/netdev/net-next/c/a57cc54d69d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


