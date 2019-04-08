Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB57AC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8357920880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WWf31w5s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfDHJkA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:40:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49605 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfDHJkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 05:40:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D44A425B766;
        Mon,  8 Apr 2019 19:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554716398; bh=37CgdXWXzi4pD9PqZ3OGQxM6CycefGVw081L+88Kw/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WWf31w5sop5BBWQNJZ4DxAY2cyszY/5oHEPFhtvlQ0peeWOC/D8lB3yQYliubkxCX
         8zOGk2QQ2+nAg91eEaov5X2J91I86DPE1HmOHI3LSv1SYxUJNDPALI2TB+puUsIrSO
         5IcFVgBzVGnF3JlECXGnLrmXfoMpbolAAxnU4D04=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DBA1494069B; Mon,  8 Apr 2019 11:39:55 +0200 (CEST)
Date:   Mon, 8 Apr 2019 11:39:55 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable REALTEK_PHY config
 option
Message-ID: <20190408093955.6npyrltuqpuoo6bz@verge.net.au>
References: <1554452086-51303-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554452086-51303-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 09:14:46AM +0100, Biju Das wrote:
> Enable support for Realtek phy, which is used by RZ/G2E (r8a774c0) based
> Silicon Linux CAT874 board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/configs/renesas_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
> index 8a83012..0a17854 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -111,6 +111,7 @@ CONFIG_VIRTIO_NET=y
>  CONFIG_RAVB=y
>  CONFIG_MDIO_BUS_MUX_MMIOREG=y
>  CONFIG_MICREL_PHY=y
> +CONFIG_REALTEK_PHY=y
>  # CONFIG_WLAN is not set
>  CONFIG_INPUT_MATRIXKMAP=y
>  CONFIG_INPUT_EVDEV=y
> -- 
> 2.7.4
> 
