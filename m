Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD43C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CDD1214C6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="D03xQT3J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbeLRJoS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:44:18 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeLRJoS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 04:44:18 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9769425B75B;
        Tue, 18 Dec 2018 20:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545126256; bh=h8+vdbtUvz4i8LtdAD3JOr+P3D9Xylmf/FyK1LfVORE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D03xQT3JOYMg/7cFXFtfn2ZYxYYBkEz1uKosDElZmToBlmhaw3IARXtb/MZraGQZ2
         RnohWZH6ZjhGtH4Hii+mMzjShA3ML6NKuOn1qKGUwggV3OV1lgGrRLKFY/kT/+pKh4
         1obLVkHFrGf2tU++U+V5bAMgQP6l4KRb8sthk55Q=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3C725940274; Tue, 18 Dec 2018 10:44:13 +0100 (CET)
Date:   Tue, 18 Dec 2018 10:44:13 +0100
From:   Simon Horman <horms@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2 0/3] Renesas ARM64 Based SoC Defconfig Updates for
 v4.21
Message-ID: <20181218094407.hfe7aei2hmnsih5u@verge.net.au>
References: <20181214115647.12391-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181214115647.12391-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Again,

On Fri, Dec 14, 2018 at 12:56:47PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v4.21.
> 
> As requested I have revised the series to enablement of ASoC simple SCU
> sound card support to do so as a module rather than a built-in.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-v2-for-v4.21
> 
> for you to fetch changes up to 72c636469a3606f8aa69d9208d614f78d99f2d25:
> 
>   arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE (2018-12-13 12:24:58 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.21 (v2)
> 
> * Enable in arm64 defconfig:
>   - Renesas R-Car Gen3 PCIe PHY driver
>   - Renesas R-Car thermal driver
>   - ASoC simple SCU sound card support

It seems that Morimoto-san has determined that the sound card patch is not
necessary. Rather than move to v3 for these not entirely critical changes I
would prefer to withdraw this pull request and revisit these changes for
v4.22 although if you do happen to pull this then I don't think any harm
would be done.

I apologise for any inconvenience this may cause.

> Changes in v2
> * Enable ASoC simple SCU sound card support as a module rather than a built-in
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
> 
> Simon Horman (2):
>       arm64: defconfig: Enable R-Car thermal driver
>       arm64: defconfig: Enable scu-simple-card driver
> 
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
