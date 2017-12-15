Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53580 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755903AbdLOK3C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 05:29:02 -0500
Subject: Re: [PATCH] phy: rcar-gen3-usb2: add dependency on USB
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Cc: "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "kishon@ti.com" <kishon@ti.com>, "arnd@arndb.de" <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1513333220-44070-1-git-send-email-vladimir.murzin@arm.com>
 <TY1PR06MB0992DB1C0BCB81617E1E8583D80B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <7daf2030-4030-7072-1d2e-3905cbf1ab33@arm.com>
Date: Fri, 15 Dec 2017 10:28:59 +0000
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB0992DB1C0BCB81617E1E8583D80B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 15/12/17 10:27, Yoshihiro Shimoda wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Vladimir Murzin, Sent: Friday, December 15, 2017 7:20 PM
>>
>> Following error showed up:
>>
>> drivers/phy/renesas/phy-rcar-gen3-usb2.o: In function `rcar_gen3_phy_usb2_probe':
>> /work/tools/linux/drivers/phy/renesas/phy-rcar-gen3-usb2.c:444: undefined reference to `of_usb_get_dr_mode_by_phy'
>> Makefile:993: recipe for target 'vmlinux' failed
>> make: *** [vmlinux] Error 1
>>
>> with CONFIG_USB_SUPPORT=n
>>
>> Add dependency on USB_SUPPORT and select USB_COMMON to make sure that
>> of_usb_get_dr_mode_by_phy() is available.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> 
> Thank you for the patch! However, Arnd already sent such a patch before.
> 
> https://lkml.org/lkml/2017/11/2/373
> 
> The latest Linux-phy.git doesn't apply it yet though...

Ahh, good!

Sorry for the noise!

Vladimir

> 
> Best regards,
> Yoshihiro Shimoda
> 
