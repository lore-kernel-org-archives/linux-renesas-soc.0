Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CF8C10F12
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 06:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A412206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 06:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vBPX8Uta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfDQGJX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 02:09:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52420 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfDQGJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 02:09:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3H68xHv109188;
        Wed, 17 Apr 2019 01:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555481339;
        bh=ydrxWAYyPW4aWcMfPs5emOVhBDW6Tl6LudeH3x689fU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vBPX8UtarulC3FTBTFXQZAUy82ZyAUmMP9SlDxxRp+JqR8FLTOFPQUXIn5e38zEI4
         FfNT4DjR8/txXskIQjlCeAiNYsULZ+lkGuR11f5yf/JSVXpEBo1GVgcBJIo7JHjtmZ
         beHGkVzs3hCxgwNvdfPYdpInoToCsmLEckvBjL3o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3H68xYv051824
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Apr 2019 01:08:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Apr 2019 01:08:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Apr 2019 01:08:59 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3H68rSp033133;
        Wed, 17 Apr 2019 01:08:54 -0500
Subject: Re: [PATCH V5 00/13] Add USB2.0 support
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <5a8762df-265a-03f9-5b85-925dd731df8a@ti.com>
Date:   Wed, 17 Apr 2019 11:37:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 10/04/19 8:18 PM, Biju Das wrote:
> This series adds USB 2.0 support for the RZ/G1C SoC. RZ/G1C
> SoC is similar to R-Car Gen2 SoC, but there are some differences
> 
> - It has a shared pll reset register for hsusb0/hsusb1 and this register 
>   reside in hsusb0 block.
> 
> - Each USB host needs to deassert the pll reset of hsusb block apart from
>   initializing interrupt enable,OVC detection timer and suspend/resume timer
>   register.
> 
> To address the above scenarios, created a ehci-r8a77470 host controller
> driver.
> 
> This patchset is based on linux_next next-20190410 branch.
> V4-->V5
>    * Incoporated Shimoda-san's review comment
>      (https://patchwork.kernel.org/patch/10879893/)
> V3-->V4
>   * Incoporated Kishon and Shimoda-san's review comment
>     (https://patchwork.kernel.org/patch/10883265/)
>   * Added missing rcar-gen3-phy-usb2 phy in ohci1 node.
> 
> V2-->V3
>  * Incorporated Alan's review comment for dropping ehci-r8a77470 host driver
>  * Incorporated shimoda-san's comments.
>    Ref: https://patchwork.kernel.org/patch/10879899/
> 
> V1-->V2
>  * Incorporated Rob's review comment
>    Ref: https://patchwork.kernel.org/patch/10655853/
>  * Incorporated Shimoda-San's review comment
>    Ref: https://patchwork.kernel.org/patch/10655855/
>  * Created ehci-r8a77470 host driver.
> 
> Biju Das (13):
>   dt-bindings: phy: rcar-gen2: Add r8a77470 support
>   phy: renesas: phy-rcar-gen2: Add support for r8a77470
>   dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
>   phy: rcar-gen3-usb2: Add support for r8a77470

merged the PHY patches, thanks.

-Kishon

>   ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
>   dt-bindings: usb: renesas_usbhs: Add support for r8a77470
>   ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in
>     shmobile_defconfig
>   ARM: dts: r8a77470: Add USB PHY DT support
>   ARM: dts: iwg23s-sbc: Enable USB Phy[01]
>   ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
>   ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
>   ARM: dts: r8a77470: Add HSUSB device nodes
>   ARM: dts: iwg23s-sbc: Enable HS-USB
> 
>  .../devicetree/bindings/phy/rcar-gen2-phy.txt      |  57 ++++++++-
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   6 +-
>  .../devicetree/bindings/usb/renesas_usbhs.txt      |   1 +
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  44 +++++++
>  arch/arm/boot/dts/r8a77470.dtsi                    | 141 +++++++++++++++++++++
>  arch/arm/configs/shmobile_defconfig                |   3 +
>  drivers/phy/renesas/Kconfig                        |   2 +-
>  drivers/phy/renesas/phy-rcar-gen2.c                | 130 +++++++++++++++++--
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  39 +++++-
>  9 files changed, 398 insertions(+), 25 deletions(-)
> 
