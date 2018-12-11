Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9E1C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 07:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9167C2082F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 07:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9167C2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbeLKHmR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 02:42:17 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43241 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbeLKHmR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 02:42:17 -0500
Received: by mail-ua1-f65.google.com with SMTP id z11so4793247uaa.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 23:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PK9A+nKycarxEV5vIRiEB3C9ssBTfF2q/72M+PinIv8=;
        b=EykJHzL8j+6/iXgh9InuNK+8lI0lNhI9GjHXszaSQPTZjrNd4YNOzaugyQh6R0O9+N
         v56R+Ch1q05HfLdk19WiAhRwpF9Eo6kDJZyAzzB8YbdTRO89SlSDE8ezPYyuhaDjk3Ie
         mmOkiH8HPzkuW3xotFzJUIrFBgesTjOM/ZTKSMQ0tDt6hKrH86pV5D0e24dCa07Q8UZE
         Fb38F3PAqsTHYxSXD7JIDTtWJbzIIIcRQU6ew4YvPPehmpG0HDoTkKgKgDOxuJe0blim
         yjQ1P9wQf+sYAT2j845qFq96wUNDlCZnQIqtL8LWUeNtYMTDA15sepZmFAufEU33C4vp
         Xr0A==
X-Gm-Message-State: AA+aEWbiuQHiq+5ugK+rngMvsIGCIpnNriWRd+uS3/jop5nyM5tuo/Z0
        Ol7hzR8FDcJZXptg6+UVQ1TcCPGNOE1/1wPBtFo=
X-Google-Smtp-Source: AFSGD/XLIQZLjHj1HIayCzgbccoqI4+T56h3BJJhWsTLPWru8I7MlxjQNF67jFWIrLfmVo5NiTEjiNMqlUpYlD0X50M=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr6598159uae.75.1544514135971;
 Mon, 10 Dec 2018 23:42:15 -0800 (PST)
MIME-Version: 1.0
References: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Dec 2018 08:42:03 +0100
Message-ID:
 <CAMuHMdX6rNc65oN1L4s=6NT4_yaP19vVifAgQRedbtb4uBO2aQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon
 thermal sysfs
To:     Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181211074203.iKbqEMsZ2qGiLEspFZvHbUTi-KymHtDHTwabmV3Of7Y@z>

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
