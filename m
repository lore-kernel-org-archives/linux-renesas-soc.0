Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1464770093-12667-1-git-send-email-daniel.lezcano@linaro.org>
References: <1464770093-12667-1-git-send-email-daniel.lezcano@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jun 2016 11:54:06 +0200
Message-ID: <CAMuHMdUi-LzYTnK4nmLip8a7WVPu7BjkeZ9588Uq=_O_i58yag@mail.gmail.com>
Subject: Re: [PATCH 0/9] clocksource/drivers/clksrc-of: Improve error handling
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Wed, Jun 1, 2016 at 10:34 AM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> The macro CLOCKSOURCE_OF_DECLARE is widely used in the timer drivers.
>
> Basically, this macro is defined to insert in a table a tuple name,function.
> This function is an init function called when the name matches the DT node and
> its signature is:
>
>         typedef void (*of_init_fn_1)(struct device_node *);
>
> It does not return an error code.
>
> That results in the clocksource-probe not being able to figure out if the driver
> was correctly initialized or not, the different drivers to act as they were the
> only ones on the system (panic, instead of failing gracefully), and duplicated
> code for error reporting.
>
> This series initiates the logic change and centralize the error handling in the
> clocksource probe code.
>
> In order to do the changes little by little, a new macro was introduced:
>
>  CLOCKSOURCE_OF_DECLARE_RET()

As I have no other thread to reply to, I'm using this related one.

commit bcbe219f9306da478b77e705a7273843c2660d7b
Author: Daniel Lezcano <daniel.lezcano@linaro.org>
Date:   Tue Jun 7 00:27:44 2016 +0200

    clocksources: Switch back to the clksrc table

    Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

in clockevents/clockevents/next breaks the boot on e.g. r8a7791/koelsch
(arm32) and r8a7795/salvator-x (arm64).

Using "earlycon keep_bootcon" on koelsch (this doesn't help on arm64)
reveals it's stuck at:

    clocksource_probe: no matching clocksources found
    sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
21474836475000000ns
    Calibrating delay loop...

With the above commit reverted, it works again:

    Architected cp15 timer(s) running at 10.00MHz (virt).
    clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles:
0x24e6a1710, max_idle_ns: 440795202120 ns
    sched_clock: 56 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
    Switching to timer-based delay loop, resolution 100ns
    Calibrating delay loop (skipped), value calculated using timer
frequency.. 20.00 BogoMIPS (lpj=100000)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
