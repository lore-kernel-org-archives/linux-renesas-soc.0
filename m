Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71F8C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70A7E20870
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="as+flMS2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfDHR35 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 13:29:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46045 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfDHR34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 13:29:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id s15so17336737wra.12;
        Mon, 08 Apr 2019 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lcuTsEKqAFKSruYAzF6mPDnV0OqCEM8fez0VmNgciAs=;
        b=as+flMS2L0JN0rfl7hbDRBDXwlEwpoc8UOHbGE/XNcnFlYvXMKP3TzYU4uMohRidQ7
         6TCmdWaTze2C5XXjf0VPFrbdd4kVQg9mb+5Hi+HXIGB1ueD4wWl18d7g02rPWVzZQV4h
         3AxP+uRXGQrCtJNW8GzZbom6owAnGQ1ZabBErc98A/BL7rycJ2Exrb64pEkd21uFEWzd
         1pJsMYkLRewaoprKbFQHRUc08A6Dxm/bfWtNLAf6Muyno2jDNmGoeSZ8Ns+7kq4E8AFP
         FrRQQZQoqRHcwG18FYDo6XgmXYTkiIKf6HHeNnuV/kC+Z5UPqlWNS6qXbSQ3fFvdf3iY
         /tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lcuTsEKqAFKSruYAzF6mPDnV0OqCEM8fez0VmNgciAs=;
        b=Wx5z90DrHjn9AjVic6CIPKzoU4vJCGPqTiXeosAessjfcLMnvggv39d9vHRG8jh7o2
         TOFUaYNN/qlLvKps7XbEW6wA3F+euVbeAqO0RycIltc9BTvFcPewaSD5q9UsU6vFE+w4
         iVefhY5OCJLDhkqwKD/28BYJeNJnbcWV+2u8Cg4K7ds2UtdV+tRxUOQ2iBHItORuVr4w
         Ma5dNaChXnRR57AheexlQmE33rMt1AZnTMkRRvrXimlnk1YQKJtf2PwZ05k96pDbgv9F
         lriNwQwfCOqhN3G3x2xPb4AixoXmzbtucX0SNWQVAoKl5AtLkdkUmD/YVPL7wsD4lOEN
         eiOA==
X-Gm-Message-State: APjAAAVShEEPl4zh8PbTHGOux4fPLhTtDWDLkG98TBgMOPutcCyhoazm
        Ou4Z15MmOoG1r8seAiKfwh6vF84W
X-Google-Smtp-Source: APXvYqw8EPRU0qha8MXua+WZDVTEPYPeTQLe21Vogg+qtVao4uEi7cyIRR1YS1IVedd1EUZdKs5vHA==
X-Received: by 2002:adf:e547:: with SMTP id z7mr20963797wrm.295.1554744594427;
        Mon, 08 Apr 2019 10:29:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bde:d800:1488:bc0a:4c8c:6b35? (p200300EA8BDED8001488BC0A4C8C6B35.dip0.t-ipconnect.de. [2003:ea:8bde:d800:1488:bc0a:4c8c:6b35])
        by smtp.googlemail.com with ESMTPSA id 204sm21825912wmc.1.2019.04.08.10.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 10:29:53 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: fix autoneg mismatch case in
 genphy_read_status
To:     Simon Horman <horms@verge.net.au>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
 <20190405161628.67z7acycfu7beqln@verge.net.au>
 <b5c4f0da-f4ac-3a4b-923e-ebe021ed0550@gmail.com>
 <20190408074702.o6orqut3wgxfllsa@verge.net.au>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <86c0fe4c-8620-5acf-99f2-26600b9abebc@gmail.com>
