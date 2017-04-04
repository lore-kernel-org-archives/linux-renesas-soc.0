Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:12232 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753502AbdDDNYX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 09:24:23 -0400
Subject: Re: [PATCH v3] phy: rcar-gen3-usb2: fix implementation for runtime PM
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1489448261-4477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <PS1PR06MB1692D44568A686A74DC7573AD80B0@PS1PR06MB1692.apcprd06.prod.outlook.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <3af8a3d4-9801-b015-ed83-7f0a190cb767@ti.com>
Date: Tue, 4 Apr 2017 18:53:52 +0530
MIME-Version: 1.0
In-Reply-To: <PS1PR06MB1692D44568A686A74DC7573AD80B0@PS1PR06MB1692.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Tuesday 04 April 2017 05:06 PM, Yoshihiro Shimoda wrote:
> Hi Kishon,
> 
>> From: Yoshihiro Shimoda, Sent: Tuesday, March 14, 2017 8:38 AM
>>
>> This patch fixes an issue that this driver doesn't take care of the runtime
>> PM. This code assumed that devm_phy_create() called pm_runtime_enable(dev),
>> but it misunderstood the dev_phy_create()'s specification.
>> This driver should call its own pm_runtime_enable() before dev_phy_create().
>>
>> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> ---
>>  Changes from v2:
>>   - revise the commit log (s/pm_runtime_pm/pm_runtime_enable)
>>
>>  Changes from v1:
>>   - revise the commit log (s/the own/its own/)
>>   - simplify return code in probe().
> 
> I'm afraid but would you review this patch?

sure, the patch looks good.

merged now, thanks.

-Kishon
