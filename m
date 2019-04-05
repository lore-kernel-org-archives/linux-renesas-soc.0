Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C37C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 17:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08CC5206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 17:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKy1zR0d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731537AbfDERlC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 13:41:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54682 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730329AbfDERlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 13:41:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id c1so7559774wml.4;
        Fri, 05 Apr 2019 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KjpMz5e0xk1XuuVnLjGpWkMkjC9bx+K3CftG+x8OSyc=;
        b=BKy1zR0d36ek7dQcMKTHu0g7pQz/XyQm8EAcNaWbZEXQlYUIe2RpKB5oLPt54OK6IZ
         +Pqi1j9XX1h5D5BeS+1Nr4osKBO1y2CjwcJs1xYu5FFRt2AnyPg9ilFaqBV53noyjNXa
         p08LT5PxdYhi2OyAXcoGzggk1K0FQ+ZDIcKusf5lTrxjUk2MqOGMhtWfwMHPKuAPIUII
         tu27Vdu5ZQ6CjqDeHCLJAkYYLzzH6Z8Ey7T/7+VilQ2X+1fD2qDxZ1WCBX1quePQ4d+s
         dpHe3HSf0z23WmPpndVfzJIMRYJLwIYyObUwt9OyywqotBDLIfvv/G35zmuKbHhwWDJw
         4usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KjpMz5e0xk1XuuVnLjGpWkMkjC9bx+K3CftG+x8OSyc=;
        b=SgVCSJ6033WxtFDHnrTxDfkztKMaVKC2LOeh4Oa0NPb4vSH6vjEpxlYq334nkd4azA
         1iR4rDq5PMBxiyTyAM8OhtmB0U7+Bah+0UZBI5qqOVIa2FVix60G4UCmQS3kGcq+NzfG
         LdBCHL+GXHLc37+AGpeu1XVZFojmYx7zED02lg9V/DD7WL3PgbWlAq5pzcnxLx2HXWJL
         U2h5f8iQ/qmqk4XOjDVaOuUKbYuxhDhM5p0VeZu47FjlAadOsegAzhdNnPJmN/SyBV9C
         ExXMfuA13IQb3oxdbZokkZgUMBPz440fO0ZUMzPB3sCq9cRfRgsqPUSemlaDIKqPySNf
         0zUA==
X-Gm-Message-State: APjAAAVkbFZop7eu/0EDc8+62ELS2TlNfEYViGytmyKLhD32D+jd6ujq
        VN+wRH0YOFcFJiQtSoXpjI02oiVj
X-Google-Smtp-Source: APXvYqyDa2wBnlTbvLS8pHkSzfhzQZObEUMgal0brGqCQj2GQAVuZRLephYW7bF6dqXO3C1MzoEYtQ==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr8364131wmb.47.1554486059064;
        Fri, 05 Apr 2019 10:40:59 -0700 (PDT)
Received: from ?IPv6:2003:ea:8be1:dd00:c5f4:1013:b1cb:d123? (p200300EA8BE1DD00C5F41013B1CBD123.dip0.t-ipconnect.de. [2003:ea:8be1:dd00:c5f4:1013:b1cb:d123])
        by smtp.googlemail.com with ESMTPSA id y197sm4330724wmd.34.2019.04.05.10.40.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 10:40:58 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: fix autoneg mismatch case in
 genphy_read_status
To:     Simon Horman <horms@verge.net.au>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
 <20190405161628.67z7acycfu7beqln@verge.net.au>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <c5421a7b-dcb5-cfb1-1123-90a785a951e6@gmail.com>
