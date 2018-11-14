Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35810 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbeKNWzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Nov 2018 17:55:46 -0500
MIME-Version: 1.0
References: <1541531949-23407-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541531949-23407-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 13:52:21 +0100
Message-ID: <CAMuHMdWdLQfmTjzag4Rp62MQw_n=zZx9W7LZP4p3FgHV=_seQQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: Request GPIO while enabling interrupt
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Tue, Nov 6, 2018 at 8:19 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> There are cases when the bootloader configures a pin to work
> as a function rather than GPIO, and other cases when the pin
> is configured as a function at POR.
> This commit makes sure the pin is configured as a GPIO the
> moment we need it to work as an interrupt.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> v1->v2:
> * Moved gpio_rcar_request call from gpio_rcar_irq_set_type to
>   rcar_gpio_irq_request_resources
> * Added rcar_gpio_irq_release_resources for calling gpio_rcar_free

Thanks for your patch!

While I could see no obvious deficiencies at first glance, I gave your
patch a try on Koelsch and Salvator-XS.

Koelsch:

  - ADV7511 HDMI encoder WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)
    in gpiochip_enable_irq():

    WARNING: CPU: 0 PID: 1 at drivers/gpio/gpiolib.c:3513
gpiochip_irq_enable+0x18/0x34
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.20.0-rc2-koelsch-00873-gf433e294a90792da-dirty #179
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    [<c020f19c>] (unwind_backtrace) from [<c020aecc>] (show_stack+0x10/0x14)
    [<c020aecc>] (show_stack) from [<c07b02f8>] (dump_stack+0x7c/0x9c)
    [<c07b02f8>] (dump_stack) from [<c0220610>] (__warn+0xd0/0xec)
    [<c0220610>] (__warn) from [<c022073c>] (warn_slowpath_null+0x38/0x44)
    [<c022073c>] (warn_slowpath_null) from [<c046a084>]
(gpiochip_irq_enable+0x18/0x34)
    [<c046a084>] (gpiochip_irq_enable) from [<c026cbb0>] (irq_enable+0x3c/0x50)
    [<c026cbb0>] (irq_enable) from [<c026cc58>] (__irq_startup+0x94/0xa4)
    [<c026cc58>] (__irq_startup) from [<c026ccb4>] (irq_startup+0x4c/0x11c)
    [<c026ccb4>] (irq_startup) from [<c026b4c4>] (__setup_irq+0x4d0/0x6a4)
    [<c026b4c4>] (__setup_irq) from [<c026b7ac>]
(request_threaded_irq+0x9c/0x134)
    [<c026b7ac>] (request_threaded_irq) from [<c026dac4>]
(devm_request_threaded_irq+0x68/0xa4)
    [<c026dac4>] (devm_request_threaded_irq) from [<c0518ed8>]
(adv7511_probe+0x748/0x860)
    [<c0518ed8>] (adv7511_probe) from [<c05ef02c>]
(i2c_device_probe+0x210/0x228)
    [<c05ef02c>] (i2c_device_probe) from [<c05229ac>] (really_probe+0x1f0/0x2c0)
    [<c05229ac>] (really_probe) from [<c0522d04>]
(driver_probe_device+0x140/0x15c)
    [<c0522d04>] (driver_probe_device) from [<c0520ed4>]
(bus_for_each_drv+0xa0/0xb4)
    [<c0520ed4>] (bus_for_each_drv) from [<c0522b2c>]
(__device_attach+0xb0/0x124)
    [<c0522b2c>] (__device_attach) from [<c0521c94>]
(bus_probe_device+0x28/0x80)
    [<c0521c94>] (bus_probe_device) from [<c051ff44>] (device_add+0x438/0x570)
    [<c051ff44>] (device_add) from [<c05ed978>] (i2c_new_device+0x238/0x278)
    [<c05ed978>] (i2c_new_device) from [<c05f08a8>]
(of_i2c_register_device+0x40/0x80)
    [<c05f08a8>] (of_i2c_register_device) from [<c05f0bac>]
(of_i2c_register_devices+0x80/0xc0)
    [<c05f0bac>] (of_i2c_register_devices) from [<c05ee6f4>]
(i2c_register_adapter+0x1ec/0x390)
    [<c05ee6f4>] (i2c_register_adapter) from [<c05f5650>]
(i2c_demux_activate_master+0xd4/0x158)
    [<c05f5650>] (i2c_demux_activate_master) from [<c05f59e0>]
(i2c_demux_pinctrl_probe+0x190/0x1f0)
    [<c05f59e0>] (i2c_demux_pinctrl_probe) from [<c052439c>]
(platform_drv_probe+0x48/0x94)
    [<c052439c>] (platform_drv_probe) from [<c05229ac>]
(really_probe+0x1f0/0x2c0)
    [<c05229ac>] (really_probe) from [<c0522d04>]
