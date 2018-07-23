Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45153 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388443AbeGWRYn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 13:24:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id q5-v6so1043643ljh.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 09:22:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVbyUa5PtQf4LZQDv-=aqToahX5Eb4TEDvsJniYm-trNQ@mail.gmail.com>
References: <cover.1532086504.git.horms+renesas@verge.net.au>
 <20180721220343.yuwrfxz3fo25krzv@localhost> <CAMuHMdVbyUa5PtQf4LZQDv-=aqToahX5Eb4TEDvsJniYm-trNQ@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 23 Jul 2018 09:22:42 -0700
Message-ID: <CAOesGMh09Do+Yv-C+4hE0KdShajr0hVRfLEPmeoH0AmM5kVAmw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.19
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        ARM-SoC Maintainers <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 2:11 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Olof,
>
> On Sun, Jul 22, 2018 at 12:27 AM Olof Johansson <olof@lixom.net> wrote:
>> On Fri, Jul 20, 2018 at 02:03:54PM +0200, Simon Horman wrote:
>> > Please consider these Renesas ARM based SoC defconfig updates for v4.19.
>
>> > * Set CONFIG_LOCALVERSION to shmobile_defconfig
>> >
>> >   This follows what appears to be common practice in defconfigs
>> >   and allows easier management of the kernel flavour at run-time.
>>
>> I replied to the multi-versions of defconfig for this patch -- it's not a good
>> way to solve the problem of detecting config at runtime. Please drop this
>> patch. See:
>>
>> https://lore.kernel.org/lkml/CAOesGMgkU6yBRpAsED2fPyuAo9Tc=YprndGdkmBVrc+0783VwQ@mail.gmail.com/
>
> One more comment to the rescue: it does complicate regression testing,
> as the test software running on the DUT has no easy way to distinguish
> between e.g. shmobile_defconfig and multi_v7_defconfig (and whatever
> other board-specific configs I use for testing).
> Yes, I can have these as local patches in my tree (of course I already have ;-),
> but when bisecting, I have to remember to (un)apply them in every step.

Hi,

It looks like scripts/setlocalversion will look for files named
localversion* in the directory you build in, git won't touch the file
so you don't have to re-apply it every time.

I do see the usefulness for bisect and so on, but there's such a high
chance that people will start changing configs without changing
localversion that the value of it will diminish immediately for
downstream trees. Also, the "local" in localversion sort of indicates
that it shouldn't be set in a central place. :)


-Olof
