Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF03C001DB
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Aug 2023 09:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbjHKJar (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Aug 2023 05:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjHKJaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2023 05:30:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8699E30FC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Aug 2023 02:30:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26A54647E1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Aug 2023 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83001C433C7;
        Fri, 11 Aug 2023 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691746223;
        bh=nXsL5D2SmR6PQ342tmIlwaCeQ8RW15hutcZ3pzvhXps=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vFJZvuQZA3Q0urn7AXMvUTE3+di+0mGaQTSWA1u7LtOg/+LoNq/bYsV72l0+lEDWV
         JHM6Mr42PJn0yb65hfg3hlJ1MXAD6IFcgb9R91nSOQ0WQqfbQ52p1UTOs4JyLhDiHe
         MDhGJopTxJMlcuQw7sIVejEwiD1T48VyvfcEfJvCCqxRpN6XD85AW3Elrg59ca2DOE
         tYfy7zF3/lHuo5I8jq8j68mBnp8WXiFD+icFjnMD2iUEpBAQP5n7HCS4RmwVwy5/F+
         gEBLEulGhaNwEOFjT8Rn8IHsca5xV1L/lqQgj9a/uyBnrkWpfa4nVd8qx3Ao7fRm7V
         vt4QwTJls/YVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62BCCC3274B;
        Fri, 11 Aug 2023 09:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: pcs: Add missing put_device call in miic_create
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169174622340.8242.5529034838264885270.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Aug 2023 09:30:23 +0000
References: <20230810140639.2129454-1-xiangyang@huaweicloud.com>
In-Reply-To: <20230810140639.2129454-1-xiangyang@huaweicloud.com>
To:     Xiang Yang <xiangyang@huaweicloud.com>
Cc:     clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com,
        f.fainelli@gmail.com, linux-renesas-soc@vger.kernel.org,
        netdev@vger.kernel.org, xiangyang3@huawei.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 10 Aug 2023 22:06:39 +0800 you wrote:
> From: Xiang Yang <xiangyang3@huawei.com>
> 
> The reference of pdev->dev is taken by of_find_device_by_node, so
> it should be released when not need anymore.
> 
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: pcs: Add missing put_device call in miic_create
    https://git.kernel.org/netdev/net/c/829c6524d672

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


