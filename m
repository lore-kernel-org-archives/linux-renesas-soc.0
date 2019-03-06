Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AF7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6186520684
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PnRQ9jcQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfCFNJ4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:09:56 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53591 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfCFNJ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:09:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4D66825B7D0;
        Thu,  7 Mar 2019 00:09:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551877794; bh=q+ZrR6CH1SbLrwN+o81eXHnoEpH5rvgtU1hw7QBR0uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PnRQ9jcQBxQIXhnq4QOa4JhsA36n5a/0IEbi8raiPpfhghC0ltX1zuQpNLpeiGDIT
         +IwuMp0LH88axH9dsnA3TM7GghEKuvCwRf2ozrKPp5gSeGvNPukEgCTBv7m7l5t/db
         /HhQYyAijfw8yzF7IjbAFGtrxsjH7YnSkjLAiREY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 796B394030D; Wed,  6 Mar 2019 14:09:52 +0100 (CET)
Date:   Wed, 6 Mar 2019 14:09:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/9] Add USB3.0 and TI HD3SS3220 driver support
Message-ID: <20190306130952.3ehrtw23ji2phir6@verge.net.au>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 09:07:17AM +0000, Biju Das wrote:
> This series adds USB 3.0 support for the CAT874 platform, including a
> new driver for the TI HD3SS3220 USB Type-C DRP port controller.
> 
> This patch series supports:
> 1) Host hotplug operation
> 2) Device hot plug operation
> 3) USB type-C data_role switch 
>    (Tested with 2 RZ/G2E boards connected with a Type-C cable)
> 
> This patchset is based on usb_next and renesas-devel-20190304-v5.0 branch.
> 
> Biju Das (9):
>   dt-bindings: usb: hd3ss3220 device tree binding document
>   dt-bindings: usb: renesas_usb3: add extcon support
>   usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
>   usb: gadget: udc: renesas_usb3: use extcon framework to receive
>     connect/disconnect

Hi Biju,

I am marking the patches below as deffered pending acceptance of
the dt-bindings patches above.

>   arm64: defconfig: enable TYPEC_HD3SS3220 config option
>   arm64: renesas_defconfig: Enable TYPEC_HD3SS3220 config option
>   arm64: dts: renesas: r8a774c0-cat874: enable USB3.0 host/peripheral
>     device node
>   arm64: dts: renesas: r8a774c0-cat874: Enable TI HD3SS3220 support
>   arm64: dts: renesas: r8a774c0-cat874: Enable extcon support
> 
>  .../devicetree/bindings/usb/renesas_usb3.txt       |   2 +
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  15 ++
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  31 +++
>  arch/arm64/configs/defconfig                       |   2 +
>  arch/arm64/configs/renesas_defconfig               |   2 +
>  drivers/usb/gadget/udc/renesas_usb3.c              | 115 +++++++--
>  drivers/usb/typec/Kconfig                          |  10 +
>  drivers/usb/typec/Makefile                         |   1 +
>  drivers/usb/typec/hd3ss3220.c                      | 284 +++++++++++++++++++++
>  9 files changed, 446 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
>  create mode 100644 drivers/usb/typec/hd3ss3220.c
> 
> -- 
> 2.7.4
> 
