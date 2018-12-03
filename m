Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33855 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbeLCXYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 18:24:54 -0500
Subject: Re: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
To: David Miller <davem@davemloft.net>,
        yoshihiro.shimoda.uh@renesas.com
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181203.152057.61263535375452379.davem@davemloft.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <92358866-e231-15e7-84f4-86a6fa51ed49@gmail.com>
Date: Mon, 3 Dec 2018 15:24:43 -0800
MIME-Version: 1.0
In-Reply-To: <20181203.152057.61263535375452379.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/3/18 3:20 PM, David Miller wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Date: Wed, 28 Nov 2018 09:02:41 +0000
> 
>> This patch set is for R-Car Gen3 Salvator-XS boards. If we do
>> the following method, the phy cannot link up correctly.
>>
>>  1) Kernel boots by using initramfs.
>>  --> No open the nic, so phy_device_register() and phy_probe()
>>      deasserts the reset.
>>  2) Kernel enters the suspend.
>>  --> So, keep the reset signal as deassert.
>>  --> On R-Car Salvator-XS board, unfortunately, the board power is
>>      turned off.
>>  3) Kernel returns from suspend.
>>  4) ifconfig eth0 up
>>  --> Then, since edge signal of the reset doesn't happen,
>>      it cannot link up.
>>  5) ifconfig eth0 down
>>  6) ifconfig eth0 up
>>  --> In this case, it can link up.
>>
>> When resolving this issue after I got feedback from Andrew and Heiner,
>> I found an issue that the phy_device.c didn't call phy_resume()
>> if the PHY was not attached. So, patch 1 fixes it and add toggling
>> the phy reset to the micrel phy driver.
>>
>> Changes from v1 (as RFC):
>>  - No remove the current code of phy_device.c to avoid any side effects.
>>  - Fix the mdio_bus_phy_resume() in phy_device.c.
>>  - Add toggling the phy reset in micrel.c if the PHY is not attached.
> 
> Series applied, thank you.

Meh! I guess we should be faster at reviewing stuff :/
-- 
Florian
