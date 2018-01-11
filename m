Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:41701 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754357AbeAKU2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 15:28:40 -0500
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
To: David Miller <davem@davemloft.net>, geert+renesas@glider.be
Cc: rmk+kernel@armlinux.org.uk, andrew@lunn.ch, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180111.104835.381039264896352436.davem@davemloft.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a2cc8462-be89-cc53-46b9-f172921b01a9@gmail.com>
Date: Thu, 11 Jan 2018 12:28:36 -0800
MIME-Version: 1.0
In-Reply-To: <20180111.104835.381039264896352436.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/11/2018 07:48 AM, David Miller wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Date: Tue,  9 Jan 2018 12:11:21 +0100
> 
>> In case of success, the return values of (__)phy_write() and
>> (__)phy_modify() are not compatible: (__)phy_write() returns 0, while
>> (__)phy_modify() returns the old PHY register value.
>>
>> Apparently this change was catered for in drivers/net/phy/marvell.c, but
>> not in other source files.
>>
>> Hence genphy_restart_aneg() now returns 4416 instead zero, which is
>> considered an error:
>>
>>     ravb e6800000.ethernet eth0: failed to connect PHY
>>     IP-Config: Failed to open eth0
>>     IP-Config: No network devices available
>>
>> Fix this by converting positive values to zero in all callers of
>> phy_modify().
>>
>> Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Alternatively, __phy_modify() could be changed to follow __phy_write()
>> semantics?
> 
> I really want a resolution to this quickly, this broke lots of stuff
> for people.
> 
> __phy_modify() wants to return multiple values, so it should be coded
> up to do so explicitly rather than trying to encode two values from
> overlapping value spaces in one return value.
> 
> That means the original value should be returned by-reference.  And
> this will make the error/no-error return value unambiguous.
> 
> int __phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set,
> 		 u16 *orig_val);

I am fine with that approach, there should only be a handful of
locations where we care about the old value that __phy_modify() returns
so we should be able to wrap these accessors in a way that is not
disruptive and requires less code auditing that the patch currently
submitted.

Thanks!
-- 
Florian
