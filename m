Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E404C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 13:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 296D92087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 13:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfARNcM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:32:12 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:32806 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfARNcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 08:32:08 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so8418120vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jan 2019 05:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tT787jebN7BjtZV+4IEE5o9wdiK4Z3vEVKaglFhafo=;
        b=XRB29DSE46XmSgAMgZhgydsRgBOMyfbbvqJTqJVpmMfZAXp8umKxShXmnykXASMham
         5skWTqSA6sa4uQZvQBRCZto3m0HFDQoIU7XGR5pxt9OF7ej3clYAxqfE6QGX61jEXJps
         HSWX9pSGGtfELJMDyw7lY482ZbVI2zrm9GIVigZT3jbPyDDQn5QaoQnD5sGPKGzP1ibj
         sllLFY5pgKCaMQVYK/t3uyx/qAQg4XnuNTUu0qL0pzPxb2JAoYbVCAajAJlybGeQcTVb
         a673DcpkE6v9G63ERVjqGVEZSUwt9kI4BsSaYL1CY/0oLyf6KwgULb4DVDNFHofn1sbL
         DIYQ==
X-Gm-Message-State: AJcUukdFprVrrGXqguRKAIwzA14gKdD6tlWS7pWij2KEkqcwpUZVoxWA
        c8UXeF2c4oZ6Hb0FabccsTJzmK3rj7ORlzIwOsQ=
X-Google-Smtp-Source: ALg8bN6Zsf212RwGWZzHCYSd3pQVmBcm2PSkjJNNZQwbFzsFMH/SLx/xpt5eGqpQ/kQzYgN5op3u29ikIgO0u8DCSQc=
X-Received: by 2002:a67:3885:: with SMTP id n5mr6739362vsi.96.1547818326731;
 Fri, 18 Jan 2019 05:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20190118122536.20000-1-horms+renesas@verge.net.au>
In-Reply-To: <20190118122536.20000-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 14:31:54 +0100
Message-ID: <CAMuHMdWt66viDaMGnFXJD9kH0Rz_GkEjPcPnemy65j0vz69UvA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of SDHI3
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 18, 2019 at 1:25 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Enable HS400 of SDHI3 using the corresponding DT property.
> No further changes are required.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Using "hdparm -tT /dev/mmcblk0"

HS200:

 Timing cached reads:   694 MB in  2.00 seconds = 346.60 MB/sec
 Timing buffered disk reads: 434 MB in  3.00 seconds = 144.56 MB/sec

HS400:

 Timing cached reads:   696 MB in  2.00 seconds = 348.20 MB/sec
 Timing buffered disk reads: 446 MB in  3.00 seconds = 148.65 MB/sec

No real difference.

Note that "dd" gives me very fluctuating results (all for HS400):

root@ebisu:~# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=128 iflag=direct
128+0 records in
128+0 records out
134217728 bytes (134 MB, 128 MiB) copied, 3.20103 s, 41.9 MB/s
root@ebisu:~# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=128 iflag=direct
128+0 records in
128+0 records out
134217728 bytes (134 MB, 128 MiB) copied, 1.15324 s, 116 MB/s
128+0 records in
128+0 records out
134217728 bytes (134 MB, 128 MiB) copied, 1.82701 s, 73.5 MB/s

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
