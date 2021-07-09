Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C2C07E99
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  9 Jul 2021 18:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A99A613B2
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  9 Jul 2021 18:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGISRT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:17:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40990 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhGISRT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jul 2021 14:17:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169IEKqM110941;
        Fri, 9 Jul 2021 13:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1625854460;
        bh=T19ORWXR5mLbc8VRxk0RryVptMtINjw/qaywWeyl1Hs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pDbXCE4E9TMTlPGBpePmMsnDLClJPYDxBfCuCm7e/LC5PY6ma81jhYgv+vsVjRNRL
         uj20VGIfkObmh5iBeiQJYntWSqhCA79O7JKXt8NfLiVYkkvl0DxKObPHIVIV3Sn4bj
         Dexo5nzteALh4NCetHw4MTiKf7wjuMSnx3GpPSXw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169IEK96091988
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Jul 2021 13:14:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 9 Jul
 2021 13:14:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 9 Jul 2021 13:14:20 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169IEIH4082716;
        Fri, 9 Jul 2021 13:14:19 -0500
Subject: Re: PHY reset may still be asserted during MDIO probe
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC:     netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdXno2OUHqsAfO0z43JmGkFehD+FJ2dEjEsr_P53oAAPxA@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <42ce02e9-09f1-55b9-775d-01ae6b40e36f@ti.com>
Date:   Fri, 9 Jul 2021 21:14:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXno2OUHqsAfO0z43JmGkFehD+FJ2dEjEsr_P53oAAPxA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 09/07/2021 18:33, Geert Uytterhoeven wrote:
> Hi all,
> 
> I'm investigating a network failure after kexec on the Renesas Koelsch
> and Salvator-XS development boards, using the sh-eth or ravb driver.
> 
> During normal boot, the Ethernet interface is working fine:
> 
>      libphy: get_phy_c22_id:814: sh_mii: mdiobus_read() MII_PHYSID1 returned 34
>      libphy: get_phy_c22_id:824: sh_mii: mdiobus_read() MII_PHYSID2 returned 5431
>      libphy: get_phy_c22_id:832: sh_mii: phy_id = 0x00221537
>      libphy: get_phy_device:895: sh_mii: get_phy_c22_id() returned 0
>      fwnode_mdiobus_register_phy:109: sh_mii: get_phy_device() returned (ptrval)
>      fwnode_mdiobus_phy_device_register:46: sh_mii: fwnode_irq_get() returned 191
>      libphy: mdiobus_register_gpiod:48: mdiodev->reset_gpio = (ptrval)
>      mdio_bus ee700000.ethernet-ffffffff:01:
> mdiobus_register_device:88: assert MDIO reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 1)
>      mdio_bus ee700000.ethernet-ffffffff:01: phy_device_register:931:
> deassert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 0)
>      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: phy_probe:3026:
> deassert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 0)
>      fwnode_mdiobus_phy_device_register:75: sh_mii:
> phy_device_register() returned 0
>      fwnode_mdiobus_register_phy:137: sh_mii:
> fwnode_mdiobus_phy_device_register() returned 0
>      of_mdiobus_register:188: of_mdiobus_register_phy(sh_mii,
> /soc/ethernet@ee700000/ethernet-phy@1, 1) returned 0
>      sh-eth ee700000.ethernet eth0: Base address at 0xee700000,
> 2e:09:0a:00:6d:85, IRQ 126.
> 
> When using kexec, the PHY reset is asserted before starting the
> new kernel:
> 
>      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: phy_detach:1759:
> assert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 1)
>      kexec_core: Starting new kernel
>      Bye!
> 
> The new kernel fails to probe the PHY, as the PHY reset is still
> asserted:
> 
>      libphy: get_phy_c22_id:814: sh_mii: mdiobus_read() MII_PHYSID1
> returned 65535
>      libphy: get_phy_c22_id:824: sh_mii: mdiobus_read() MII_PHYSID2
> returned 65535
>      libphy: get_phy_c22_id:832: sh_mii: phy_id = 0xffffffff
>      libphy: get_phy_device:895: sh_mii: get_phy_c22_id() returned -19
>      fwnode_mdiobus_register_phy:109: sh_mii: get_phy_device() returned -ENODEV
>      of_mdiobus_register:188: of_mdiobus_register_phy(sh_mii,
> /soc/ethernet@ee700000/ethernet-phy@1, 1) returned -19
>      mdio_bus ee700000.ethernet-ffffffff: MDIO device at address 1 is missing.
>      sh-eth ee700000.ethernet eth0: Base address at 0xee700000,
> 2e:09:0a:00:6d:85, IRQ 126.
> 
> This issue can also be reproduced using unbind:
> 
>      # echo ee700000.ethernet > /sys/bus/platform/drivers/sh-eth/unbind
>      sh-eth ee700000.ethernet eth0: Link is Down
>      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: phy_detach:1759:
> assert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 1)
>      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: phy_remove:3120:
> assert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 1)
>      mdio_bus ee700000.ethernet-ffffffff:01: phy_device_remove:974:
> assert PHY reset
>      libphy: mdio_device_reset:124: calling gpiod_set_value_cansleep(..., 1)
> 
> and bind:
> 
>      # echo ee700000.ethernet > /sys/bus/platform/drivers/sh-eth/bind
>      (same log as kexec boot)
> 
> I think fwnode_mdiobus_register_phy() should do the PHY reset (assert +
> deassert) before calling get_phy_device(), but currently that happens
> in phy_device_register(), which is called later.

Seems like similar to [1], only PHY ID in DT compatible is current w/a.

[1] https://lkml.org/lkml/2020/10/23/750

-- 
Best regards,
grygorii
