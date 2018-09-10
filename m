Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36800 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbeIJMlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 08:41:53 -0400
Received: by mail-it0-f66.google.com with SMTP id u13-v6so27473584iti.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 00:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
 <20180903103358.GC20333@w540> <TY1PR01MB17697F04004A7C8CF1D21CC1F50C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdU-CcckKueeT5r9-jCoNr0H5KhzrAMbL4LeFta_fAqWuA@mail.gmail.com> <TY1PR01MB17697A2D3BCA85B3BFC1FE21F5020@TY1PR01MB1769.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17697A2D3BCA85B3BFC1FE21F5020@TY1PR01MB1769.jpnprd01.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Sep 2018 09:48:58 +0200
Message-ID: <CACRpkdad=U5YACQ6k86A4BJo9-U4bC61A0kJ8kONSHu+u3BPyA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        jacopo <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 5, 2018 at 11:59 AM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 05 September 2018 10:37, Geert Uytterhoeven wrote:

> > Have the VxWorks DT bindings been submitted for review to the devicetree
> > mailing list?

> I'm not involved with the VxWorks port, but I am pretty sure that they have
> not been submitted for review.

We have had other cases where deployments on other OSes have been
establishing bindings (even not very pretty ones).

Examples include typically the Power MacIntosh and the original SPARC
bindings.

Yours,
Linus Walleij
