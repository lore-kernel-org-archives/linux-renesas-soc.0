Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39191 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbeGQUDo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 16:03:44 -0400
Received: by mail-lf0-f67.google.com with SMTP id a134-v6so1679242lfe.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 12:29:39 -0700 (PDT)
Subject: Re: [PATCH] DT: irqchip: renesas-irqc: document R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-renesas-soc@vger.kernel.org
References: <71e2be51-5699-1b26-c2a1-fca7897817d1@cogentembedded.com>
Message-ID: <ffbc81bf-e668-cf82-6fd9-cf4083cf4c0f@cogentembedded.com>
Date: Tue, 17 Jul 2018 22:29:37 +0300
MIME-Version: 1.0
In-Reply-To: <71e2be51-5699-1b26-c2a1-fca7897817d1@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/17/2018 10:23 PM, Sergei Shtylyov wrote:

> Document R-Car V3H (AKA R8A77980) SoC bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt

   Oops, forgot to rebase to tip.git before posting... but the patch does apply
to its irq/core branch anyway! :-)

[...]

MBR, Sergei
