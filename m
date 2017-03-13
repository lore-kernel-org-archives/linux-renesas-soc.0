Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35492 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdCMMl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 08:41:26 -0400
MIME-Version: 1.0
In-Reply-To: <1489083513-19245-3-git-send-email-geert+renesas@glider.be>
References: <1489083513-19245-1-git-send-email-geert+renesas@glider.be> <1489083513-19245-3-git-send-email-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Mar 2017 13:41:25 +0100
Message-ID: <CAK8P3a1-AFksTJNey3OCuiLuo+Jq22jPBJ1_6pVnA4bNLfAFeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] base: soc: Allow early registration of a single
 SoC device
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 9, 2017 at 7:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> commit 1da1b3628df34a2a ("base: soc: Early register bus when needed")
> added support for early registration of SoC devices from a
> core_initcall().  However, some drivers need to check the SoC revision
> from an early_initcall(), which is even earlier.
>
> While registering the SoC bus and device, and using soc_device_match(),
> from an early_initcall() do work, the "soc" directory and the "soc0"
> file end up wrongly in the sysfs root, as the "bus" resp. "devices"
> directories haven't been created yet.
>
> To fix this, allow to register a single SoC device early on.
> As long as the SoC bus isn't registered, soc_device_match() just
> matches against this early device.
> When the SoC bus is registered later, the early device is registered for
> real.
>
> Note that soc_device_register() returns NULL (no error, but also not a
> valid pointer) when registering an early device.  Hence platform devices
> cannot be instantiated as children of the "soc0" node representing an
> early SoC device.  This should not be an issue, as that practice has
> been deprecated for new platforms.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Is there a better way to fix this?
> While I believe all current users register a single SoC device, we may
> want to register multiple SoC devices in the future?
>
> soc_device_match() itself is completely independent from sysfs, but the
> sysfs operations are tied intimately to the driver core.
>
> The "bus" and "devices" directories are created from do_basic_setup() ->
> driver_init() -> devices_init() / buses_init(), which runs in between
> do_pre_smp_initcalls() (early_initcall()) and do_initcalls().

I'd prefer to not have to do the early registration at all and have fewer
special cases. Can you list a specific example that requires this?

If we want to do early registration, then your implementation seems
fine to me.

     Arnd
