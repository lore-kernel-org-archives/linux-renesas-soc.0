Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0dn8xA+QBaqPo=0_NuE6pjkyRhDKdSzy-DZGPFmE9A2Q@mail.gmail.com>
References: <1489083513-19245-1-git-send-email-geert+renesas@glider.be>
 <1489083513-19245-3-git-send-email-geert+renesas@glider.be>
 <CAK8P3a1-AFksTJNey3OCuiLuo+Jq22jPBJ1_6pVnA4bNLfAFeA@mail.gmail.com>
 <CAMuHMdXhF1+x-Ltiq_5jtEbON=+XmuV7KkkL13qDSGpb4bv9XQ@mail.gmail.com>
 <CAK8P3a38KKHF5c2gy7b6uLJv08HqoDViAF-VVTThmNgAdJaU2Q@mail.gmail.com>
 <CAMuHMdWBiSYnZt1xTcBbr31VxvkMvUh7D2kRRYYpkeFxoROOHQ@mail.gmail.com> <CAK8P3a0dn8xA+QBaqPo=0_NuE6pjkyRhDKdSzy-DZGPFmE9A2Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2017 14:42:22 +0100
Message-ID: <CAMuHMdVTSWM2cx114w93GV5AUjRtnmNA893S_JMke89Oh5VDxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] base: soc: Allow early registration of a single
 SoC device
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Mon, Mar 13, 2017 at 2:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 13, 2017 at 2:13 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Mon, Mar 13, 2017 at 2:06 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Mon, Mar 13, 2017 at 1:46 PM, Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Mon, Mar 13, 2017 at 1:41 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>> On Thu, Mar 9, 2017 at 7:18 PM, Geert Uytterhoeven
>>>>> I'd prefer to not have to do the early registration at all and have fewer
>>>>> special cases. Can you list a specific example that requires this?
>>>>
>>>> The specific example is the Renesas R-Car SYSC driver, which manages PM
>>>> Domains and thus needs to be initialized from an early_initcall.
>>>
>>> Ok, and what prevents us from using information in DT to detect which
>>> variant we have? Is this a case of absolutely having to know the exact
>>> hardware revision at the time of initialization, or is it just to simplify the
>>> implementation of the SYSC driver?
>>
>> The former.
>> Preproduction versions of R-Car H3 have an additional power area, which no
>> longer exists on H3 ES2.0.
>
> Ok. I'm still not happy about adding the workaround, but this seems like
> a reasonable requirement, assuming that the preproduction versions of R-Car H3
> are important enough to you that supporting them in mainline helps you
> get your work done better.

That's indeed our motivation.  Currently we all have preproduction SoCs, with
limited (remote) access to R-Car H3 ES2.0.

The goal is to:
  1. Support both the ES1.x and ES2.0 SoC revisions in a single binary
     for now,
  2. Make it clear which code supports ES1.x, so it can easily be identified
     and removed later, when production SoCs are deemed ubiquitous.

> Please add the explanation to the changelog, along with my
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Will do, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