Date:   Fri, 5 Apr 2019 19:40:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190405161628.67z7acycfu7beqln@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05.04.2019 18:16, Simon Horman wrote:
> On Tue, Apr 02, 2019 at 08:43:30PM +0200, Heiner Kallweit wrote:
>> The original patch didn't consider the case that autoneg process
>> finishes successfully but both link partners have no mode in common.
>> In this case there's no link, nevertheless we may be interested in
>> what the link partner advertised.
>>
>> Like phydev->link we set phydev->autoneg_complete in
>> genphy_update_link() and use the stored value in genphy_read_status().
>> This way we don't have to read register BMSR again.
>>
>> Fixes: b6163f194c69 ("net: phy: improve genphy_read_status")
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Hi,
> 
> I have observed a regression with this patch as present as
> 4950c2ba49cc ("net: phy: fix autoneg mismatch case in genphy_read_status")
> in net-next.
> 
> The platform is the Renesas R-Car E3 (r8a77990) based Ebisu-4D board.
> 
> 
> Without this patch (commit before 4950c2ba49cc) the link is negotiated
> as follows:
> 
> [    3.257699] libphy: ravb_mii: probed
> [    3.266498] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> [    3.537082] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> [    9.667161] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> 
> # ethtool --version
> ethtool version 3.16
> # ethtool eth0
> Settings for eth0:
>         Supported ports: [ TP MII ]
>         Supported link modes:   100baseT/Full 
>                                 1000baseT/Full 
>         Supported pause frame use: No
>         Supports auto-negotiation: Yes
>         Advertised link modes:  100baseT/Full 
>                                 1000baseT/Full 
>         Advertised pause frame use: No
>         Advertised auto-negotiation: Yes
>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>                                              100baseT/Half 100baseT/Full 
>                                              1000baseT/Full 
>         Link partner advertised pause frame use: No
>         Link partner advertised auto-negotiation: Yes
>         Speed: 1000Mb/s
>         Duplex: Full
>         Port: MII
>         PHYAD: 0
>         Transceiver: external
>         Auto-negotiation: on
>         Supports Wake-on: g
>         Wake-on: d
>         Current message level: 0x000000cc (204)
>                                link timer rx_err tx_err
>         Link detected: yes
> 
> 
> With this patch the link is negotiated as follows, note the "Unknown":
> 
> [    3.268609] libphy: ravb_mii: probed
> [    3.277402] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> [    3.565057] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> [    9.804423] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
> 
Looks like the PHY doesn't set the "aneg complete" bit. But then, how
can the link be up? Could you please add a debug output in
genphy_update_link() printing the value of register BMSR?
I wonder whether your case may be caused by a chip erratum. Item 5 in
the errata documentation
(http://ww1.microchip.com/downloads/en/DeviceDoc/80000692D.pdf)
may be a candidate. Could you please check (as explained in the
errata document) and report the exact PHY version?

Could you please also test with another link partner?

> And ethtool reports:
> 
> # ethtool eth0
> Settings for eth0:
>         Supported ports: [ TP MII ]
>         Supported link modes:   100baseT/Full 
>                                 1000baseT/Full 
>         Supported pause frame use: No
>         Supports auto-negotiation: Yes
>         Advertised link modes:  100baseT/Full 
>                                 1000baseT/Full 
>         Advertised pause frame use: No
>         Advertised auto-negotiation: Yes
>         Speed: Unknown!
>         Duplex: Unknown! (255)
>         Port: MII
>         PHYAD: 0
>         Transceiver: external
>         Auto-negotiation: on
>         Supports Wake-on: g
>         Wake-on: d
>         Current message level: 0x000000cc (204)
>                                link timer rx_err tx_err
>         Link detected: yes
> 
> 
> 
> I noticed this when preparing a patch limit the maximum speed the device to
> 100Mbit/s as follows:
> 
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -272,6 +272,7 @@
>                 interrupt-parent = <&gpio2>;
>                 interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +               max-speed = <100>;
>         };
>  };
>  
> While the 100Mbit/s limit applied on top of the commit before 4950c2ba49cc
> things work as expected:
> 
> [    3.258347] libphy: ravb_mii: probed
> [    3.266739] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> [    3.553642] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> [    5.585027] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
> 
> # ethtool eth0
> Settings for eth0:
>         Supported ports: [ TP MII ]
>         Supported link modes:   100baseT/Full 
>         Supported pause frame use: No
>         Supports auto-negotiation: Yes
>         Advertised link modes:  100baseT/Full 
>         Advertised pause frame use: No
>         Advertised auto-negotiation: Yes
>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>                                              100baseT/Half 100baseT/Full 
I wondered why the link partner suddenly doesn't report 1Gbps support.
Seems to be a small flaw in phylib, if locally 1Gbps isn't supported
(or support is disabled) then we don't check for the link partners
1Gbps capability.

>         Link partner advertised pause frame use: No
>         Link partner advertised auto-negotiation: Yes
>         Speed: 100Mb/s
>         Duplex: Full
>         Port: MII
>         PHYAD: 0
>         Transceiver: external
>         Auto-negotiation: on
>         Supports Wake-on: g
>         Wake-on: d
>         Current message level: 0x000000cc (204)
>                                link timer rx_err tx_err
>         Link detected: yes
> 
> 
> However, with the 100Mbit/s limit applied on top of 4950c2ba49cc the boot hangs
> while (or just after?) negotiating the link:
> 
> [    3.541549] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> [    5.536389] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
> 
> 

