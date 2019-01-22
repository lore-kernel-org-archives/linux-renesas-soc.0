Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E6BC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15A2B20870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfAVK6o (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 05:58:44 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34557 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfAVK6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 05:58:44 -0500
Received: by mail-vs1-f67.google.com with SMTP id y27so14470649vsi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 02:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhOC+pvAZ+VSX0Q/AL/Oa5MZRHZeiblym2Vc+17tR3s=;
        b=tCMuMmmAey4+kICyc/burU/ynjcBTA/sGRGzV0eVrFTQFTSUBZY0C33IAAK8apsNiJ
         35rlfAvc0gG4KM5SMywQtvajCxbWGrnuBFjqclHpyYTRIB9kcfFaVTo/IpJGXQ9VQlze
         rM5b1lB+kcLWQUG+ResVdpINw72qJnNDOeSMtzbDv9R9wQ4PJ4FpFlbFLl7fnmdW48WE
         93kFQo+rUSIqKnv+lPS23+FeRGcN+DoepbZrszPvr3brG+BHrWCOzVLhAlBXcuN3nvnk
         xeRE//CTKrsIt8dXDs1exuKmukTEIS8FUEVnczL7m4ERsQ1y+EeGm+ADhCvtdP9kh90J
         PNGw==
X-Gm-Message-State: AJcUukf8kxjO9bGTb5NVmBYAwYJ9v3R+Cg9TEz5/Vrhk6HxOemYuIR+v
        9AInVnl2TXe+AKnm1lXwDZDnmThp9ruf98lnMs4=
X-Google-Smtp-Source: ALg8bN76VBTjFm74QGZEHsOeVqbZqvHzh31P8Wi7Co/W//DtfM6SDefchP0PHjEl1Sz5b4VsS3efnXFYnRdLYPuNoU8=
X-Received: by 2002:a67:3885:: with SMTP id n5mr12013080vsi.96.1548154723521;
 Tue, 22 Jan 2019 02:58:43 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 11:58:31 +0100
Message-ID: <CAMuHMdUXKCzr33WNAznQN9v699vxg3sic2s78RxhVXfJePL1wg@mail.gmail.com>
Subject: Re: BUG report on next-20190122: could not probe the ravb driver
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jan 22, 2019 at 11:23 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> I got a report from test team that next-20190122 could not probe the ravb driver as the following.
> The test team is using H3 ES3.0 Salvator-XS and I could also reproduce this issue on M3-N Salvator-XS.
>
> [ 3.005557] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
> [ 3.013863] libphy: ravb_mii: probed
> [ 3.017743] mdio_bus e6800000.ethernet-ffffffff:00: error -2 loading PHY driver module for ID 0x00221622
> [ 3.027283] ravb e6800000.ethernet: failed to initialize MDIO
> [ 3.033157] ravb: probe of e6800000.ethernet failed with error -2
>
> # I didn't investigate this issue yet though...

Looks like other people see this on other SoCs, too.
But I didn't see a solution mentioned in those threads.

FWIW, I'm not seeing it with the soon-to-be-released renesas-drivers of
today, so the breakage is not in net-next.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
