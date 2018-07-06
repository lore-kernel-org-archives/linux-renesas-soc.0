Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52298 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934536AbeGFTIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:08:19 -0400
Received: by mail-wm0-f66.google.com with SMTP id w16-v6so15704547wmc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:08:18 -0700 (PDT)
Subject: Re: [PATCH v2 06/14] sh_eth: remove custom .get_link_ksettings from
 ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-2-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fa4c9d5e-2956-3ebe-1977-33586c2b8c28@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:08:15 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-2-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:14 AM, Vladimir Zapolskiy wrote:

> The generic phy_ethtool_get_link_ksettings() function from phylib can be
> used instead of in-house sh_eth_get_link_ksettings().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
