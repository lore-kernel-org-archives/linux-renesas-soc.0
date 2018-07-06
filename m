Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52301 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933929AbeGFUaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 16:30:46 -0400
Received: by mail-wm0-f65.google.com with SMTP id w16-v6so15847005wmc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 13:30:46 -0700 (PDT)
Subject: Re: [PATCH v2 11/14] ravb: remove custom .nway_reset from ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081612.7628-2-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5e62edbf-b951-ed6e-1207-acbaa9a279f7@cogentembedded.com>
Date: Fri, 6 Jul 2018 23:30:42 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081612.7628-2-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:16 AM, Vladimir Zapolskiy wrote:

> The generic phy_ethtool_nway_reset() function from phylib can be used
> instead of in-house ravb_nway_reset().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
