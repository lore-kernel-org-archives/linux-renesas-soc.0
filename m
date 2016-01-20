Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <877fj44xk5.wl%kuninori.morimoto.gx@renesas.com>
References: <877fj44xk5.wl%kuninori.morimoto.gx@renesas.com>
Date: Wed, 20 Jan 2016 08:07:52 +0100
Message-ID: <CAMuHMdW-yN0_Leg8Vjv=9CNEfmmiOTBkyJ_dOSkysDOP_V9ckg@mail.gmail.com>
Subject: Re: [PATCH] thermal: core: don't call unsupported trip on thermal_tripped_notify()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Eduardo Valentin <edubezval@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>, Simon <horms@verge.net.au>,
	Magnus <magnus.damm@gmail.com>,
	Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Jan 20, 2016 at 6:45 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> It needs to check maximum trip size before using it.
> Otherwise, each driver might be called with unsupported trip.
>
> Reported-by: Magnus Damm <magnus.damm@gmail.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/thermal/thermal_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 7f7a3ca..9761f49 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -461,6 +461,9 @@ static void thermal_tripped_notify(struct thermal_zone_device *tz,
>                 kobject_uevent_env(&tz->device.kobj, KOBJ_CHANGE, msg);
>         }
>
> +       if (tz->trips <= trip + 1)
> +               goto unlock;
> +

Thanks, I assume this will fix the "rcar_thermal e61f0000.thermal: rcar
driver trip error" messages.

However, I don't know if it's the right fix, cfr. my unanswered question at
https://lkml.org/lkml/2016/1/5/107

>         ret = tz->ops->get_trip_temp(tz, trip + 1, &upper_trip_temp);
>         if (ret)
>                 goto unlock;
> --
> 1.9.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
