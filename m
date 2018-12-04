Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:32483 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbeLDJnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 04:43:40 -0500
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon
 thermal sysfs
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6ug==?= =?UTF-8?B?44K9?=
        <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz?= =?UTF-8?B?44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
References: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdVXN3ZpXwbODrOWThCE+y0mxkOriDOjDGo2rXEG1asOaw@mail.gmail.com>
 <20181113115718.327dw3maw26bzkcd@ninjato>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <399490a1-e54b-2d99-bec0-c1b780155412@jinso.co.jp>
Date: Tue, 4 Dec 2018 18:43:36 +0900
MIME-Version: 1.0
In-Reply-To: <20181113115718.327dw3maw26bzkcd@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Geert-san, Wolfram-san

I'm sorry for the delay at the comments of this patch.

And I think it's not hurry!

> +               /* Enable hwmon thermal sysfs */
> +               tsc->zone->tzp->no_hwmon = false;
> +               ret = thermal_add_hwmon_sysfs(tsc->zone);
> +               if (ret)
> +                       dev_err(dev, "Can't register hwmon sysfs\n");
> +
>                  dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
>          }
>
> You forgot to call thermal_remove_hwmon_sysfs() in the .remove()
> callback?

I got it, Thanks!

On 2018/11/13 20:57, Wolfram Sang wrote:
> Hi Hoan,
>
>> +		/* Enable hwmon thermal sysfs */
>> +		tsc->zone->tzp->no_hwmon = false;
> A driver diving so deep into core structures always looks suspicious.
> Questions I have:
>
> 1)
>
> We have that code also in rcar_thermal.c, but the commit introducing
> it[1] has a reason which does not apply for this driver, or?

This is not the reason to apply this patch.

I would say here are the general Linux systems, or as if the systems

that thermal was registered by "thermal_zone_device_register()".

The Linux community has developed tools that use this, such as 
"lm-sensors",

my Ubuntu and rcar-Gen2 are still compatible with lm-sensors but Gen3 
does not.

Although I do not want to say paradoxical that the kernel drivers must 
be compatible

with the user-space applications.

> 2)
>
> of_parse_thermal_zones() intentionally sets this flag with this
> comment:
>
> /* No hwmon because there might be hwmon drivers registering */
>
> Why does it not apply for us?
I think so it should be registered separately.
> 3)
>
> If it turns out, we really need it, there should be some thermal core
> helper or flag for it, I'd think...

Yes, It up to you!

> Regards,
>
>     Wolfram
>
> [1] 64a411e8042e ("thermal: rcar-thermal: enable hwmon when thermal_zone_of_sensor_register is used")
>
Thank you very much for your comments :-)!

Hoan.
