Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F840C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 08:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D62192082F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 08:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbfBLIbx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 03:31:53 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46845 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbfBLIbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 03:31:53 -0500
Received: by mail-ua1-f65.google.com with SMTP id j8so578499uae.13;
        Tue, 12 Feb 2019 00:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+KzK1gJ7x3L0edtYBXTA6WLxSaZKiby9WQHQhRfyvk=;
        b=GiehwZbNppqqR0iHIS8TpmPI33C6z4F2qwanXOsoQj2N7bLdpIxU4JFZguEguhgNz1
         /7CaiwUBq5loqvFlpsCOqUNzvxav0Vw7h5GfvVReAFiXpgT452/2N9Xn9+UDXPjEk3al
         fFY+5JQnKAhHJfgZpsPKK9l3Os47ztko05DoQ7y273D+YCvQz9CQanPG4B6+4Z4jP0eA
         xKN27KdXGI+CX8hAgq5D81gHOTPDaIY6zh9WrdYp3ZDAhigOTdPG6OgUMKM/pI+VhqMh
         P46FEGKYdF44UYQ0k8yugPxqm8V06WQEH0DsPZgrPr71SWbpc2rKncEFSwTsXPp2bic+
         hABA==
X-Gm-Message-State: AHQUAubmEvBkZi0lyfy4Y572WizMaHIWCZXfuvrGSMgqxYflZR8HTTC1
        jhalMEVx+GF3yUt2QUct2a5gTeVCPhLSzNXhWQM=
X-Google-Smtp-Source: AHgI3IaA0jSlrUfAucJkbY2lO8J9Tbf630jv9A9fLlAGzMSo4XfYOMZWQ2aIIR0SXsQXGxnXGZG/xSC0WupVcvKxNL8=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr1034434uaa.75.1549960312260;
 Tue, 12 Feb 2019 00:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX=HVBYwRT8otZVs0WaOnjLLWrH8RQZyXCH8_Ro11Muaw@mail.gmail.com> <20190211205957.vtu57sslnc2pn6cd@ninjato>
In-Reply-To: <20190211205957.vtu57sslnc2pn6cd@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Feb 2019 09:31:39 +0100
Message-ID: <CAMuHMdUFsMa4+FthqittPEG3u3DgZOphz+_CFqu6epSWJcJxSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration' injector
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 11, 2019 at 9:59 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Feb 11, 2019 at 11:30:56AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 21, 2019 at 3:29 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > Here is a fault injector simulating 'arbitration lost' from multi-master
> > > setups. Read the docs for its usage.

> > > +       struct i2c_gpio_private_data *priv = dev_id;
> > > +
> > > +       setsda(&priv->bit_data, 0);
> > > +       udelay(200);
> >
> > Please add a #define for this value.
>
> Sure thing, this was a typical RFC marker :) It is now calculated based
> on bit_data.udelay and has a comment.

But that value bears no direct relation to the transfer speed as used by the
master to interfere with, right?
Still, you have to guess anyway.

> > > +DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitration_set, "%llu\n");
> >
> > I think you can drop the format if you don't provide a "get" method.
> > Or just implement the "get" method, too ;-)
>
> Any pointer for that information? I seem to recall that the format
> string is also used to parse the user string to the set function. I
> sadly can't find that documented, but all the helper macros in
> fs/debugfs/file.c have a format string, too, even if WO.

fs/libfs.c:struct simple_attr {

        const char *fmt;        /* format for read operation */

It's being parsed using simple_strtoll(), so it takes whatever format is being
passed by the writer.

Perhaps you were confused by the term "read", which is from the point of
view of userspace, not of the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
