Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A59C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 19:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C38DA2080F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 19:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfBETpR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 14:45:17 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33824 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfBETpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 14:45:17 -0500
Received: by mail-vs1-f67.google.com with SMTP id f20so57385vsr.1;
        Tue, 05 Feb 2019 11:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fOSiFdGkH9lc7eSzYcT+46uM6Q5C8uuGN722fQ11Uw=;
        b=SQiQLdbMZAVRP6xQwhIzQ0UwygA7QckiearSjQHRwH4bHngQwJwxjcbZACifpSM+re
         AtVGmo4ate6iISVZRGc+r0/cPrGW1ZxV4uhpnJ/3rHnfN3mPMkcmkVGNI4vw1E87W9/J
         hv7j/sP78ihcri3RCRcAac30BO87AGJ0MzMSdx+2u8bF5fY3evgr9FmnCo8E+ze52FSx
         vRuMVXFrEzf/P6H9WKoOy2LMyFugoFDw1U2jUw3KkL0NVHz+ugF4hTFZcCVcrzoQaxku
         lHFg4vBRtibXBv6Ek/ACFj4FOA8lznsUCdMh0ZOcQ9CWVZY810D9WToyBfmtUTeLHo9J
         6DCA==
X-Gm-Message-State: AHQUAubiIGoocSepgcShbSg7xHs/0ioN6F+FDwvyHwkZFZ/0alNJO5Q+
        tiyYCtIjmuP52ammnIiNqlgUIIKz/eMSFqnpjICoo632
X-Google-Smtp-Source: AHgI3IaFrxNVF+MTn1UEBApZjl33IfdrqDMSKXzxptBoEKTJZebdHy827oIOC5OVhmHdeN2E+ztR4eKiMYMQZAz3xA0=
X-Received: by 2002:a67:3885:: with SMTP id n5mr2458815vsi.96.1549395916106;
 Tue, 05 Feb 2019 11:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20190205170046.5046-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190205170046.5046-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 20:45:04 +0100
Message-ID: <CAMuHMdU78sC8OBwUnjWQQtgy5fUTWFB1mver=Yq6tWH9DQ0Odg@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: use new clock calculation formulas for Gen2
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Feb 5, 2019 at 6:01 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We measured the clock on a Lager and an Ebisu board. The new formula
> gives better results for both. So after Gen3, switch to this formula for
> all Gen2 SoCs.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, according to the datasheet, R-Mobile APE6 uses the same formulas
as R-Car Gen2, but you'll be able to verify that soon ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
