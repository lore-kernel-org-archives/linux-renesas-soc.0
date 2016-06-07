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
Message-ID: <57574976.6000400@linaro.org>
Date: Wed, 8 Jun 2016 00:23:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi-LzYTnK4nmLip8a7WVPu7BjkeZ9588Uq=_O_i58yag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/07/2016 11:54 AM, Geert Uytterhoeven wrote:
> Hi Daniel,

Hi Geert,

[ ... ]

> Using "earlycon keep_bootcon" on koelsch (this doesn't help on arm64)
> reveals it's stuck at:
>
>      clocksource_probe: no matching clocksources found
>      sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
> 21474836475000000ns
>      Calibrating delay loop...
>

Ok, so the "renesas,cmt-48-gen2" is not impacted by the changes because 
it uses the platform approach. Very likely, the issue is coming from the 
arch_arm_timer failing somewhere.

Or I added a regression and the timer is wrongly returning an error, or 
the error is always there and now it is caught.

Can you give the traces before 'clocksource_probe: no matching 
clocksources found' ?

   -- Daniel

-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
