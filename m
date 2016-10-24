Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:33049 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934500AbcJXJBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 05:01:23 -0400
Received: by mail-yw0-f193.google.com with SMTP id w3so8093129ywg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2016 02:01:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <80506636-d4a1-9a1b-4169-d153326b54aa@arm.com>
References: <20160921143905.36197-1-kevin.brodsky@arm.com> <e57565e8-bec9-0460-32d5-fb9f868cc4f8@arm.com>
 <613e4387-0ed5-ad58-7b74-a31b648f81e7@arm.com> <2e2dedf4-192f-8657-10b1-24b426af5f00@arm.com>
 <CAMuHMdVgccJ0A2d_-uU+8r0h-NBeet3eGkKq14eaFo34ydqtzQ@mail.gmail.com> <80506636-d4a1-9a1b-4169-d153326b54aa@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2016 11:01:21 +0200
Message-ID: <CAMuHMdWqyskdsUw8pXdyt6HgoXOzPbDQc=3+vTAbxz4-zHpg4Q@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: psci: PSCI checker module
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-pm@lists.linux-foundation.org,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sudeep,

On Mon, Oct 24, 2016 at 10:57 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> On 24/10/16 09:09, Geert Uytterhoeven wrote:
>> On Thu, Oct 20, 2016 at 4:21 PM, Sudeep Holla <sudeep.holla@arm.com>
>> wrote:
>>> On 20/10/16 14:38, Kevin Brodsky wrote:
>>>
>>> [...]
>>>
>>>>
>>>> Thanks for the heads-up! I'll rebase on 4.9-rc1 and see what needs to be
>>>> done.
>>>>
>>>
>>> Just be aware that v4.9-rc1 doesn't have commit 9cfb38a7ba5a
>>> ("sched/fair: Fix sched domains NULL dereference in
>>> select_idle_sibling()") which fixes the cpuhotplug issue you would
>>> observe.
>>
>>
>> Good to know. I saw that issue during resume from s2ram on
>> r8a7795/Salvator-X
>> once, but couldn't reproduce it.
>>
>
> Did you try v4.9-rc1 itself ? The above commit is present post -rc1 and
> must be in -rc2. I can consistently see the crash without the commit.

I used a tree based on v4.9-rc1, not including commit 9cfb38a7ba5a.
Will try v4.9-rc2 shortly...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
