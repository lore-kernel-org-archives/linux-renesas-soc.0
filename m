Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B823AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 08:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94F56214AF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 08:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfCLIit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 04:38:49 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40005 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfCLIis (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 04:38:48 -0400
Received: by mail-ua1-f68.google.com with SMTP id t7so504602uap.7;
        Tue, 12 Mar 2019 01:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5+qrnSszdirv3pkbbKn/dAtkSvcjHGpiLnigmbMdyA=;
        b=tqDvFqdrvfLy79epUw8S6EEtZx/wZ0FOoe4SpDpdoivGaufRiqOaNtx1o7tL3RbhfS
         s7ptEr7WfMy69OdVZCUn2S+/Cwnz6fX4IGWJBqrpc/2Se8uabAA9Ogj5VwW7BmZsfhG8
         k5xZQkh2EWnYk8iTQLfaqhm+BBDb8DqVku9oHSETXqTIH9Ts2pKO7FNxbCmM2u6vW3aM
         jz6uDTyK/7CxFgGxG+o8CJY5ynYDyzGi4MWinZ9UmjfFpgFHarOZR9BUDjFSEzqVNIoV
         WyCRKzD0q4Dv7xiRl7iZJHxhbKiWYxlTBgJhPPB6LlnyqPyHFGfrw0+rP8k2PwtTIu1T
         f8AA==
X-Gm-Message-State: APjAAAWTgr2IFwDJBr/USW8LgxIiXyzR1x8H06wlZ7ltH9sq55ZP3yLn
        6tr2y/6bQV72ViAlcwm+0XOerVkvlpLRHwXA+9c=
X-Google-Smtp-Source: APXvYqwb3DI8MU3cdd9WOiCvBc+bIKGyq6jb2ErLLAXR/5JZiv0z0axHxeOurx/9zoRN2YUJ9ECZUv/GymicakYNl4A=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr18967082uao.20.1552379927612;
 Tue, 12 Mar 2019 01:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Mar 2019 09:38:35 +0100
Message-ID: <CAMuHMdU9sCKnyz=qHKDdP1YHM+qGoZrkYAVJwYcJ5O7c=LHTjA@mail.gmail.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Mar 12, 2019 at 4:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch fixes deadlock warning if removing PWM device
> when CONFIG_PROVE_LOCKING is enabled.
>
> This issue can be reproceduced by the following steps on
> the R-Car H3 Salvator-X board if the backlight is disabled:
>
>  # cd /sys/class/pwm/pwmchip0
>  # echo 0 > export
>  # ls
>  device  export  npwm  power  pwm0  subsystem  uevent  unexport
>  # cd device/driver
>  # ls
>  bind  e6e31000.pwm  uevent  unbind
>  # echo e6e31000.pwm > unbind
>
> [   87.659974] ======================================================
> [   87.666149] WARNING: possible circular locking dependency detected
> [   87.672327] 5.0.0 #7 Not tainted

[...]

> This warning occurs because pwmchip_remove still keeps pwm_lock
> when removing sysfs. That's why it leads to that conflict.
> Hence, this patch unlocks pwm_lock before removing sysfs.
> Also, pwmchip_sysfs_export() doesn't seem to need the pwm_lock
> held so that to achieve consistance between export and
> unexport this patch also modifies it.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> [shimoda: revise the commit log and code]
> Fixes: 76abbdde2d95 ("pwm: Add sysfs interface")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

Looks good to me: class_find_device() seems to use its own locking in
the class to protect against concurrent modification.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
