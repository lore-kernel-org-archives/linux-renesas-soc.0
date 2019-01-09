Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4420FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 23:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04105206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 23:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQ7BXyWd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfAIX2W (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 18:28:22 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44978 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfAIX2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 18:28:22 -0500
Received: by mail-oi1-f194.google.com with SMTP id m6so7771644oig.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yq0u4880shqeHACPW1JDK23gmXl2LA5Liy7CXozcygI=;
        b=FQ7BXyWdcVF6PQr9hEpsvjYpSlPwiAwbiA/rdfOfpgrq+JXtBrLdMnr2MjifWmPyrM
         Zuuv01mv6drTvzNYRiYGFuTOvWnpMa368nc5YyIdCb9qHULeR+l0qJnDcO5JxtZiYnb4
         Aa2zLeI3QsXxRu7DrD8bNOGdWACjTNrfPDP9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yq0u4880shqeHACPW1JDK23gmXl2LA5Liy7CXozcygI=;
        b=FfagUEHVPWu2S+qiC3dLY1MYtcJ6BGmze5y3eOlGu69FYrRyx6sjS1bWtxZ+wTURDQ
         zjJDF1N1Fz3QWQqAAmkZOeOIhMSorAdKRKSeNqB+bvy/dfsPaK2fWpJjJeS1bFoJIur7
         tGfD0SdyrgT0CaUP3ia8O7+NClboINhbUDW9l45YStuSQB/o0msMDSeHM/sMlsyAnNGv
         0pmfM3GMffTK1ZxIzrA1TSy6Ee0GMgts5ADSRxEIcDRtPVczpzNvPbP+IcaJsxGWdgFW
         JZkErZjLtFMrRG3f+via9t4dsXC9U8/A3XeKJtZiJeKmOknAOz8yROwSVkaZwXvWHF0I
         eeeg==
X-Gm-Message-State: AJcUuke3j062bPVi19evzwsmgsFR+Y1B2FnFlSPJOF/a+eZVAZ3GvR6O
        uwNjrXjCmAcqoGnlaayitJ5Ll9mT2s6+Klm5GH+VSw==
X-Google-Smtp-Source: ALg8bN7M5qxxd+lVYJ/5ijsg1KFk3e1zGERIXJAijDMtfV4XuuTXF0P7Nk68OfnGUKjXKXTJwhOEMnR0KwtTo8W+wzk=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr5338650oic.332.1547076501486;
 Wed, 09 Jan 2019 15:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be>
 <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com> <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
 <CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Wed, 9 Jan 2019 23:28:10 +0000
Message-ID: <CAFEAcA9-eo7_1Wm20JkwCs_yG-r6v3aw19T0BVpp6qePw+JnmA@mail.gmail.com>
Subject: Re: [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for instantiating
 generic devices
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Auger Eric <eric.auger@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alex Williamson <alex.williamson@redhat.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

So I should start out upfront by saying that I'm aware that
the reality is that people do want to do passthrough with
this kind of hardware, and that's not an unreasonable
thing to do. I just don't really like the way that pushes
the software into having to do ugly things...

Overall I'll let Eric call the shots about how well this
feature fits into our sysbus-fdt support; he knows this
code much better than I do. (I would have preferred us
not to have sysbus-fdt passthrough at all, in an
ideal world :-))

On Wed, 9 Jan 2019 at 16:30, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 9, 2019 at 5:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > whitelists for the devices we want to allow passthrough of and
> > that we've tested to work.
>
> In the end, this will become a loooooong list (SoC x devices)...

Well, yes, but it deters people from trying to do passthrough
with hardware that's not designed in a way that makes
passthrough reasonably supportable at a software level.

> Reality is that on embedded, on-SoC devices are usually not on a PCI bus.
> But IOMMUs are present, and virtualization is wanted.

I don't insist on PCI. Probeable, and consistent in
terms of what they provide and how you interact with
them, is what we want. Embedded on-SoC devices are
generally neither. (The host kernel could in theory
provide an API that exposed only devices that were safely
pass-through-able in a consistent way, I suppose, but it
doesn't, or we wouldn't be having to fish through the
device tree nodes making guesses about what's safe to
allow and what isn't and having heuristics about not
providing clocks info being ok if we think the clock
might only be used for power management...)

thanks
-- PMM
