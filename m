Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33683 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163064AbdDWSQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 14:16:41 -0400
Received: by mail-lf0-f46.google.com with SMTP id 88so64032410lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Apr 2017 11:16:41 -0700 (PDT)
Subject: Re: [PATCH net] ravb: Double free on error in ravb_start_xmit()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20170422104656.jjnooh3or4x3lbw3@mwanda>
Cc: "David S. Miller" <davem@davemloft.net>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Masaru Nagai <masaru.nagai.vx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Philippe Reynes <tremyfr@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7e22f555-eac0-d0cb-85a2-6f2337d32bcb@cogentembedded.com>
Date: Sun, 23 Apr 2017 21:16:37 +0300
MIME-Version: 1.0
In-Reply-To: <20170422104656.jjnooh3or4x3lbw3@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/22/2017 01:46 PM, Dan Carpenter wrote:

> If skb_put_padto() fails then it frees the skb.  I shifted that code
> up a bit to make my error handling a little simpler.
>
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
