Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4110C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:42:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BFF6217D8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbeLRHmw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 02:42:52 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38750 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbeLRHmv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 02:42:51 -0500
Received: by mail-ua1-f65.google.com with SMTP id p9so5385559uaa.5;
        Mon, 17 Dec 2018 23:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1bDdU9ymDqRjnXisqEdC14ldbjOHhPP+7Ot2nFGAq4=;
        b=ARwA8GwZYfYw1xAj2XVKB36+0pnxjD1vj2qeEs1VJdQWeQ90DxnRBtxS9rgj2fdUU6
         DidUlT/eUYCli7Vbon+hyJZ7468FHWJ/be1css41mtG461nRYar6brwemwoCwIcjnf0e
         yxPq2wTQFBYMZdcC3wv8taPio3e+m9Z2zOtDxDvYR8KyT1H4sGSep7jl5Ik/ndUG1Ee6
         +ZuSjdGBkz/FP20fP3R+X3oJcipjpFzx0nBviFc+nSlmUIp1YX4YJNbLO84KvTXYVSOx
         nW5gqgTWsl977WhGF5lBxs5LoE2QavNoqyht2dWzUzXypgD84A2QT1p4aPQB9x71TOCg
         sdUQ==
X-Gm-Message-State: AA+aEWbh1Z6Upz4axWqew1S4D1trk/oWg4CE+V6IK99WJRFZYx2oyL72
        LZUTRzXl0gWxK0T9ceLkT4rzhMUaXUXYtNzPoZs=
X-Google-Smtp-Source: AFSGD/WYrMBB+syIJiqFWFLexsMB8U+UCqL228nHy5U4IkNBdMFMkCVPpGmHtcPeJtebUsh0g4tQLPcOqd0NaCc7YEY=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr7110153uad.78.1545118969518;
 Mon, 17 Dec 2018 23:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
 <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
 <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
 <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com> <TYXPR01MB1568A2C057989ADB17FA07B88ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568A2C057989ADB17FA07B88ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 08:42:36 +0100
Message-ID: <CAMuHMdW8otcCzZiHw-QySWNtk=dn=m8FFbH2=2a5u6TN=GZnMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh@kernel.org>, Kumar Gala <kumar.gala@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Mon, Dec 17, 2018 at 8:40 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, December 17, 2018 1, linux-renesas-soc-owner@vger.kernel.org wrote:
> > > Yup...there's the killer!
> > > You'll notice that in mainline RZ/A devices, there is no QSPI driver,
> > > and also the QSPI clock is left out of the list of HW clocks. Otherwise,
> > > as you mentioned, that 'unused' clock would get shut off at the end of
> > > boot...and you're whole system would stop immediately.
> >
> > If you had a simple driver with the binding as I proposed, then it
> > could do the ioremap and clock management. And you could also have
> > specific SPI and flash drivers for when you need to flashing without
> > changing the DT.
>
> I agree.
>
> At the same time, this particular XIP-QSPI HW is now used in the latest
> Renesas R-Car devices, and there has been some talk of upstreaming the
> driver for it (as in, using it in SPI mode instead of XIP mode).
> I'm waiting to see where that ends up, and if I should just use that
> SPI mode driver for the RZ/A series but simply put in a new property like
> "use-xip-mode;" that basically tells the driver to do nothing except enable
> the clock (again) so it doesn't get shut off at the end of boot.

The "clock management" should simply be calls to pm_runtime_enable()
and pm_runtime_get_sync().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
