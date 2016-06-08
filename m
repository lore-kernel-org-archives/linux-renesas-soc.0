Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 0/9] clocksource/drivers/clksrc-of: Improve error handling
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1464770093-12667-1-git-send-email-daniel.lezcano@linaro.org>
 <CAMuHMdUi-LzYTnK4nmLip8a7WVPu7BjkeZ9588Uq=_O_i58yag@mail.gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <57582755.3080102@linaro.org>
Date: Wed, 8 Jun 2016 16:10:29 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi-LzYTnK4nmLip8a7WVPu7BjkeZ9588Uq=_O_i58yag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/07/2016 11:54 AM, Geert Uytterhoeven wrote:

[ ... ]

> in clockevents/clockevents/next breaks the boot on e.g. r8a7791/koelsch
> (arm32) and r8a7795/salvator-x (arm64).
>
> Using "earlycon keep_bootcon" on koelsch (this doesn't help on arm64)
> reveals it's stuck at:
>
>      clocksource_probe: no matching clocksources found
>      sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
> 21474836475000000ns
>      Calibrating delay loop...
>
> With the above commit reverted, it works again:
>
>      Architected cp15 timer(s) running at 10.00MHz (virt).
>      clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles:
> 0x24e6a1710, max_idle_ns: 440795202120 ns
>      sched_clock: 56 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
>      Switching to timer-based delay loop, resolution 100ns
>      Calibrating delay loop (skipped), value calculated using timer
> frequency.. 20.00 BogoMIPS (lpj=100000)

I think it is fixed now and pushed on my tree. Is it possible to confirm 
your boards are working correctly again after the linux-next is updated 
with my latest changes ?

Thanks for the report.

   -- Daniel


-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
