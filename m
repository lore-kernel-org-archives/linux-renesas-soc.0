Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BEDC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B800F206DD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbfBENOb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:14:31 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:35201 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfBENOb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:14:31 -0500
Received: by mail-vk1-f194.google.com with SMTP id b18so772086vke.2;
        Tue, 05 Feb 2019 05:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjsKMtjeBaPY+hca2CggVZJLoUDRAAlbzPtDu1YIl6Q=;
        b=uJ8lfu12cK2fjWkXjFFCS20j4Ps6Zjj6lUv03A56zAL1FwC1kZgR9sSAmR7SCiiUHj
         y4WFzIIjWUyQp0OBIRqHjFdHvQWVRF5Hkcb81+gX1mdEeXnjNHZT+mgxcbsjKxc1t4IO
         M+YSBwDgFkY18vA1icl6ACcsOP6ka4SMm1/SCDBA5ZiTX0O0RFegiYl9XYXEH07TikIz
         CVRvcdKaw/Hm02EN2SjkT8Y2E2JaYAJOU07HNAoXRAsPuIcx0mGBQrx5BzMQMJ1MwDAo
         u2Vpyi5f6jlkWaAqsTvNqK4DnnwNnbspv6ME71igbEpKgRW1XY+Wb9IfI67MR9k0adOh
         Zk/g==
X-Gm-Message-State: AHQUAuahROAKqfIT+rMs+oQ4TqHT8oSl85ypAA1lGfrf8ig8I+Tscpxf
        f0O5io1HRynOQUljf7tgCK+9f7HSgoWAWE4Er10=
X-Google-Smtp-Source: AHgI3IY41+tX2GbO/yTmsh6tBySrZGzz9LxjXnm868MEAZhjw37dv4eCxovdWK4Kno/3yQLl0ijbyZ/36gGYKRjvek8=
X-Received: by 2002:a1f:914a:: with SMTP id t71mr838601vkd.74.1549372470301;
 Tue, 05 Feb 2019 05:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com> <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 14:14:18 +0100
Message-ID: <CAMuHMdUgTs5JyiUq98CCtcRSFD1f9pmm8wXV0Q_AaGp0VrcHoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: sh_mobile: sort compatible entries
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 4, 2019 at 11:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Makes it easier to add new ones.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
