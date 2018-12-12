Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E98C65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 17:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B521F20851
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544634638;
	bh=oTnR7+t38A3ipqEK/5nw7D4exj2O4VTgbQDjlEoZJIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=LaYJg7Nyg29WkRaFDApdV2s8TJ6CRs2k4NGizfLRFmXRrG9xBIGk09gT0IYiuiGzu
	 Al5KOIiEla1YPxH8OacZ68qkG7lc5JwFUP1XkOBUe6HgYrF73NLJoT0mQrfabOyZll
	 GFVVY9BMQBIfsq1hzpWH4sQ7jIQg7CxtL3lYKQ0g=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B521F20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbeLLRKi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 12:10:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbeLLRKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 12:10:38 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12D5A2086D;
        Wed, 12 Dec 2018 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544634637;
        bh=oTnR7+t38A3ipqEK/5nw7D4exj2O4VTgbQDjlEoZJIE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RtYf59ei6ydt3RT9JlT4jSleQBbwf3KkpGPOkN8jFcc7oPmkwaQPE+m4Zt09lzzSe
         lK17kLJ/kTfqWK9vNNT77yURBKwY2R9Kik/DfDBEP/GbYYkpzOtbB6g97iy7Qw7j4x
         Q0uWc5Pru0Nkc41sW4GfyDdCNTPbmm1Iw6Y86EeQ=
Received: by mail-qt1-f172.google.com with SMTP id n21so21306520qtl.6;
        Wed, 12 Dec 2018 09:10:37 -0800 (PST)
X-Gm-Message-State: AA+aEWaGyemvGPfmqAq5ffWrVvf0twti9x1HyfTUAhhP6LV7v7jgfqEp
        4af2PNsSqvAe5GgfTuCWiFGyEj3zIB4iaQCS3w==
X-Google-Smtp-Source: AFSGD/WxaLNtKZVNf5w0xip48sRa/rO6GYcW35lLJmvc6D+DUhIps8hR48RtAai7qSM+gYVsDYEdCtQpk5t6Xcqi2io=
X-Received: by 2002:aed:29a6:: with SMTP id o35mr20141114qtd.257.1544634636265;
 Wed, 12 Dec 2018 09:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 12 Dec 2018 11:10:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
Message-ID: <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Kumar Gala <kumar.gala@linaro.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+Kumar who was just asking me about this exact problem.

On Wed, Dec 12, 2018 at 7:59 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Tuesday, December 11, 2018, Rob Herring wrote:
> > > +   /* Cramfs XIP File System in QSPI */
> > > +   qspi@20000000 {
> >
> >
> > > +           compatible = "mtd-rom";
> >
> > This should be the actual Quad-SPI controller and then a flash device
> > underneath it. It may work as-is initially, but eventually won't you
> > need the flash details?
>
> Not really.
> The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees
> the QSPI flash as a linear read-only address range).

Yes, those controllers are becoming pretty standard.

> Basically, u-boot sets up the QSPI to look like a ROM area, and that's
> it. Everything is running directly from that QSPI flash, so you can't
> make any modifications to it while running, otherwise the whole system will
> go down. Therefore, there is no need to know anything about the actually
> Flash that is connected, because you are never allowed to interact with it
> (or even query it on boot).

Okay, but these days u-boot uses DT itself. So how does u-boot know
how to set things up? It's going to need to know what controller and
flash details. Or how does one do a flash update (in the field)?

I think it would be better to have a property to say the flash is
already setup and just use it. Or maybe it can be done with
compatibles:

spi@1234 {
  compatible = "vendor,soc-quadspi", "mmio-spi";
  flash@0 {
    compatible = "some-flash-part", "mtd-rom";
  };
};

Now the problem is how to define the address range as SPI flash
devices are already defined to use SPI chip-select numbers. The
easiest option from a DT standpoint is just look at the parent reg
property and figure out the memory range (typically there are 2 and
you want the big one). Or you could have some simple driver that knows
which reg range to get for specific compatibles.

Rob
