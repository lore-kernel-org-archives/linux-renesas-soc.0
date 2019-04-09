Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1231CC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:03:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C31182084F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Icb4l7pu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfDILDf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:03:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41715 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfDILDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:03:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 73E0425BDAE;
        Tue,  9 Apr 2019 21:03:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554807813; bh=GG4VG6rb2RO4idD8bCO30cDIkf3TabXYCEBrc2nmVKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Icb4l7pupzL/6HWN4CVbmFVcegDePekZD5We0QQp/0vs0KrcD7pZ0Jwzyh1aO8Yix
         JE3j/UVgqRK2KN7lnSY7yupu4TTVAqXUgfxCDtja2sj7OaKDxjF4E+KGfIpdaXQiFD
         0n0NtEPmPsoAIrIQFGYUoRPITPleg3VAxGWcOeNU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A15B39402E1; Tue,  9 Apr 2019 13:03:31 +0200 (CEST)
Date:   Tue, 9 Apr 2019 13:03:31 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V3 07/13] ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM
 support in shmobile_defconfig
Message-ID: <20190409110331.yexav3b7hfwh2gfh@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-8-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 11:28:38AM +0100, Biju Das wrote:
> The USB [EO]HCI controller on RZ/G1C SoC doesn't have PCI bridge like
> other R-Car Gen2 devices. So enable generic USB [EO]HCI HCD PLATFORM
> support in shmobile_defconfig.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks Biju,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2-->V3
>  * New patch
> ---
>  arch/arm/configs/shmobile_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index ff9348d..78425dd 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -146,7 +146,9 @@ CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_R8A66597_HCD=y
>  CONFIG_USB_RENESAS_USBHS=y
>  CONFIG_USB_GADGET=y
> -- 
> 2.7.4
> 
