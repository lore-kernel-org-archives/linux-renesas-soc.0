Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36332 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755207AbeDZM6E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 08:58:04 -0400
Received: by mail-it0-f50.google.com with SMTP id e20-v6so23593595itc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 05:58:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB17691AADC510B417E3F6E49DF5B50@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1523609472-4481-1-git-send-email-phil.edworthy@renesas.com>
 <CAFHUOYziPaZC-Zcb7rXqC9p24H+CU4wK4NQShQkYLgH7c5mVwA@mail.gmail.com>
 <TY1PR01MB1769DB39F986BEADEF61F8C9F5B30@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAFHUOYzPO+99HMLV7i1=ZoQG3vKRp2v5GzJdpW9yoWovx8D91Q@mail.gmail.com> <TY1PR01MB17691AADC510B417E3F6E49DF5B50@TY1PR01MB1769.jpnprd01.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Apr 2018 14:58:02 +0200
Message-ID: <CACRpkdaCnJw2y42txr1vC_fdPKT4bfdG_rrpEhwdL8HQULT-YA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: dwapb: Add support for 1 interrupt per port A GPIO
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Hoan Tran <hotran@apm.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 12:03 PM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:

> Since I've already got some reviewed-by and acks for v4, I'll leave it to Linus
> to decide if he wants me to roll your changes into this patch or for you to
> submit a separate patch.

Just
- Add the reviewed-by and ACKs
- Fold in Hoan's fix
- Resend

We are always a bit fuzzy around the edges with carrying ACKs etc
forward for new revisions. Surely that is fine with this minor
revision for ACPI.

Yours,
Linus Walleij
