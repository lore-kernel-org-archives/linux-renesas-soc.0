Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AF9C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 570CE2084C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PJzK8S5R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfDCI6n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 04:58:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35286 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfDCI6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 04:58:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 43B1F25B820;
        Wed,  3 Apr 2019 19:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554281921; bh=/LoC+twPYK/QdZz1TN0bsY6YPmZe5atcqObBYTEfvS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PJzK8S5RCKaS32J/jLEbikkdGsHVpnpRtuwFs+4KrVHrKG0e20+fjShhl64P+G8z/
         iO1ASEHPdEw8jjA4pulew5Ml+fhvx3+62A5XDQPnq5O1kkBNJnNtolASJ0v3fDnt2M
         9d1P41ssB2JbstXcCkzdfS58FmTwVwjwQDF1NlZQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 48164940361; Wed,  3 Apr 2019 10:58:39 +0200 (CEST)
Date:   Wed, 3 Apr 2019 10:58:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.1-rc1
Message-ID: <20190403085838.ucudu633mecyxpbb@verge.net.au>
References: <20190401115625.29795-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190401115625.29795-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 01:56:25PM +0200, Geert Uytterhoeven wrote:
> Update the defconfig for Renesas ARM boards:
>   - Move CMA-related config options (moved in commit ddb26d8e1e97af23
>     ("dma-mapping: move CONFIG_DMA_CMA to kernel/dma/Kconfig"),
>   - Drop CONFIG_DRM_RCAR_LVDS=y (auto-enabled since commit
>     02f2b30032c12b1b ("drm: rcar-du: lvds: Add API to enable/disable
>     clock output")),
>   - Drop CONFIG_SND_SIMPLE_SCU_CARD=y (removed in commit
>     c8ed6aca6b824018 ("ASoC: simple-scu-card: remove simple-scu-card")).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
