Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:36145 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754920AbdERQcF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 12:32:05 -0400
Received: by mail-wm0-f41.google.com with SMTP id 70so52862787wmq.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 09:32:04 -0700 (PDT)
Subject: Re: [PATCH 1/2] sh_eth: Use platform device for printing before
 register_netdev()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>
References: <1495112495-25086-1-git-send-email-geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bc664329-3010-32d2-fa39-2557dbf6da8c@cogentembedded.com>
Date: Thu, 18 May 2017 19:32:01 +0300
MIME-Version: 1.0
In-Reply-To: <1495112495-25086-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/18/2017 04:01 PM, Geert Uytterhoeven wrote:

> The MDIO initialization failure message is printed using the network
> device, before it has been registered, leading to:
>
>      (null): failed to initialise MDIO
>
> Use the platform device instead to fix this:
>
>     sh-eth ee700000.ethernet: failed to initialise MDIO
>
> Fixes: daacf03f0bbfefee ("sh_eth: Register MDIO bus before registering the network device")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
