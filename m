Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33128 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752557AbcJGTAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 15:00:33 -0400
Received: by mail-lf0-f48.google.com with SMTP id x79so48233504lff.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Oct 2016 11:59:50 -0700 (PDT)
Subject: Re: [PATCH] [RFC] irqchip/renesas-irqc: Postpone driver
 initialization
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <1475861876-1187-1-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b8731cd1-26e4-8bab-6248-5230ea0d97ba@cogentembedded.com>
Date: Fri, 7 Oct 2016 21:59:47 +0300
MIME-Version: 1.0
In-Reply-To: <1475861876-1187-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/07/2016 08:37 PM, Geert Uytterhoeven wrote:

> Currently the renesas-irqc driver uses postcore_initcall().
>
> However, the new CPG/MSSR driver uses subsys_initcall(). Hence the
> IRQC's probe will be deferred, which causes the Micrel phy to not find
> its interrupt on R-Car Gen2, as the of_mdio subsystem doesn't support
> deferred probe yet.
>
> Replace postcore_initcall() by device_initcall() to work around this.
>
> This does cause a few extra probe deferrals on R-Mobile APE6, where the
> PFC/GPIO combo uses the IRQC as its parent interrupt controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Sergei: Does this fix the regression with the sh_eth driver?

    Yes, it does! Thank you! :-)

Tested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
