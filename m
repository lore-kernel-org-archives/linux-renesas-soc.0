Return-Path: <SRS0=SNny=SJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A6BC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  7 Apr 2019 15:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A0B420896
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  7 Apr 2019 15:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvnCF3kv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfDGPJg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 7 Apr 2019 11:09:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33933 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfDGPJg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Apr 2019 11:09:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id p10so13370569wrq.1;
        Sun, 07 Apr 2019 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NN1Ao7fa4Kud3dwsfy29zaeF6/R+9biep6bzWr7eFug=;
        b=UvnCF3kvLz4U97WePrBpOMXH/T+Bok020HPPmFnHz3//eErDqfb43tvFCBG8NR6qRZ
         E4UW7VJV//pDnwyjOwVzk5r1m8Ncnahfoljt4oFendNPdiWreDD05X+Qey+dyonm7oiu
         SeuoFAvGfCfZqCMFhsGaVmVBjMPhMHbDsTizc8O3/lLyuseIHGcSgH/btE/EGHjkfSCe
         aRXgLftzYl53TCkT3JEDqQlzRAQWxd8RV/sL7vxI8sxMXSw0zEYvvOsgSdIzIGhW7ify
         kL5DZP0+8mO3vpcI3vWneMIXGnQlTPCuhWpfiMFArM2b+H5T+fFxFh2wyCE7IMHB9onA
         7Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NN1Ao7fa4Kud3dwsfy29zaeF6/R+9biep6bzWr7eFug=;
        b=pIRf8/QNfu3k3ctfqrTqXodoQsFS10FiaRH/p7fTbPSutxM8iRqaHsTreBuOU38LKp
         EYQ7l9RoHt7cDagZEAI+47PgYDXODgSMeaKIkzSL91F3aBHhi9Pf/Spmwy1XBa9+QEJY
         z2TFbSLB9xH+VJvr35KWKjUe/6fIfa5oYbjf6s8GJXwQ8wfRJCBJXGIiux7d/Ya3qKL3
         nLvH9JCAgtl0Q05rL2mQXf5VMZbwNXlWEO5JoVGSBSqBwavHyfVULN3thpavMYACf9GL
         YTL4ZCQHjEs2CXq//FYeHEwDUeEqlGvNdWWR8QqHxQIUnt6StR+WXuN2nqFbY8L6E6bb
         BGUA==
X-Gm-Message-State: APjAAAUy60jI95Zb0BaTn+0BbrVfDKz+OHieOxwFrrvO5IBFbyMbve8G
        Y6+EOfyDhXwYGME8A5pAHI1l4ARW
X-Google-Smtp-Source: APXvYqwhiRuPITjr6W2e9QiJlrO87iwyVQOZM2+xYiKg5X442aVr4ma0lih15F2VarGHX9ShYWtZgQ==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr13759189wrn.44.1554649773338;
        Sun, 07 Apr 2019 08:09:33 -0700 (PDT)
Received: from ?IPv6:2003:ea:8be1:dd00:cd3d:7432:4830:ab0a? (p200300EA8BE1DD00CD3D74324830AB0A.dip0.t-ipconnect.de. [2003:ea:8be1:dd00:cd3d:7432:4830:ab0a])
        by smtp.googlemail.com with ESMTPSA id q4sm39444540wrx.25.2019.04.07.08.09.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Apr 2019 08:09:32 -0700 (PDT)
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
Message-ID: <b5c4f0da-f4ac-3a4b-923e-ebe021ed0550@gmail.com>
Date:   Sun, 7 Apr 2019 17:09:28 +0200
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

There's one path where phydev->autoneg_complete isn't set.
Could you please test whether the following fixes the issue?


diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a6f3ad971..2df8f7737 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1710,19 +1710,17 @@ int genphy_update_link(struct phy_device *phydev)
 	 */
 	if (!phy_polling_mode(phydev)) {
 		status = phy_read(phydev, MII_BMSR);
-		if (status < 0) {
+		if (status < 0)
 			return status;
-		} else if (status & BMSR_LSTATUS) {
-			phydev->link = 1;
-			return 0;
-		}
+		else if (status & BMSR_LSTATUS)
+			goto done;
 	}
 
 	/* Read link and autonegotiation status */
 	status = phy_read(phydev, MII_BMSR);
 	if (status < 0)
 		return status;
-
+done:
 	phydev->link = status & BMSR_LSTATUS ? 1 : 0;
 	phydev->autoneg_complete = status & BMSR_ANEGCOMPLETE ? 1 : 0;
 
-- 
2.21.0


