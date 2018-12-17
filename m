Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE89BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3E8620874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732697AbeLQN2A (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:28:00 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34988 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732530AbeLQN2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:28:00 -0500
Received: by mail-ua1-f67.google.com with SMTP id d2so4411282ual.2;
        Mon, 17 Dec 2018 05:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MQ5XPudCqK0rROsykO0vnnpSXP4su7j4qzNKEokOU0=;
        b=JWF50qYge484oiT1cEUd1JHLyW/SfidP/qUBA+WXIceVmpZ61BCeGY0Qku1gh6bfi+
         ZlsaEuUC8B1V69pk+wEtoJIafcMgo0TaUxDlLzInKiTuT3Z4306cDml8OxleDdfk8BKs
         ulDRCBsqTbJ+I+33BFigtjrAsYaUpBL9FkEGuXMmpoPmkslAkuggb8dtEiCteVztf5a0
         H9Upm0Mx9KkwM01UTd4IzXhR3Zbo+PO1Hej8FkViel/thHRvYgz2kgUSQjMJCufkuw7v
         8Vpj4sZIkBvCoSiV0djvfFeuTMh+ADGehU/3ThOaPQY9mb9Ql5T+yjikvi7vPnmWIzQY
         JsMQ==
X-Gm-Message-State: AA+aEWYa7VorS69lWQqQBT8M5Tejcdh8My/4+bezT4CLdsNYZP15lHa/
        hurj1lc/PZcFgYJ0O5R+CruOEB+6soaI+9Or/v0=
X-Google-Smtp-Source: AFSGD/WGXNfuZ8q+HpTDeG6HEjQpilpACw4UfpirzUTezXOy/HV+GRYA9nlazmDl5PJdv+ls1hv6DWnjWP3/VjEpfgM=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr5956580uae.75.1545053278973;
 Mon, 17 Dec 2018 05:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-3-geert+renesas@glider.be> <20181217132241.4lbaeshn2rnlhjqe@verge.net.au>
In-Reply-To: <20181217132241.4lbaeshn2rnlhjqe@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 14:27:47 +0100
Message-ID: <CAMuHMdUHUUEd0KQ3NP4M_hiYuwcyYRMiET3BamC4Qmrc3oEBBA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] serial: sh-sci: Fix crash in rx_timer_fn() on PIO fallback
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Dec 17, 2018 at 2:22 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Dec 13, 2018 at 07:44:42PM +0100, Geert Uytterhoeven wrote:
> > When falling back to PIO, active_rx must be set to a different value
> > than cookie_rx[i], else sci_dma_rx_find_active() will incorrectly find a
> > match, leading to a NULL pointer dereference in rx_timer_fn() later.
> >
> > Use zero instead, which is the same value as after driver
> > initialization.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This looks good so to me long as dmaengine_submit() doesn't return 0.
> Is that the case?

include/linux/dmaengine.h:

/**
 * typedef dma_cookie_t - an opaque DMA cookie
 *
 * if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error code
 */
typedef s32 dma_cookie_t;
#define DMA_MIN_COOKIE  1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
