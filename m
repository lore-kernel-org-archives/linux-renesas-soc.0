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
Message-ID: <5756B178.2000607@linaro.org>
Date: Tue, 7 Jun 2016 13:35:20 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi-LzYTnK4nmLip8a7WVPu7BjkeZ9588Uq=_O_i58yag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/07/2016 11:54 AM, Geert Uytterhoeven wrote:
> Hi Daniel,
>
> On Wed, Jun 1, 2016 at 10:34 AM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> The macro CLOCKSOURCE_OF_DECLARE is widely used in the timer drivers.
>>
>> Basically, this macro is defined to insert in a table a tuple name,function.
>> This function is an init function called when the name matches the DT node and
>> its signature is:
>>
>>          typedef void (*of_init_fn_1)(struct device_node *);
>>
>> It does not return an error code.
>>
>> That results in the clocksource-probe not being able to figure out if the driver
>> was correctly initialized or not, the different drivers to act as they were the
>> only ones on the system (panic, instead of failing gracefully), and duplicated
>> code for error reporting.
>>
>> This series initiates the logic change and centralize the error handling in the
>> clocksource probe code.
>>
>> In order to do the changes little by little, a new macro was introduced:
>>
>>   CLOCKSOURCE_OF_DECLARE_RET()
>
> As I have no other thread to reply to, I'm using this related one.
>
> commit bcbe219f9306da478b77e705a7273843c2660d7b
> Author: Daniel Lezcano <daniel.lezcano@linaro.org>
> Date:   Tue Jun 7 00:27:44 2016 +0200
>
>      clocksources: Switch back to the clksrc table
>
>      Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
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

Ah, thanks for reporting.

I will fix it.

   -- Daniel

-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