(driver_probe_device+0x140/0x15c)
    [<c0522d04>] (driver_probe_device) from [<c0522dac>]
(__driver_attach+0x8c/0xc8)
    [<c0522dac>] (__driver_attach) from [<c0520de4>]
(bus_for_each_dev+0x64/0xa0)
    [<c0520de4>] (bus_for_each_dev) from [<c0521f34>]
(bus_add_driver+0x16c/0x1d4)
    [<c0521f34>] (bus_add_driver) from [<c05236b8>] (driver_register+0xac/0xf0)
    [<c05236b8>] (driver_register) from [<c0202584>]
(do_one_initcall+0x70/0x170)
    [<c0202584>] (do_one_initcall) from [<c0c00ef8>]
(kernel_init_freeable+0x194/0x1d8)
    [<c0c00ef8>] (kernel_init_freeable) from [<c07c45e8>]
(kernel_init+0x8/0x110)
    [<c07c45e8>] (kernel_init) from [<c02010d8>] (ret_from_fork+0x14/0x3c)
    Exception stack(0xeb44dfb0 to 0xeb44dff8)
    dfa0:                                     00000000 00000000
00000000 00000000
    dfc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    dfe0: 00000000 00000000 00000000 00000000 00000013 00000000

  - SDHI CD pin failure (first channel shown only):

    sh-pfc e6060000.pin-controller: pin GP_6_6 already requested by
e6055400.gpio:812; cannot claim for e6055400.gpio:812
    sh-pfc e6060000.pin-controller: pin-198 (e6055400.gpio:812) status -22
    gpio_rcar e6055400.gpio: Can't request GPIO 6 from e6055400.gpio
    genirq: Failed to request resources for ee100000.sd cd (irq 186)
on irqchip e6055400.gpio

  - gpio-keys failure:

    sh-pfc e6060000.pin-controller: pin GP_5_0 already requested by
e6055000.gpio:838; cannot claim for e6055000.gpio:838
    sh-pfc e6060000.pin-controller: pin-160 (e6055000.gpio:838) status -22
    gpio_rcar e6055000.gpio: Can't request GPIO 0 from e6055000.gpio
    genirq: Failed to request resources for SW2-1 (irq 189) on irqchip
e6055000.gpio
    gpio-keys keyboard: Unable to claim irq 189; error -22
    gpio-keys: probe of keyboard failed with error -22

  - /sys/kernel/debug/pinctrl/e6060000.pin-controller-sh-pfc/pinmux-pins
changes:

    ADV7511 IRQ is now claimed as a GPIO, which was the intention of your
    patch:

        -pin 125 (GP_3_29): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 125 (GP_3_29): (MUX UNCLAIMED) e6053000.gpio:931

    With #define DEBUG in drivers/pinctrl/sh-pfc/core.c:

        sh-pfc e6060000.pin-controller: write_reg addr = e6060010,
