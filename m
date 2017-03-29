Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1490816334-14568-1-git-send-email-geert+renesas@glider.be>
References: <1490816334-14568-1-git-send-email-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Mar 2017 21:48:48 +0200
Message-ID: <CAK8P3a168j6BYzWkDzHDp0tBwiOj=JP-G2LXUiLiDFphbV5vdg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] base: soc: soc_device_match() improvements
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 9:38 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>         Hi Arnd, Greg, Kevin, Magnus, Olof, Simon,
>
> This patch series contains two improvements for the SoC bus and
> soc_device_match().  The second one is a dependency for handling
> different SoC revisions in the Renesas R-Car SYSC driver, which manages
> PM Domains and thus needs to be initialized from an early_initcall[*].
>
> Changes compared to v1:
>   - Drop RFC state,
>   - Add more explanation,
>   - Add Acked-by.
>
> Due to the dependency, and as changes for the Renesas R-Car SYSC driver
> typically go in through the renesas and arm-soc trees, and if you agree,
> I would like to send a pull request for these changes, to be pulled by
> all of the driver core, renesas, and arm-soc trees.  This is similar to
> how soc_device_match() was integrated earlier.
> Then the Renesas R-Car SYSC driver changes can easily be queued on top
> in the renesas tree afterwards.
>
> Do you agree?
> Thanks for your answer!

Merging this through arm-soc is fine with me.

> P.S. If you think it's already too late in the cycle to queue Renesas
> R-Car SYSC driver changes for v4.12 on top, please say so.  Then the
> dependency is relaxed, and this series can just go in through the
> driver core tree, with the Renesas part to follow for v4.13.

We can take it for 4.12.

      Arnd
