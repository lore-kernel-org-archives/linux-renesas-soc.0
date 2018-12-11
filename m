MIME-Version: 1.0
Date: Tue, 11 Dec 2018 08:42:03 +0100
References: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
Message-ID: <CAMuHMdX6rNc65oN1L4s=6NT4_yaP19vVifAgQRedbtb4uBO2aQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon
 thermal sysfs
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@sang-engineering.com>,
	Zhang Rui <rui.zhang@intel.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
	=?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
	Hoan Nguyen An <na-hoan@jinso.co.jp>, =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= <cv-dong@jinso.co.jp>,
	Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-renesas-soc.vger.kernel.org>

CCing Marek, since he was recently looking into the driver

On Tue, Nov 13, 2018 at 7:46 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
>
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Gen3 thermal registered by devm_thermal_zone_of_sensor_register()
> and this function does not enable hwmon sysfs extensions.
> This patch enables it to keep compatibility to common systems
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 75786cc..ae172db 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -19,6 +19,7 @@
>  #include <linux/thermal.h>
>
>  #include "thermal_core.h"
> +#include "thermal_hwmon.h"
>
>  /* Register offsets */
>  #define REG_GEN3_IRQSTR                0x04
> @@ -429,6 +430,12 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>                 if (ret < 0)
>                         goto error_unregister;
>
> +               /* Enable hwmon thermal sysfs */
> +               tsc->zone->tzp->no_hwmon = false;
> +               ret = thermal_add_hwmon_sysfs(tsc->zone);
> +               if (ret)
> +                       dev_err(dev, "Can't register hwmon sysfs\n");
> +
>                 dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
>         }
