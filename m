Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37922 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933001AbeGFTGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:06:47 -0400
Received: by mail-wm0-f66.google.com with SMTP id 69-v6so15263060wmf.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:06:47 -0700 (PDT)
Subject: Re: [PATCH v2 05/14] sh_eth: remove useless serialization in
 sh_eth_get_link_ksettings()
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-1-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <44976f40-3004-e532-1980-78d473088f18@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:06:44 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-1-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:14 AM, Vladimir Zapolskiy wrote:

> phy_ethtool_ksettings_get() call does not modify device state or device
> driver state, hence there is no need to utilize a driver specific
> spinlock.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
