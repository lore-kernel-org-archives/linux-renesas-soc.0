Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35532 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbcDZJU0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 05:20:26 -0400
Received: by mail-oi0-f51.google.com with SMTP id x19so8634463oix.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2016 02:20:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <571DE43D.3020308@jinso.co.jp>
References: <56FE29DC.4060605@jinso.co.jp>
	<571DE43D.3020308@jinso.co.jp>
Date: Tue, 26 Apr 2016 11:20:25 +0200
Message-ID: <CACRpkdYMD-XZ3w9n=EaSK12xXhiTvStS61a86RYezew_-HYUvA@mail.gmail.com>
Subject: Re: [Bug]:LAGER: GPIO-KEYS: Warning occurs after unbinding the e6051000.gpio
From: Linus Walleij <linus.walleij@linaro.org>
To: Cao Minh Hiep <cm-hiep@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>,
	LE MINH DUC <lm-duc@jinso.co.jp>,
	=?UTF-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>,
	"M.Miura" <m-miura@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 25, 2016 at 11:32 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp> wrote:

> Hello Linus Walleij-san
>
> We have tested Linux upstream v4.6-rc2 on Renesas's Lager board.
> When we tried to unbind the e6051000.gpio, the following warning messages
> occurs:
>
> "root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar# echo e6051000.gpio >
> unbind
> [  241.511034] ------------[ cut here ]------------
> [  241.525054] WARNING: CPU: 0 PID: 2104 at fs/proc/generic.c:575
> remove_proc_entry+0x13c/0x160
> [  241.550456] remove_proc_entry: removing non-empty directory 'irq/169',
> leaking at least '6-0039'

Do you mean that you set up a handler in userspace, using the
deprecated sysfs ABI and then unbind the module providing the
IRQ resource?

> And we found a patch between v4.5 and v4.6-rc2 that causing of this issue.
> The patch is "ff2b1359 gpio: make the gpiochip a real device"

It seems the issue is not a bug in the kernel, the issue is that the
kernel is warning you about something that was wrong also before
but you didn't get a warning for it until now.

It is not OK to unbind a driver providing IRQs.

It is even unclear if we should even allow modules to provide
IRQs because there is no way to handle irqchips going away
when it has consumers.

Maybe we should just do this?

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3fe8e773d95c..ae5e81358ec5 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -562,6 +562,7 @@ static struct platform_driver gpio_rcar_device_driver = {
        .driver         = {
                .name   = "gpio_rcar",
                .of_match_table = of_match_ptr(gpio_rcar_of_table),
+               .suppress_bind_attrs = true,
        }
 };


Yours,
Linus Walleij