Date:   Mon, 8 Apr 2019 19:29:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408074702.o6orqut3wgxfllsa@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08.04.2019 09:47, Simon Horman wrote:
> On Sun, Apr 07, 2019 at 05:09:28PM +0200, Heiner Kallweit wrote:
>> On 05.04.2019 18:16, Simon Horman wrote:
>>> On Tue, Apr 02, 2019 at 08:43:30PM +0200, Heiner Kallweit wrote:
>>>> The original patch didn't consider the case that autoneg process
>>>> finishes successfully but both link partners have no mode in common.
>>>> In this case there's no link, nevertheless we may be interested in
>>>> what the link partner advertised.
>>>>
>>>> Like phydev->link we set phydev->autoneg_complete in
>>>> genphy_update_link() and use the stored value in genphy_read_status().
>>>> This way we don't have to read register BMSR again.
>>>>
>>>> Fixes: b6163f194c69 ("net: phy: improve genphy_read_status")
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> Hi,
>>>
>>> I have observed a regression with this patch as present as
>>> 4950c2ba49cc ("net: phy: fix autoneg mismatch case in genphy_read_status")
>>> in net-next.
>>>
>>> The platform is the Renesas R-Car E3 (r8a77990) based Ebisu-4D board.
>>>
>>>
>>> Without this patch (commit before 4950c2ba49cc) the link is negotiated
>>> as follows:
>>>
>>> [    3.257699] libphy: ravb_mii: probed
>>> [    3.266498] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
>>> [    3.537082] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
>>> [    9.667161] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
>>>
>>> # ethtool --version
>>> ethtool version 3.16
>>> # ethtool eth0
>>> Settings for eth0:
>>>         Supported ports: [ TP MII ]
>>>         Supported link modes:   100baseT/Full 
>>>                                 1000baseT/Full 
>>>         Supported pause frame use: No
>>>         Supports auto-negotiation: Yes
>>>         Advertised link modes:  100baseT/Full 
>>>                                 1000baseT/Full 
>>>         Advertised pause frame use: No
>>>         Advertised auto-negotiation: Yes
>>>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>>>                                              100baseT/Half 100baseT/Full 
>>>                                              1000baseT/Full 
>>>         Link partner advertised pause frame use: No
>>>         Link partner advertised auto-negotiation: Yes
>>>         Speed: 1000Mb/s
>>>         Duplex: Full
>>>         Port: MII
>>>         PHYAD: 0
>>>         Transceiver: external
>>>         Auto-negotiation: on
>>>         Supports Wake-on: g
>>>         Wake-on: d
>>>         Current message level: 0x000000cc (204)
>>>                                link timer rx_err tx_err
>>>         Link detected: yes
>>>
>>>
>>> With this patch the link is negotiated as follows, note the "Unknown":
>>>
>>> [    3.268609] libphy: ravb_mii: probed
>>> [    3.277402] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
>>> [    3.565057] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
>>> [    9.804423] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
>>>
>>> And ethtool reports:
>>>
>>> # ethtool eth0
>>> Settings for eth0:
>>>         Supported ports: [ TP MII ]
>>>         Supported link modes:   100baseT/Full 
>>>                                 1000baseT/Full 
>>>         Supported pause frame use: No
>>>         Supports auto-negotiation: Yes
>>>         Advertised link modes:  100baseT/Full 
>>>                                 1000baseT/Full 
>>>         Advertised pause frame use: No
>>>         Advertised auto-negotiation: Yes
>>>         Speed: Unknown!
>>>         Duplex: Unknown! (255)
>>>         Port: MII
>>>         PHYAD: 0
>>>         Transceiver: external
>>>         Auto-negotiation: on
>>>         Supports Wake-on: g
>>>         Wake-on: d
>>>         Current message level: 0x000000cc (204)
>>>                                link timer rx_err tx_err
>>>         Link detected: yes
>>>
>>>
>>>
>>> I noticed this when preparing a patch limit the maximum speed the device to
>>> 100Mbit/s as follows:
>>>
>>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>>> @@ -272,6 +272,7 @@
>>>                 interrupt-parent = <&gpio2>;
>>>                 interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
>>>                 reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
>>> +               max-speed = <100>;
>>>         };
>>>  };
>>>  
>>> While the 100Mbit/s limit applied on top of the commit before 4950c2ba49cc
>>> things work as expected:
>>>
>>> [    3.258347] libphy: ravb_mii: probed
>>> [    3.266739] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
>>> [    3.553642] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
>>> [    5.585027] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
>>>
>>> # ethtool eth0
>>> Settings for eth0:
>>>         Supported ports: [ TP MII ]
>>>         Supported link modes:   100baseT/Full 
>>>         Supported pause frame use: No
>>>         Supports auto-negotiation: Yes
>>>         Advertised link modes:  100baseT/Full 
>>>         Advertised pause frame use: No
>>>         Advertised auto-negotiation: Yes
>>>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>>>                                              100baseT/Half 100baseT/Full 
>>>         Link partner advertised pause frame use: No
>>>         Link partner advertised auto-negotiation: Yes
>>>         Speed: 100Mb/s
>>>         Duplex: Full
>>>         Port: MII
>>>         PHYAD: 0
>>>         Transceiver: external
>>>         Auto-negotiation: on
>>>         Supports Wake-on: g
>>>         Wake-on: d
>>>         Current message level: 0x000000cc (204)
>>>                                link timer rx_err tx_err
>>>         Link detected: yes
>>>
>>>
>>> However, with the 100Mbit/s limit applied on top of 4950c2ba49cc the boot hangs
>>> while (or just after?) negotiating the link:
>>>
>>> [    3.541549] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
>>> [    5.536389] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
>>>
>>>
>>
>> There's one path where phydev->autoneg_complete isn't set.
>> Could you please test whether the following fixes the issue?
>>
>>
>> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
>> index a6f3ad971..2df8f7737 100644
>> --- a/drivers/net/phy/phy_device.c
>> +++ b/drivers/net/phy/phy_device.c
>> @@ -1710,19 +1710,17 @@ int genphy_update_link(struct phy_device *phydev)
>>  	 */
>>  	if (!phy_polling_mode(phydev)) {
>>  		status = phy_read(phydev, MII_BMSR);
>> -		if (status < 0) {
>> +		if (status < 0)
>>  			return status;
>> -		} else if (status & BMSR_LSTATUS) {
>> -			phydev->link = 1;
>> -			return 0;
>> -		}
>> +		else if (status & BMSR_LSTATUS)
>> +			goto done;
>>  	}
>>  
>>  	/* Read link and autonegotiation status */
>>  	status = phy_read(phydev, MII_BMSR);
>>  	if (status < 0)
>>  		return status;
>> -
>> +done:
>>  	phydev->link = status & BMSR_LSTATUS ? 1 : 0;
>>  	phydev->autoneg_complete = status & BMSR_ANEGCOMPLETE ? 1 : 0;
>>  
> 
> Thanks, that seems to resolve the problem I observed.

Great, thanks for reporting and testing!
I'll submit this fix then.

Heiner
