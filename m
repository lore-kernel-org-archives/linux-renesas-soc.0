Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33356 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbeJCOW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 10:22:29 -0400
MIME-Version: 1.0
References: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Oct 2018 09:35:05 +0200
Message-ID: <CAMuHMdVmqxdgnaAV2RjWbPby=QDHFeJN2QcHmCv=joSHnU=9PQ@mail.gmail.com>
Subject: Re: [PATCH v2] thermal_hwmon: Fix the 'No sensors found' error after
 replacing the parameter NULL by the actual device
To: =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>,
        Eduardo Valentin <edubezval@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC Eduardo, Enric, Günter,

On Wed, Oct 3, 2018 at 9:27 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Formerly, when registering the hwmon device, we pass NULL as the device. It's not a problem.
> Recently, the developer has replaced the parameter NULL as the device by the actual device.
> This causes the "No sensors found" error. Therefore, instead of using the device we will use pass
> the parent of that device as parameter. This will sync with the processor on the hwmon core.
> This patch is to fix this error.
>
> This patch is based on the v4.19-rc3 tag.

Fixes: f6b6b52ef7a54160 ("thermal_hwmon: Pass the originating device
down to hwmon_device_register_with_info")

> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
>         INIT_LIST_HEAD(&hwmon->tz_list);
>         strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
>         strreplace(hwmon->type, '-', '_');
> -       hwmon->device = hwmon_device_register_with_info(&tz->device, hwmon->type,
> +       hwmon->device = hwmon_device_register_with_info(tz->device.parent, hwmon->type,
>                                                         hwmon, NULL, NULL);
>         if (IS_ERR(hwmon->device)) {
>                 result = PTR_ERR(hwmon->device);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
