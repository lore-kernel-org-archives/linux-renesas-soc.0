Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4B3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:28:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 611C820870
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554125316;
	bh=zWphCEb3qKYQzYFFBTgDP8j8lJwwmUq5vF2gZ0NxZEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kvKDO6lh+A8fdLcD021tD8roO394+ghvdLyUaBRo+Ex8cZFuKah5IW3ILardAWNHp
	 cvpB3DdxarT1Oo/UssbvKpnhf19o3c/Ay/w2Ry6NHmFtkpb6kT7MWZ82WyoT9mNBs/
	 pQ8bx0zd/JEz75FP12AS59uK+oZMgefsPmEenxCQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfDAN2g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 09:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:43038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726879AbfDAN2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 09:28:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7050C2070D;
        Mon,  1 Apr 2019 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554125314;
        bh=zWphCEb3qKYQzYFFBTgDP8j8lJwwmUq5vF2gZ0NxZEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7iZThrqmL7Dwl3LrzaEeFbiu7l+nHevUNUo3XDy6P9xYz9obaMC5eiMIMG+QeqjI
         ngkEx6WqG9GEjU/awNeBXAwoL40PZym0/SeKDHAmRN9h4WAYhYxHfKbAlp4avdVCy7
         0BTHYugC1OAwojq/xxa2R91HBb9JuyfRVJHsYewk=
Date:   Mon, 1 Apr 2019 15:28:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Message-ID: <20190401132832.GA21551@kroah.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 01:53:44PM +0100, Biju Das wrote:
> This patch adds the glue code required to ensure the on-chip EHCI
> controller works on RZ/G1C(a.k.a R8A77470) SoC's from Renesas.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>   * New patch
> ---
>  drivers/usb/host/Kconfig         |   9 ++
>  drivers/usb/host/Makefile        |   1 +
>  drivers/usb/host/ehci-r8a77470.c | 327 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 337 insertions(+)
>  create mode 100644 drivers/usb/host/ehci-r8a77470.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d809671..a474aa9 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -237,6 +237,15 @@ config USB_EHCI_HCD_STI
>  	  Enable support for the on-chip EHCI controller found on
>  	  STMicroelectronics consumer electronics SoC's.
>  
> +config USB_EHCI_HCD_R8A77470
> +	tristate "Support for Renesas R8A77470 on-chip EHCI USB controller"
> +	depends on ARCH_R8A77470 && OF

COMPILE_TEST so that others can also test-build this to ensure that we
do not break anything over time?

thanks,

greg k-h
