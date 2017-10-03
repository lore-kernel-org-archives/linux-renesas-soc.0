Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:43013 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752115AbdJCNPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 09:15:30 -0400
Received: by mail-io0-f169.google.com with SMTP id k101so7576888iod.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Oct 2017 06:15:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXnYysiDURyztXv3bhBMyk0o1EN=JzwqwvUifzw5fFYAw@mail.gmail.com>
References: <20170830025547.30347-1-nicolas.pitre@linaro.org>
 <20170830025547.30347-2-nicolas.pitre@linaro.org> <CAMuHMdXnYysiDURyztXv3bhBMyk0o1EN=JzwqwvUifzw5fFYAw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 3 Oct 2017 14:15:29 +0100
Message-ID: <CAKv+Gu8BSnn3XhUALM-CfPqw2zNxovvup4uHf1F4qYZZ5oVUaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: head-common.S: speed up startup code
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 3 October 2017 at 13:41, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Nicolas,
>
> On Wed, Aug 30, 2017 at 4:55 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>> Let's use optimized routines such as memcpy to copy .data and memzero
>> to clear .bss in the startup code instead of doing it one word at a
>> time. Those routines don't use any global data so they're safe to use
>> even if .data and .bss segments are not initialized.
>>
>> In the .data copy case a temporary stack is installed in the .bss area
>> as the actual kernel stack is located within the copied data area. The
>> XIP kernel linker script ensures a 8 byte alignment for that purpose.
>>
>> Finally, make the .data copy and related pointers surrounded by
>> CONFIG_XIP_KERNEL to make it obvious what it is all about. This will
>> allow for further cleanups in the non-XIP linker script.
>>
>> Signed-off-by: Nicolas Pitre <nico@linaro.org>
>> Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> This is now commit 9520b1a1b5f7a348 ("ARM: head-common.S: speed up startup
> code") in arm/for-next.
>
> If CONFIG_DEBUG_LOCK_ALLOC=y, the kernel log is spammed with a few hundred
> identical messages on various Renesas systems:
>
>     unwind: Unknown symbol address c0800300
>     unwind: Index not found c0800300
>
> I've bisected this to the aforementioned commit.
>
> c0800300 points to the instruction just after the __memzero call, cfr. below.
>
> Do you have a clue? Thanks!
>

Hallo Geert,

It looks like this patch results in start_kernel() being entered with
a different value for lr than before. Could you please try setting it
to zero instead, right before the jump to start_kernel() ?

I don't think the patch itself is to blame here, it simply triggers an
existing issue in the unwinder (if my analysis is correct, of course)

-- 
Ard.
