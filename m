Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36424 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752971AbcIMPKX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 11:10:23 -0400
Received: by mail-wm0-f45.google.com with SMTP id b187so450865wme.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2016 08:10:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165D0EE862CCCFD713181938AFE0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160912141507.6837-1-chris.brandt@renesas.com>
 <20160912141507.6837-2-chris.brandt@renesas.com> <CAPDyKFqdznJ4xr5=L862uOfvqjsRpR3d+yRWtN1-8H5ZvP9GeQ@mail.gmail.com>
 <CAMuHMdVGgWaVcC4Pfuf0NSTpU4ahdEg6Q7iKZ1n+mb7KexE6yg@mail.gmail.com> <SG2PR06MB1165D0EE862CCCFD713181938AFE0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Sep 2016 17:10:21 +0200
Message-ID: <CAPDyKFp1eSyVAnn4JohR=Cx0VeE-5U8eY5GVQA+ae0P-vDJJ8w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mmc: sh_mobile_sdhi: add ocr_mask option
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13 September 2016 at 15:50, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Here's a question:
>
> The DT regulator method is good if you want to be able to control the regulator at run-time by the system.
>
> But for MMC and SDHI, why isn't there a way to just set the OCR voltage in the board's DT if it's fixed (other than making a fixed regulator node)?
> Why isn't there a mmc-ocr-mask property? That's really what I want and it seems like it would make a lot of dts files more simple.

Because, if you have an external regulator feeding the mmc with power
you should set it up and use it.

Now, we do have cases where it's actually the MMC controller that
manges the power to the card. So no external regulators being used.
For these case we have the "voltage-ranges" DT binding, but I don't
think you should be using that for these cases. :-)

Kind regards
Uffe
