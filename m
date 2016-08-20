Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33763 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751003AbcHTTj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Aug 2016 15:39:57 -0400
Received: by mail-lf0-f46.google.com with SMTP id b199so53445741lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2016 12:39:56 -0700 (PDT)
Subject: Re: [PATCH 1/2] net: ethernet: renesas: ravb: use phydev from struct
 net_device
To: Philippe Reynes <tremyfr@gmail.com>, davem@davemloft.net,
        kazuya.mizuguchi.ks@renesas.com, ykaneko0929@gmail.com,
        horms+renesas@verge.net.au, masaru.nagai.vx@renesas.com,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se
References: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bdaaf314-82a3-97c4-49d0-b239e9959dda@cogentembedded.com>
Date: Sat, 20 Aug 2016 22:39:51 +0300
MIME-Version: 1.0
In-Reply-To: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 08/20/2016 01:52 AM, Philippe Reynes wrote:

> The private structure contain a pointer to phydev, but the structure
> net_device already contain such pointer. So we can remove the pointer
> phy_dev in the private structure, and update the driver to use the
> one contained in struct net_device.
>
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
