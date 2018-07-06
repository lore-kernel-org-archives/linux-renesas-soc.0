Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f49.google.com ([209.85.221.49]:42382 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932328AbeGFUba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 16:31:30 -0400
Received: by mail-wr1-f49.google.com with SMTP id p1-v6so5267948wrs.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 13:31:29 -0700 (PDT)
Subject: Re: [PATCH v2 12/14] ravb: remove useless serialization in
 ravb_get_link_ksettings()
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081612.7628-3-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5ab7da72-e1c6-a567-c92f-24d9fb133299@cogentembedded.com>
Date: Fri, 6 Jul 2018 23:31:26 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081612.7628-3-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:16 AM, Vladimir Zapolskiy wrote:

> phy_ethtool_ksettings_get() call does not modify device state or device
> driver state, hence there is no need to utilize a driver specific
> spinlock.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