value = 0x0, field = 2, r_width = 32, f_width = 1

    which means that GP_3_29 is switched to GPIO (GP3[29] = 0x0)
    (bit 29 = 31 - field 2), good!

    gpio-keys failures:

        -pin 160 (GP_5_0): (MUX UNCLAIMED) e6055000.gpio:838
        -pin 161 (GP_5_1): (MUX UNCLAIMED) e6055000.gpio:839
        -pin 162 (GP_5_2): (MUX UNCLAIMED) e6055000.gpio:840
        -pin 163 (GP_5_3): (MUX UNCLAIMED) e6055000.gpio:841
        +pin 160 (GP_5_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 161 (GP_5_1): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 162 (GP_5_2): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 163 (GP_5_3): (MUX UNCLAIMED) (GPIO UNCLAIMED)

        -pin 224 (GP_7_0): (MUX UNCLAIMED) e6055800.gpio:780
        -pin 225 (GP_7_1): (MUX UNCLAIMED) e6055800.gpio:781
        -pin 226 (GP_7_2): (MUX UNCLAIMED) e6055800.gpio:782
        -pin 227 (GP_7_3): (MUX UNCLAIMED) e6055800.gpio:783
        -pin 228 (GP_7_4): (MUX UNCLAIMED) e6055800.gpio:784
        -pin 229 (GP_7_5): (MUX UNCLAIMED) e6055800.gpio:785
        -pin 230 (GP_7_6): (MUX UNCLAIMED) e6055800.gpio:786
        +pin 224 (GP_7_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 225 (GP_7_1): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 226 (GP_7_2): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 227 (GP_7_3): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 228 (GP_7_4): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 229 (GP_7_5): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 230 (GP_7_6): (MUX UNCLAIMED) (GPIO UNCLAIMED)

    Note that the SDHI CD pins are still claimed as GPIOs, as the SDHI driver
    continued without a CD pin:

        pin 198 (GP_6_6): (MUX UNCLAIMED) e6055400.gpio:812


Salvator-XS:

  - Similar SDHI CD pin and gpio-keys failures

  - RAVB Ethernet WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)
    in gpiochip_enable_irq():

    WARNING: CPU: 2 PID: 1 at drivers/gpio/gpiolib.c:3513
gpiochip_enable_irq+0x20/0x58
    Modules linked in:
    CPU: 2 PID: 1 Comm: swapper/0 Not tainted
4.20.0-rc2-salvator-x-00873-gf433e294a90792da-dirty #238
    Hardware name: Renesas Salvator-X 2nd version board based on
r8a7795 ES2.0+ (DT)
    pstate: 40400085 (nZcv daIf +PAN -UAO)
    pc : gpiochip_enable_irq+0x20/0x58
    lr : gpiochip_enable_irq+0xc/0x58
    sp : ffffff800806b9b0
    x29: ffffff800806b9b0 x28: ffffff8008d37778
    x27: 0000000000000000 x26: 0000000000000000
    x25: ffffffc6f83ceca8 x24: ffffffc6f83cedd0
    x23: 0000000000000000 x22: 0000000000000001
    x21: 0000000000000000 x20: ffffffc6f83cec28
    x19: ffffffc6f83cec28 x18: 000000000000000a
    x17: 000000006602f828 x16: ffffff800806b7c8
    x15: 000000000001f40c x14: 0720072007200720
    x13: 0720072007200720 x12: 0720072007200720
    x11: 0720072007200720 x10: 07380720073d0720
    x9 : ffffff800900e6d0 x8 : 0000000000000000
    x7 : ffffff8008401cfc x6 : 0000000000000080
    x5 : 0000000000000000 x4 : ffffffc6f8ff4860
    x3 : ffffffc6f83cec28 x2 : 000000000000000f
    x1 : 0000000000000000 x0 : ffffffc6f9cd5d60
    Call trace:
     gpiochip_enable_irq+0x20/0x58
     gpiochip_irq_enable+0x1c/0x40
     irq_enable+0x48/0x5c
     __irq_startup+0x74/0x7c
     irq_startup+0x54/0x100
     __setup_irq+0x48c/0x640
     request_threaded_irq+0xb8/0x144
     phy_start_interrupts+0x38/0x78
     phy_connect_direct+0x48/0x5c
     of_phy_connect+0x4c/0x78
     ravb_open+0x38c/0x5f4
     __dev_open+0x110/0x120
     __dev_change_flags+0x118/0x1c0
     dev_change_flags+0x20/0x5c
     ip_auto_config+0x288/0xf2c
     do_one_initcall+0x158/0x310
     kernel_init_freeable+0x438/0x444
     kernel_init+0x10/0x100
     ret_from_fork+0x10/0x18
    irq event stamp: 540337
    hardirqs last  enabled at (540337): [<ffffff80082312f8>]
__kmalloc+0x2b0/0x2d0
    hardirqs last disabled at (540336): [<ffffff80082310f8>]
__kmalloc+0xb0/0x2d0
    softirqs last  enabled at (538968): [<ffffff8008081df0>]
__do_softirq+0x180/0x494
    softirqs last disabled at (538961): [<ffffff80080ed8cc>] irq_exit+0xa4/0x100

  - /sys/kernel/debug/pinctrl/e6060000.pin-controller-sh-pfc/pinmux-pins
changes:

    RAVB IRQ is now claimed as a GPIO, which was the intention of your
    patch:

        -pin 75 (GP_2_11): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 75 (GP_2_11): (MUX UNCLAIMED) e6052000.gpio:463

    With #define DEBUG in drivers/pinctrl/sh-pfc/core.c:

        sh-pfc e6060000.pin-controller: write_reg addr = e6060108,
value = 0x0, field = 20, r_width = 32, f_width = 1

    which means that GP_2_11 is switched to GPIO (GP3[11] = 0x0)
    (bit 11 = 31 - field 20), good!

    gpio-keys failures:

        -pin 177 (GP_5_17): (MUX UNCLAIMED) e6055000.gpio:409
        +pin 177 (GP_5_17): (MUX UNCLAIMED) (GPIO UNCLAIMED)

        -pin 180 (GP_5_20): (MUX UNCLAIMED) e6055000.gpio:412
        +pin 180 (GP_5_20): (MUX UNCLAIMED) (GPIO UNCLAIMED)

        -pin 182 (GP_5_22): (MUX UNCLAIMED) e6055000.gpio:414
        -pin 183 (GP_5_23): (MUX UNCLAIMED) e6055000.gpio:415
        +pin 182 (GP_5_22): (MUX UNCLAIMED) (GPIO UNCLAIMED)
        +pin 183 (GP_5_23): (MUX UNCLAIMED) (GPIO UNCLAIMED)

So it looks like calling gpio_rcar_request() is doing too much.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
