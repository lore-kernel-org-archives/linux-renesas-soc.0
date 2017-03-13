Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1489083513-19245-2-git-send-email-geert+renesas@glider.be>
References: <1489083513-19245-1-git-send-email-geert+renesas@glider.be> <1489083513-19245-2-git-send-email-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Mar 2017 13:39:00 +0100
Message-ID: <CAK8P3a1Zuo-bgOuUyFjj_HscaMfwoAoGM2-W2EZ1a55ySE3wvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] base: soc: Let soc_device_match() return no
 match when called too early
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 9, 2017 at 7:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> If soc_device_match() is called before the SoC bus has been registered,
> bus_for_each_dev() returns -EINVAL, which is considered a match, as it
> is non-zero.
>
> While calling soc_device_match() can be considered an integration
> mistake, returning a match is counter-intuitive: soc_device_match() is
> typically used to handle quirks, i.e. to deviate from the default path.
> Hence add a check to abort checking and return no match instead.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

> Should this use WARN_ONCE()?

I wouldn't mind that either, but your current version seems sufficient.
