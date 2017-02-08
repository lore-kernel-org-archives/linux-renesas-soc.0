Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36531 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751569AbdBHSrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 13:47:12 -0500
Received: by mail-io0-f196.google.com with SMTP id q20so16704318ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Feb 2017 10:47:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170208183937.GX27312@n2100.armlinux.org.uk>
References: <20170208172209.31673-1-chris.brandt@renesas.com>
 <20170208174437.GW27312@n2100.armlinux.org.uk> <CAMuHMdVWT4KNqWNbTa1YBAt83+XOtn0qRFMAui8FDnHz-iYj0g@mail.gmail.com>
 <20170208183937.GX27312@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2017 19:46:55 +0100
Message-ID: <CAMuHMdX=EZdPk+b3Vs21bSPq-wP10W=1WOag5FgBjVfvRzrDhQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: xip: disable PATCH_PHYS_VIRT for ARCH_MULTIPLATFORM
 when XIP
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

On Wed, Feb 8, 2017 at 7:39 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 08, 2017 at 06:53:14PM +0100, Geert Uytterhoeven wrote:
>> The problem is that "multiplatform" may mean one of two things:
>>   1. Build a single kernel that can run on multiple platforms.
>>      This is tricky when enabling XIP and/or NOMMU, as the physical parameters
>>      must be compatible with all platforms. But building a kernel with the
>>      right parameters is the responsibility of the user.
>>      I.e. don't shoot yourself in the foot.
>>   2. Your platform uses the arch/arm multiplatform framework.
>>
>> As everything is being migrated to 2, not allowing XIP and/or NOMMU on
>> "multiplatform" is IMHO an insane limitation.
>
> There _isn't_ a framework.  What there is are a collection of Kconfig
> options that multiplatform provides you that can also be selected by
> any other configuration route.
>
> (2) really doesn't apply.
>
> The real issue is that board stuff ends up with a "depends on MULTI_xxx"
> which needs to be bypassed.  That's pretty easy to do - I've done it as
> a proof of concept a few years ago when this exact same thing came up
> for !MMU, and since then I've been NAKing and refusing to apply patches
> that try to re-use multiplat for !MMU.

So you mean this:

--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -31,7 +31,7 @@ config ARCH_RMOBILE

 menuconfig ARCH_RENESAS
        bool "Renesas ARM SoCs"
-       depends on ARCH_MULTI_V7 && MMU
+       depends on MMU
        select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
        select ARCH_SHMOBILE
        select ARCH_SHMOBILE_MULTI

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
