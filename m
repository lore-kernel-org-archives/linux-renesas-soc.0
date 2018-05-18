Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:37118 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751452AbeERK4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 06:56:20 -0400
Received: by mail-lf0-f66.google.com with SMTP id r2-v6so13322909lff.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 03:56:19 -0700 (PDT)
Subject: Re: [PATCH v2] sh_eth: Change platform check to CONFIG_ARCH_RENESAS
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1526640771-473-1-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7ca9e327-736d-4372-10a0-b90dbafb797b@cogentembedded.com>
Date: Fri, 18 May 2018 13:56:16 +0300
MIME-Version: 1.0
In-Reply-To: <1526640771-473-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/18/2018 01:52 PM, Geert Uytterhoeven wrote:

> Since commit 9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS")
> is CONFIG_ARCH_RENESAS a more appropriate platform check than the legacy

  "If" should follow, not precede the option as this is not a question. :-)

> CONFIG_ARCH_SHMOBILE, hence use the former.
> 
> Renesas SuperH SH-Mobile SoCs are still covered by the CONFIG_CPU_SH4
> check.
> 
> This will allow to drop ARCH_SHMOBILE on ARM and ARM64 in the near
> future.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
