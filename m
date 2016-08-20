Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36357 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbcHTTlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Aug 2016 15:41:24 -0400
Received: by mail-lf0-f52.google.com with SMTP id g62so53311776lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2016 12:41:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] net: ethernet: renesas: ravb: use new api
 ethtool_{get|set}_link_ksettings
To: Philippe Reynes <tremyfr@gmail.com>, davem@davemloft.net,
        kazuya.mizuguchi.ks@renesas.com, ykaneko0929@gmail.com,
        horms+renesas@verge.net.au, masaru.nagai.vx@renesas.com,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se
References: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
 <1471647139-1867-2-git-send-email-tremyfr@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f7ad11ff-179c-4d20-4115-1ce0522536dd@cogentembedded.com>
Date: Sat, 20 Aug 2016 22:41:20 +0300
MIME-Version: 1.0
In-Reply-To: <1471647139-1867-2-git-send-email-tremyfr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/20/2016 01:52 AM, Philippe Reynes wrote:

> The ethtool api {get|set}_settings is deprecated.
> We move this driver to new api {get|set}_link_ksettings.
>
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    Sorry for missing the sh_eth patchset. :-<

MBR, Sergei
