Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36153 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752682AbdBHRxp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 12:53:45 -0500
Received: by mail-io0-f193.google.com with SMTP id q20so16554907ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Feb 2017 09:53:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170208174437.GW27312@n2100.armlinux.org.uk>
References: <20170208172209.31673-1-chris.brandt@renesas.com> <20170208174437.GW27312@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2017 18:53:14 +0100
Message-ID: <CAMuHMdVWT4KNqWNbTa1YBAt83+XOtn0qRFMAui8FDnHz-iYj0g@mail.gmail.com>
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

On Wed, Feb 8, 2017 at 6:44 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 08, 2017 at 12:22:09PM -0500, Chris Brandt wrote:
>> Since ARCH_MULTIPLATFORM explicitly selects ARM_PATCH_PHYS_VIRT, even
>> though ARCH_MULTIPLATFORM has 'depends on !XIP_KERNEL', ARM_PATCH_PHYS_VIRT
>> is still forcibly selected. The result is that PHYS_OFFSET depends on
>> !ARM_PATCH_PHYS_VIRT. This means you cannot enter a physical RAM address
>> for an XIP kernel and you cannot build.
>>
>> Given that it is already clear in the Kconfig that ARM_PATCH_PHYS_VIRT and
>> XIP_KERNEL do not go well together (read the help for ARM_PATCH_PHYS_VIRT),
>> adding this condition to ARCH_MULTIPLATFORM is logical and will fix this
>> build issue.
>
> And, ergo, multiplatform kernels and XIP_KERNEL don't go together either.
> Think about it...
>
> This is why I regard those who want multiplatform to work with options
> such as XIP_KERNEL and NOMMU to be insane.
>
> Please, can we stop trying to make multiplatform also cover the situations
> where only a single class of platforms works (iow, the old way we used to
> deal with platforms is the most sensible solution.)
>
> IMHO multiplatform was done right for multiplatform but at the expense of
> totally breaking stuff like XIP and noMMU.  We need to stop trying to
> bend multiplatform to cover XIP and noMMU, but instead restore the old
> way of handling this _along_ with multiplatform as an additional option.

The problem is that "multiplatform" may mean one of two things:
  1. Build a single kernel that can run on multiple platforms.
     This is tricky when enabling XIP and/or NOMMU, as the physical parameters
     must be compatible with all platforms. But building a kernel with the
     right parameters is the responsibility of the user.
     I.e. don't shoot yourself in the foot.
  2. Your platform uses the arch/arm multiplatform framework.

As everything is being migrated to 2, not allowing XIP and/or NOMMU on
"multiplatform" is IMHO an insane limitation.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
